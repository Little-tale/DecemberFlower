//
//  TestView.swift
//  DecemberFlower
//
//  Created by Jae hyung Kim on 11/23/24.
//

import SwiftUI

struct RandomTextBoxAnimationView: View {
    let count: Int
    @State private var finalCount: [ItemModel] = []
    @State private var isAnimating = AnimationType.start
    
    @State var boo: Bool = false
    
    enum AnimationType {
        case start
        case on
        case out
    }

    var body: some View {
        VStack {
            ZStack {
                randomView
                
                VStack {
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                
            }
            .overlay {
                ZStack(alignment: .bottom) {
                    VStack {
                        
                        HStack {
                            Text("12월 한 달 동안\n이렇게 달라졌어요")
                                .font(style: .moneygraphy, size: 32)
                                .foregroundStyle(.white)
                            
                            Spacer()
                        }
                        .padding(.horizontal, 80)
                        
                        ZStack {
//                            Image(.presentOpen)
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                                .frame(maxWidth: .infinity)
                            
                            Image(.presentbox)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: UIScreen.main.bounds.width + 120)
                            
                            Text("테스트 글입니다. Enfnfnfnfnfnnffnnfasdasdasdas")
                                .font(style: .moneygraphy, size: 18)
                                .multilineTextAlignment(.center)
                                .lineLimit(4)
                                .padding(.horizontal, 150)
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea(edges: .bottom)
                    
                    
                    VStack {
                        Text("확인했어요")
                            .font(style: .moneygraphy, size: 18)
                    }
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(Color(DFColor.PointColor.point1.color))
                    .asButton {
                        
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding(.bottom, 12)
                    .padding(.horizontal, 80)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            generateRandomTextBoxes() // 랜덤 데이터 생성
            withAnimation {
                isAnimating = .on
            }
            // 일정 시간 후 텍스트 박스 사라지기
//            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//                withAnimation(.ease) {
//                    isAnimating = .out // 애니메이션 종료
//                }
//            }
        }
        .background {
            ZStack {
                Image(.background)
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .ignoresSafeArea(.all)
        }
    }
    
    private var randomView: some View {
        ForEach(finalCount, id: \.id) { model in
            let currentCase = isAnimating
            let defaultView = randomImage
                .frame(maxWidth: 140)
                .rotationEffect(Angle(radians: model.rotation))
            
            randomOffSet(view: defaultView, type: currentCase, box: model)
        }
    }
    

    private func randomOffSet(view: some View, type: AnimationType, box: ItemModel) -> some View {
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
        let deviceWidth = UIScreen.main.bounds.width / 2 - 70
        let deviceHeight = UIScreen.main.bounds.height / 2 - 80
        
        var models: [ItemModel] = []
        
        for _ in 1...count {
            models.append(
                ItemModel(
                    imageNum: Int.random(in: 1...4),
                    offsetX: CGFloat.random(in: -deviceWidth...deviceWidth),
                    offsetY:  CGFloat.random(in: (deviceHeight / 2)...deviceHeight),
                    rotation: Double.random(in: -15...15)
                )
            )
        }
        finalCount = models
    }
    
    private var randomImage: some View {
        let randomImageNumber = Int.random(in: 1...4)
        
        return Group {
            if let caseOf = PresentImages(rawValue: randomImageNumber) {
                caseOf.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    
            } else {
                Color.clear
            }
        }
    }
}

// 텍스트 박스를 위한 모델
struct ItemModel: Identifiable {
    let id = UUID()
    let imageNum: Int
    let offsetX: CGFloat
    let offsetY: CGFloat
    let rotation: Double
}

#if DEBUG
#Preview {
    RandomTextBoxAnimationView(count: 31)
}
#endif
