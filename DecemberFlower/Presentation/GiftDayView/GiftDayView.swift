//
//  GiftDayView.swift
//  DecemberFlower
//
//  Created by Jae hyung Kim on 11/23/24.
//

import SwiftUI

struct GiftDayView: View {
    
    private var gridItems: [GridItem] = [GridItem(.flexible())]
    
    private let datas: [String] = Array(repeating: String(Double.random(in: 0..<100)), count: 50)
    
    var body: some View {
        ScrollView {
            HStack(alignment: .top) {
                LazyVGrid(columns: gridItems) {
                    randomMode(bool: true)
                }
                LazyVGrid(columns: gridItems) {
                    randomMode(bool: false)
                }
            }
        }
    }
    
    /// bool:
    /// true = left
    /// false = right
    private func randomMode(bool: Bool) -> some View {
        let count = datas.count
        let sideCount = calculateOddEvenNumbers(total: count)
        
        
        return ForEach( bool ? sideCount.0 : sideCount.1 , id: \.self) { index in
            randomImage
                .padding(.all, 10)
                .onAppear {
                    print(index)
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
