//
//  ContentView.swift
//  timer-basic
//
//  Created by J on 3/31/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var timerModel = TimerModel()
    
    var body: some View {
        VStack {
            
            ZStack {
                Circle()
                    .stroke(lineWidth: 20)
                    .opacity(0.3)
                    .foregroundColor(.gray)
                    
                Circle()
                    .trim(from: 0, to: timerModel.progress)
                    .stroke(.blue, lineWidth: 20)
                    .rotationEffect(.degrees(-90))
                    .animation(.easeInOut(duration: 1), value: timerModel.progress)
                
                Text("\(timerModel.remainedTime) 초")
                    .font(.largeTitle)
                    .bold()
            }
            .frame(width: 300, height: 300)
            .padding()
            
            HStack {
                if !timerModel.isRunning {
                    Button {
                        if timerModel.isPaused {
                            timerModel.timerResume()
                        }else {
                            timerModel.timerStart()
                        }
                    } label: {
                        Text(timerModel.isRunning ? "RESUME" : "START")
                    }
                    .buttonStyle(.bordered)
                }
                if timerModel.isRunning {
                    Button("PAUSE") {
                        timerModel.timerPaused()
                    }
                    .buttonStyle(.bordered)
                }
                
                Button("RESET") {
                    timerModel.timerReset()
                }
                .buttonStyle(.bordered)
            }
        }
    }
}

#Preview {
    ContentView()
}
