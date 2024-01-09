//
//  ContentView.swift
//  SwiftUI Animation
//
//  Created by Neshwa on 15/12/23.
//

import SwiftUI

struct ContentView: View {
    
    let letters = Array("Hello, SwiftUI")
    @State private var dragAmount = CGSize.zero
    @State private var enabled = false
    
    var body: some View {
        
        /* Button("Tap Tap") {
         withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
         animationAmount += 360
         }
         }
         .padding(50)
         .background(.black)
         .foregroundStyle(.white)
         .clipShape(.circle)
         .rotation3DEffect(.degrees(animationAmount), axis: (x: 1, y: 1, z: 0))
         } */
        
        HStack(spacing: 0) {
                    ForEach(0..<letters.count, id: \.self) { num in
                        Text(String(letters[num]))
                            .padding(5)
                            .font(.title)
                            .background(enabled ? .blue : .red)
                            .offset(dragAmount)
                            .animation(.default.delay(Double(num) / 20), value: dragAmount)
                    }
                }
                .gesture(
                    DragGesture()
                        .onChanged { dragAmount = $0.translation }
                        .onEnded { _ in
                            dragAmount = .zero
                            enabled.toggle()
                        }
                )
    }
}

#Preview {
    ContentView()
}
