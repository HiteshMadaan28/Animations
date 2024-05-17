//
//  ContentView.swift
//  Animations
//
//  Created by Hitesh Madaan on 30/04/24.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 0.0
    @State private var enabled = true
    var body: some View {
        print(animationAmount)
        return VStack{
            //            Stepper("Click here",value: $animationAmount.animation(),in: 1...10)
            //                .frame(width: 200,height: 200)
            //            Button("Tap Me") {
            //                 animationAmount += 1
            //            }
            //            .padding(50)
            //            .background(.red)
            //            .foregroundStyle(.white)
            //            .clipShape(.circle)
            //            .overlay(
            //                Circle()
            //                    .stroke(.pink)
            //                    .scaleEffect(animationAmount)
            //                    .opacity(2 - animationAmount)
            //                    .animation(
            //                        .easeInOut(duration: 2)
            //                            .repeatForever(autoreverses: false),
            //                        value: animationAmount
            //                    )
            //            )
            //            .onAppear {
            //                animationAmount = 2
            //            }
            
            Button("Tap Me") {
                withAnimation {
                    animationAmount += 60
                    enabled.toggle()
                }
            }
            .padding(50)
            .background(enabled ? .red : .blue)
            .foregroundStyle(.white)
            .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
            .animation(.default, value: enabled)
            .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 0, z: 1))
            .animation(.default, value: enabled)
        }
        
    }
}

#Preview {
    ContentView()
}
