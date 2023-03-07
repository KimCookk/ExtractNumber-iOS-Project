//
//  ViewProtocol.swift
//  ExtractNumber_Rx
//
//  Created by 김태성 on 2023/03/06.
//

import Foundation
import UIKit
import SnapKit

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

protocol ViewControllerAble {
    func configureController(viewController: UIViewController, pageView: UIView)
    func configureBinding()
    func configureViews(viewController: UIViewController, pageView: UIView)
    
}

extension ViewControllerAble {
    func configureViews(viewController: UIViewController, pageView: UIView) {
    
        guard let parentView = viewController.view else {
            return
        }
        parentView.addSubview(pageView)
        
        pageView.snp.makeConstraints{ (make) in
            make.width.equalTo(parentView.safeAreaLayoutGuide)
            make.height.equalTo(parentView.safeAreaLayoutGuide)
            make.centerX.equalTo(parentView.safeAreaLayoutGuide)
            make.centerY.equalTo(parentView.safeAreaLayoutGuide)
        }
    }
    
    func configureController(viewController: UIViewController, pageView: UIView) {
        configureViews(viewController: viewController, pageView: pageView)
        configureBinding()
    }
}
