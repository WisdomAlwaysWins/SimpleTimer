//
//  TImerController.swift
//  timer-basic
//
//  Created by J on 3/31/25.
//

import Foundation

class TimerController : ObservableObject {
    @Published var timerModel = TimerModel()
    
    func start() {
        timerModel.timerStart()
    }
    
    func stop() {
        timerModel.timerStop()
    }
    
    func pause() {
        timerModel.timerPaused()
    }
    
    func resume() {
        timerModel.timerResume()
    }
    
    func reset() {
        timerModel.timerReset()
    }
}
