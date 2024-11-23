//
//  CustomPopUpVIew.swift
//  DecemberFlower
//
//  Created by Jae hyung Kim on 11/24/24.
//

import SwiftUI

enum AlertMode {
    case onlyCheck
    case cancelWith
}

struct CustomAlertView: View {
    
    var alertMode: AlertMode
    
    var title: String
    var message: String
    var ifMessageCenter : Bool
   
    
    var onCancel: () -> Void
    var onAction: () -> Void
    
    var actionTitle: String
    
    
    var body: some View {
        VStack(spacing: 16) {
            
            if !message.isEmpty {
                Text(title)
                    .font(style: .moneygraphy, size: 20)
                    .foregroundColor(.white)
                
                Text(message)
                    .font(style: .moneygraphy, size: 16)
                    .multilineTextAlignment(ifMessageCenter ? .center : .leading)
                    .foregroundColor(.gray)
                    .padding(.bottom, 10)
            } else {
                Spacer()
                
                Text(title)
                    .font(style: .moneygraphy, size: 20)
                    .foregroundColor(.white)
                
                Spacer()
            }
            makeAlertView()
        }
        .frame(maxHeight: .infinity)
    }
}

extension CustomAlertView {
    
    @ViewBuilder
    func makeAlertView() -> some View {
        
        switch alertMode {
        case .cancelWith:
            HStack {
                Button(action: {
                    withAnimation {
                        onCancel()
                    }
                }) {
                    Text("취소")
                        .font(style: .moneygraphy, size: 18)
                        .frame(maxWidth: .infinity)
                        .frame(height: 15)
                        .padding()
                        .background(Color(DFColor.GrayColor.alertButton.color))
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                Button(action: {
                    withAnimation {
                        onAction()
                    }
                }) {
                    Text(actionTitle)
                        .font(style: .moneygraphy, size: 18)
                        .frame(maxWidth: .infinity)
                        .frame(height: 15)
                        .padding()
                        .background(Color(DFColor.PointColor.point1.color))
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }
        case .onlyCheck:
            Button(action: {
                onAction()
            }) {
                Text(actionTitle)
                    .font(style: .moneygraphy, size: 18)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(DFColor.PointColor.point1.color))
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
    }
}
