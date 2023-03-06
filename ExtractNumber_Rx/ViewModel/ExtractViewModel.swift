//
//  RootViewModel.swift
//  ExtractNumber_Rx
//
//  Created by 김태성 on 2022/10/18.
//

import Foundation
import RxSwift

class ExtractViewModel{
    // MARK: PROPERTIES
    
    let randomPickService: RandomPickService
    let numbersLength: Int = 20
    var backupNumber: PickNumber = PickNumber()
    var backPickNumbers: [PickNumber] = []
    
    var timer: Timer = Timer()
    let disposeBag = DisposeBag()
    // INPUT
    let tappedStart: AnyObserver<Void>
    let tappedStop: AnyObserver<Void>
    let tappedPick: AnyObserver<Void>
    let tappedClear: AnyObserver<Void>
    
    let changeMax: AnyObserver<String>
    let changeMin: AnyObserver<String>
    // OUTPUT
    
    let randomNumber: BehaviorSubject<PickNumber>
    let pickNumbers: BehaviorSubject<[PickNumber]>
    let isRandoming: BehaviorSubject<Bool>
    
    init(){
        randomPickService = RandomPickService(min: 0, max: 50)
        
        let start = PublishSubject<Void>()
        let stop = PublishSubject<Void>()
        let pick = PublishSubject<Void>()
        let clear = PublishSubject<Void>()
        
        let max = PublishSubject<String>()
        let min = PublishSubject<String>()
        
        tappedStart = start.asObserver()
        tappedStop = stop.asObserver()
        tappedPick = pick.asObserver()
        tappedClear = clear.asObserver()
        
        changeMax = max.asObserver()
        changeMin = min.asObserver()
        
        randomNumber = BehaviorSubject(value: PickNumber(number: "\(randomPickService.min)"))
        pickNumbers = BehaviorSubject<[PickNumber]>(value: [])
        isRandoming = BehaviorSubject<Bool>(value: false)
        
        start.subscribe(onNext: {
            print("start")
            self.timer = Timer.scheduledTimer(timeInterval: TimeInterval(0.05), target: self, selector: #selector(self.getRandomNumber), userInfo: nil, repeats: true)
            self.isRandoming.onNext(true)
        }).disposed(by: disposeBag)
        
        stop.subscribe(onNext: {
            print("stop")
            self.timer.invalidate()
        self.isRandoming.onNext(false)
        }).disposed(by: disposeBag)
        
        pick.subscribe(onNext: {
            print("pick")
            self.pickNumber(number: self.backupNumber)
        }).disposed(by: disposeBag)
        
        clear.subscribe(onNext: {
            print("clear")
            self.pickNumbersClear()
        }).disposed(by: disposeBag)
        
        max.subscribe(onNext: { maxNumber in
            self.randomPickService.resetMinMax(max: Int(maxNumber))
        }).disposed(by: disposeBag)
        
        min.subscribe(onNext: { minNumber in
            self.randomPickService.resetMinMax(min: Int(minNumber))
        }).disposed(by: disposeBag)
        
        randomNumber.subscribe(onNext: { number in
            self.backupNumber = number
        }).disposed(by: disposeBag)
    }
    
    func pickNumber(number: PickNumber){
        if(backPickNumbers.count >= numbersLength){
            backPickNumbers.popLast()
        }
        backPickNumbers.insert(number, at: 0)
        pickNumbers.onNext(backPickNumbers)
    }
    
    func pickNumbersClear(){
        backPickNumbers.removeAll()
        pickNumbers.onNext(backPickNumbers)
    }
    
    @objc
    func getRandomNumber(){
        self.randomPickService.getRadnomNumber(completion: { random in
            print("randomNumber : \(random)")
            self.randomNumber.onNext(PickNumber(number: "\(random)"))
        })
    }
    
}
