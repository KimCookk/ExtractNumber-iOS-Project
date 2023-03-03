//
//  RadomPickService.swift
//  ExtractNumber_Rx
//
//  Created by 김태성 on 2022/10/18.
//

import Foundation

class RandomPickService{
    var min: Int
    var max: Int
    
    private var completionHandler: () -> Void = {}
    
    
    init(min: Int, max: Int){
        self.min = min
        self.max = max
    }
    
    func resetMinMax(min: Int? = nil, max: Int? = nil){
        if let inputMin = min {
            self.min = inputMin
        }
        
        if let inputMax = max {
            self.max = inputMax
        }
    }
    
    @objc
    func getRadnomNumber(completion: @escaping (Int) -> Void) {
        DispatchQueue.main.async {
            completion(Int.random(in: self.min...self.max))
        }
    }
    
}
