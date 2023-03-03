//
//  PickNumber.swift
//  ExtractNumber_Rx
//
//  Created by 김태성 on 2022/10/21.
//

import Foundation
import UIKit

struct PickNumber{
    let number: String
    let color: UIColor
    
    private let pickViewColor = [UIColor.systemRed, UIColor.systemBlue, UIColor.systemGreen, UIColor.systemYellow, UIColor.systemOrange, UIColor.systemPurple]
    
    init(number: String = ""){
        self.number = number
        self.color = pickViewColor.randomElement() ?? UIColor.systemBrown
    }
}
 
 
  
 
