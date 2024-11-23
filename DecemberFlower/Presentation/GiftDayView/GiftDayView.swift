//
//  GiftDayView.swift
//  DecemberFlower
//
//  Created by Jae hyung Kim on 11/23/24.
//

import SwiftUI

struct GiftDayView: View {
    
    private var gridItems: [GridItem] = [GridItem(.flexible())]
    
    private let datas: [String] = (1...31).map { String($0) }
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    topView
                        .padding(.horizontal, 16)
                        .padding(.top, 30)
                        .padding(.bottom, 10)
                    
                    HStack(alignment: .top) {
                        LazyVGrid(columns: gridItems) {
                            randomMode(bool: true)
                        }
                        LazyVGrid(columns: gridItems) {
                            randomMode(bool: false)
                        }
                    }
                }
                Color.clear
                    .padding(.bottom, 100)
            }
            Color.clear
                .bottomShadow
                .allowsHitTesting(false)
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
    
    private var topView: some View {
        VStack {
            HStack {
                Text("12월이에요!")
                    .font(style: .moneygraphy, size: 40)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 2)
                    
                Spacer()
            }
            HStack {
                Text("오늘의 목표를 날짜 박스에 넣어주세요")
                    .font(style:.moneygraphy, size: 20)
                    .multilineTextAlignment(.leading)
                    
                Spacer()
            }
        }
        .foregroundStyle(.white)
    }
    
    /// bool:
    /// true = left
    /// false = right
    private func randomMode(bool: Bool) -> some View {
        let count = datas.count
        let sideCount = calculateOddEvenNumbers(total: count)
        
        
        return ForEach( bool ? sideCount.0 : sideCount.1 , id: \.self) { index in
            ZStack {
                randomImage
                    .padding(.all, 10)
                .asButton {
                    
                }
                Text(datas[index - 1])
            }
        }
    }
    
    private var randomImage: some View {
        let randomImageNumber = Int.random(in: 1...4)
        
        return Group {
            if let caseOf = BoxImages(rawValue: randomImageNumber) {
                caseOf.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    
            } else {
                Color.clear
            }
        }
    }
    
    func calculateOddEvenNumbers(total: Int) -> ([Int], [Int]) {
        var odds: [Int] = []
        var evens: [Int] = []
        
        for i in 1...total {
            if i % 2 == 0 {
                evens.append(i) // 짝수일 때
            } else {
                odds.append(i)  // 홀수일 때
            }
        }
        return (odds, evens)
    }
}


#Preview {
    GiftDayView()
}
