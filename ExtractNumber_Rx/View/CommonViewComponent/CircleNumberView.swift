//
//  CircleNumberView.swift
//  ExtractNumber_Rx
//
//  Created by 김태성 on 2023/03/13.
//

import Foundation
import UIKit

class CircleNumberView: UIView {
    
    var number: String = ""
    
    convenience init(number: String, color: UIColor) {
        self.init()
        self.number = number
        self.backgroundColor = color
        self.configureView()
    }
 
}

extension CircleNumberView: ViewAble {
    func configureDraw() {
        self.layer.cornerRadius = 90
    }
    
    func configureEvent() {
        
    }
}
