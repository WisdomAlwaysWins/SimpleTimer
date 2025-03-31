//
//  ContentView.swift
//  timer-basic
//
//  Created by J on 3/31/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var timerController = TimerController()
    
    var body: some View {
        VStack {
            
            ZStack {
                Circle()
                    .stroke(lineWidth: 20)
                    .opacity(0.3)
                    .foregroundColor(.gray)
                    
                Circle()
                    .trim(from: 0, to: timerController.timerModel.progress)
                    .stroke(.blue, lineWidth: 20)
                    .rotationEffect(.degrees(-90))
                    .animation(.easeInOut(duration: 1), value: timerController.timerModel.progress)
                
                Text("\(timerController.timerModel.remainedTime) 초")
                    .font(.largeTitle)
                    .bold()
            }
            .frame(width: 300, height: 300)
            .padding()
            
            HStack {
                if !timerController.timerModel.isRunning {
                    Button {
                        if timerController.timerModel.isPaused {
                            timerController.timerResume()
                        }else {
                            timerController.timerStart()
                        }
                    } label: {
                        Text(timerController.timerModel.isRunning ? "RESUME" : "START")
                    }
                    .buttonStyle(.bordered)
                }
                if timerController.timerModel.isRunning {
                    Button("PAUSE") {
                        timerController.timerPaused()
                    }
                    .buttonStyle(.bordered)
                }
                
                Button("RESET") {
                    timerController.timerReset()
                }
                .buttonStyle(.bordered)
            }
        }
    }
}

#Preview {
    ContentView()
}
