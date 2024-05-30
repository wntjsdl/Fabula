//
//  ContentView.swift
//  DisableAnimations
//
//  Created by JuSun Kang on 5/30/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var toggle: Bool = true
    
    public init() {}
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                Spacer()
                Rectangle()
                    .fill(Color.blue)
                    .border(.white, width: 2)
                    .frame(width: 40, height: 40)
                    .overlay(
                        Text("ON")
                            .font(.caption)
                            .bold()
                            .foregroundStyle(.white)
                    )
                    .offset(x: toggle ? 0 : proxy.size.width - 40)
                
                Rectangle()
                    .fill(Color.red)
                    .border(.white, width: 2)
                    .frame(width: 40, height: 40)
                    .overlay(
                        Text("OFF")
                            .font(.caption)
                            .bold()
                            .foregroundStyle(.white)
                    )
                    .offset(x: toggle ? 0 : proxy.size.width - 40)
                    .transaction { transaction in
                        transaction.animation = nil
//                        transaction.animation = .spring()
                    }
                
                Spacer()
            }
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text("Toggle")
                        .onTapGesture {
                            toggle.toggle()
                        }
                    Spacer()
                }
                Spacer()
            }
        }
            .padding()
            .animation(.easeInOut, value: toggle)
    }
}

#Preview {
    ContentView()
}
