//
//  ContentView.swift
//  Animations
//
//  Created by Hitesh Madaan on 30/04/24.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 0.0
    @State private var enabled = false
    @State private var dragged=CGSize.zero
    let letters=Array("Hello Atul")
    
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
            
            VStack{
                LinearGradient(colors: [.yellow,.red], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .frame(width: 300,height: 200)
                    .clipShape(.rect(cornerRadius: 20))
                    .offset(dragged)
                    .gesture(
                        DragGesture()
                            .onChanged { dragged = $0.translation }
                            .onEnded { _ in
                                //Explicit Animation
                                withAnimation(.default){
                                    dragged = .zero }
                            }
                    )
                    
            }
            HStack(spacing: 0) {
                       ForEach(0..<letters.count, id: \.self) { num in
                           Text(String(letters[num]))
                               .padding(5)
                               .font(.title)
                               .background(enabled ? .blue : .red)
                               .offset(dragged)
                               .animation(.linear.delay(Double(num) / 20), value: dragged)
                       }
                       .gesture(
                        DragGesture()
                            .onChanged { dragged = $0.translation }
                            .onEnded { _ in
                                dragged = .zero
                                enabled.toggle()
                            }
                    )
                   }
        }
        
        
    }
}

#Preview {
    ContentView()
}
