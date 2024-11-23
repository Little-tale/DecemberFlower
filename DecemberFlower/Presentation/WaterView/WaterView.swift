//
//  WaterView.swift
//  DecemberFlower
//
//  Created by Jae hyung Kim on 11/23/24.
//

import SwiftUI
import ComposableArchitecture


struct WaterView: View {
    
    @Perception.Bindable var store: StoreOf<WaterViewFeature>
    
    var body: some View {
        VStack {
            waterInfoView
            
            Text("마시기")
                .asButton {
                    
                }
        }
    }
}

extension WaterView {
    
    private var waterInfoView: some View {
        HStack {
            Text("물")
            
            Text(String(store.currentWaterCount))
            
            Text("잔")
        }
    }
    
}

#if DEBUG
#Preview {
    WaterView(store: Store(initialState: WaterViewFeature.State(), reducer: {
        WaterViewFeature()
    }))
}
#endif
