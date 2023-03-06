//
//  ViewProtocol.swift
//  ExtractNumber_Rx
//
//  Created by 김태성 on 2023/03/06.
//

import Foundation

protocol ViewAble {
    func configureView()
    func configureDraw()
    func configureEvent()
    
}

extension ViewAble {
    func configureView() {
        configureDraw()
        configureEvent()
    }
}
