//
//  TimerModel.swift
//  timer-basic
//
//  Created by J on 3/31/25.
//

import Foundation

class TimerModel : ObservableObject {
    @Published var totalTime : Int = 60 // 전체 시간 (초)
    @Published var remainedTime : Int = 60 // 남은시간 (초)
    
    @Published var isRunning : Bool = false // 실행 여부
    @Published var isPaused : Bool = false // 일시정지 여부
    
    var timer : Timer?
    
    var progress : CGFloat { // 진행 상황
        CGFloat(remainedTime) / CGFloat(totalTime)
    }
    
    /* MARK: - timer는 왜 옵서녈 값을 가지는가?
        
     타이머가 처음부터 있는게 아니기 때문.
     타이머가 필요할 때만 생성하고, 필요 없으면 nil로 만들어 정리하는 구조
     
     MARK: - timer : Timer 로 정의하면
     반드시 Timer가 초기화되어야하는데, 타이머가 시작하지 않은 상태에서도 변수를 가져야하므로 nil이 가능해야함.
     
     */
    
    func timerStart() {
        if isRunning { return }
        
        isRunning = true
        isPaused = false
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            if self.remainedTime > 0 {
                self.remainedTime -= 1
            } else {
                self.timerStop()
            }
        })
    }
    
    func timerStop() {
        isRunning = false
        timer?.invalidate()
        timer = nil
    }
    
    func timerPaused() {
        if isRunning {
            isPaused = true
            isRunning = false
            timer?.invalidate() // 타이머를 멈춤. 완전히 제거 X
        }
    }
    
    func timerResume() {
        if isPaused {
            timerStart() 
        }
    }
    
    func timerReset() {
        timerStop()
        remainedTime = totalTime
    }
}
