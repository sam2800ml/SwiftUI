//
//  ContentView.swift
//  CalculatorApp
//
//  Created by Santiago Aristizabal on 1/9/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            GeneralView()
                .tabItem { Text("General")}
                
            AdvanceView()
                .tabItem { Text("Advanced")}
            BillSplitView()
                .tabItem { Text("Bill Split")}
            MoreView()
                .tabItem{ Text("More")}
            
        }
    }
}

#Preview {
    ContentView()
}
