//
//  ContentView.swift
//  ScallingSquaresLoader_v1
//
//  Created by Viettasc on 11/6/19.
//  Copyright © 2019 Viettasc. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isAnimated = false
    
    var backgroundView: some View {
        RadialGradient(gradient: Gradient(colors: [Color.white,.blue]), center: .center, startRadius: 5, endRadius: 500)
            .scaleEffect(1.2)
    }
    
    struct AnimatedSquare: View {
        var position: Int
        var isAnimated: Bool
        fileprivate var number: CGFloat = 25
        fileprivate var offset: (CGFloat,CGFloat) {
            switch position {
            case 1:
                return (-number, -number)
            case 2:
                return (number, -number)
            case 3:
                return (-number, number)
            case 4:
                return (number, number)
            default:
                return (0,0)
            }
        }
        var body: some View {
            Rectangle()
                .frame(width: 30, height: 30)
                .offset(x: isAnimated ? offset.0 : 0, y: isAnimated ? offset.1 : 0)
                .animation(Animation.easeInOut(duration: 0.6).repeatForever(autoreverses: true))
        }
    }
    
    var squareView: some View {
        ZStack {
            AnimatedSquare(position: 1, isAnimated: isAnimated)
                .onAppear {
                    self.isAnimated.toggle()
            }
            AnimatedSquare(position: 2, isAnimated: isAnimated)
            AnimatedSquare(position: 3, isAnimated: isAnimated)
            AnimatedSquare(position: 4, isAnimated: isAnimated)
        }
        .rotationEffect(.radians(self.isAnimated ? .pi : -.pi/8))
        .animation(Animation.easeInOut(duration: 0.6).repeatForever(autoreverses: true))
    }
    
    var body: some View {
        ZStack {
            backgroundView
            squareView
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
