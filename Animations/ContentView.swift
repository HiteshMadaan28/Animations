//
//  ContentView.swift
//  Animations
//
//  Created by Hitesh Madaan on 30/04/24.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0
    var body: some View {
        Button("Tap Me"){
            //Body of Button
            animationAmount += 0.5
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        .scaleEffect(animationAmount)
        .blur(radius: (animationAmount - 1) * 3)
        .animation(.spring(duration: 1,bounce: 0.3),value: animationAmount)
        
    }
}

#Preview {
    ContentView()
}
