//
//  DFResultView.swift
//  DecemberFlower
//
//  Created by Jae hyung Kim on 11/24/24.
//

import SwiftUI
import PopupView
import ComposableArchitecture

struct DFResultView: View {
    
    @Perception.Bindable var store: StoreOf<DFResultViewFeature>
    
    @State var text: String = "asdakjsdklasjdkl"
    @State var success: Bool = false
    @State var test: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                HStack {
                    Text(store.purposeData.title) // 이거
                        .font(style: .moneygraphy, size: 32)
                        .lineLimit(3)
                        .foregroundStyle(.white)
                        .padding(.trailing, 80)
                        .padding(.bottom, 30)
                    
                    Spacer()
                }
                // 바인딩 처리하되 수정 안됨 ->
                DFTextView(text: $store.purposeData.details.sending(\.detailTextBinding), backgroundColor: Color(DFColor.GrayColor.textView.color), placeHolder: "")
                    .frame(height: 260)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .overlay {
                        Color.black.opacity(0.01)
                            .frame(maxWidth: .infinity)
                            .frame(height: 260)
                    }
                    .padding(.bottom, 20)
                
                if store.state.purposeData.isValid {
                    if store.state.purposeData.first {
                        Text("목표를 달성할 수록 좋은 일이 생길거에요!")
                            .font(style: .moneygraphy, size: 16)
                            .foregroundStyle(.yellow)
                    } else {
                        Text("목표를 달성이 어렵다면 가볍게라도 도전해보세요!")
                            .font(style: .moneygraphy, size: 16)
                            .foregroundStyle(Color(DFColor.PointColor.point1.color))
                    }
                } else {
                    Text("목표를 달성이 어렵다면 가볍게라도 도전해보세요!")
                        .font(style: .moneygraphy, size: 16)
                        .foregroundStyle(Color(DFColor.PointColor.point1.color))
                }
                
                Spacer()
            }
            .padding(.horizontal, 20)
            
            if store.state.purposeData.first {
                VStack {
                    Text("오늘 목표를 완료했어요!")
                        .font(style: .moneygraphy, size: 18)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(Color(DFColor.PointColor.point1.color)) // 조건에 따를
                .asButton {
                    // 로직 처리
                    success = true
                }
                .foregroundStyle(.white) // 조건에 따름
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.horizontal, 30)
                .padding(.bottom, 10)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            ZStack {
                Image(.background)
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            
            .ignoresSafeArea(.all)
        }
        .popup(isPresented: $success) {
            CustomAlertView(
                alertMode: .cancelWith,
                title: "오늘의 목표를 완료하셨나요?",
                message: "",
                ifMessageCenter: true,
                onCancel: {
                    
                },
                onAction: {
                    
                },
                actionTitle: "완료했어요")
            .frame(height: 120)
            .padding(.all, 20)
            .background(Color(DFColor.GrayColor.alertBackground.color))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(radius: 20)
            .padding()
        }
    }
}
/// Toast View 예시
/*
 
 .popup(isPresented: $test) {
     ToastView(text: "오늘 목표를 달성했어요")
         .frame(height: 70)
         .background(Color.black.opacity(0.7))
         .clipShape(RoundedRectangle(cornerRadius: 12))
         .frame(maxWidth: .infinity)
         .padding(.all, 30)
         
 } customize: {
     $0
         .type(.toast)
         .autohideIn(2)
 }
 
 */

//#Preview {
//    DFResultView()
//}
