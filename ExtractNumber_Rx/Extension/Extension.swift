//
//  Extension.swift
//  ExtractNumber_Rx
//
//  Created by 김태성 on 2022/10/21.
//

import Foundation

extension Array {
    subscript (safe index: Int) -> Element? {
        
        return indices ~= index ? self[index] : nil
    }
}
