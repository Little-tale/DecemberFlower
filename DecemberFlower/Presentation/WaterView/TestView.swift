//
//  TestView.swift
//  DecemberFlower
//
//  Created by Jae hyung Kim on 11/23/24.
//

import SwiftUI

struct RandomTextBoxAnimationView: View {
    @State private var textBoxes: [TextBoxModel] = []
    @State private var isAnimating = AnimationType.start
    
    enum AnimationType {
        case start
        case on
        case out
    }

    var body: some View {
        ZStack {
            Color.blue.edgesIgnoringSafeArea(.all)

            randomView
        }
        .onAppear {
            generateRandomTextBoxes() // 랜덤 데이터 생성
            withAnimation {
                isAnimating = .on
            }
            // 일정 시간 후 텍스트 박스 사라지기
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation {
                    isAnimating = .out // 애니메이션 종료
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    textBoxes = [] // 박스 제거
                }
            }
        }
    }
    
    private var randomView: some View {
        ForEach(textBoxes) { box in
            let currentCase = isAnimating
            let defaultView = Text(box.text)
                .font(.headline)
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .shadow(radius: 3)
                .rotationEffect(.degrees(box.rotation))
            
            randomOffSet(view: defaultView, type: currentCase, box: box)
        }
    }
    

    private func randomOffSet(view: some View, type: AnimationType, box: TextBoxModel) -> some View {
//        let deviceHeight = UIScreen.main.bounds.height
        
        switch type {
        case .start:
            return view
                .offset(x: box.offsetX, y: -500)
                .animation(.easeOut(duration: 1), value: isAnimating)
        case .on:
            return view
                .offset(x: box.offsetX, y: box.offsetY) // 시작 위치 & 애니메이션
                .animation(.easeOut(duration: 1), value: isAnimating)
        case .out:
            return view
                .offset(x: box.offsetX, y: box.offsetY + 500) // 시작 위치 & 애니메이션
                .animation(.easeOut(duration: 1), value: isAnimating)
        }
    }

    // 랜덤한 텍스트 박스 생성
    private func generateRandomTextBoxes() {
        let randomTexts = [
            "소액으로 부동산 투자를 해볼 수 있을까?",
            "사람들이 가장 많이 가입하는 최소한의 보험은?",
            "자동차를 사도 될까?",
            "금융 상품 고를 때 주의할 점은?",
            "지금 주식에 투자해도 될까?"
        ]
        
        let deviceWidth = UIScreen.main.bounds.width / 2 - 70
        let deviceHeight = UIScreen.main.bounds.height / 2 - 80
        print(deviceHeight)
        textBoxes = (1...10).map { _ in
            let randomText = randomTexts.randomElement()!
            return TextBoxModel(
                text: randomText,
                offsetX: CGFloat.random(in: -deviceWidth...deviceWidth), // 랜덤 x 위치
                offsetY: CGFloat.random(in: (deviceHeight / 2.4)...deviceHeight), // 최종 y 위치
                rotation: Double.random(in: -15...15)  // 랜덤 회전 각도
            )
        }
    }
}

// 텍스트 박스를 위한 모델
struct TextBoxModel: Identifiable {
    let id = UUID()
    let text: String
    let offsetX: CGFloat
    let offsetY: CGFloat
    let rotation: Double
}

#if DEBUG
#Preview {
    RandomTextBoxAnimationView()
}
#endif
