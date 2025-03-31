//
//  TImerController.swift
//  timer-basic
//
//  Created by J on 3/31/25.
//

import Foundation

class TimerController : ObservableObject {
    @Published var timerModel = TimerModel()
    
    private var timer : Timer?
    
    
    func timerStart() {
        if timerModel.isRunning { return }
        
        timerModel.isRunning = true
        timerModel.isPaused = false
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            if self.timerModel.remainedTime > 0 {
                self.timerModel.remainedTime -= 1
            } else {
                self.timerStop()
            }
        })
    }
    
    func timerStop() {
        timerModel.isRunning = false
        timer?.invalidate()
        timer = nil
    }
    
    func timerPaused() {
        if timerModel.isRunning {
            timerModel.isPaused = true
            timerModel.isRunning = false
            timer?.invalidate() // 타이머를 멈춤. 완전히 제거 X
        }
    }
    
    func timerResume() {
        if timerModel.isPaused {
            timerStart()
        }
    }
    
    func timerReset() {
        timerStop()
        timerModel.remainedTime = timerModel.totalTime
    }
}
