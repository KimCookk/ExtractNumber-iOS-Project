//
//  TempExtractViewController.swift
//  ExtractNumber_Rx
//
//  Created by 김태성 on 2023/03/07.
//

import UIKit
import SnapKit

class TempExtractViewController: UIViewController {
    
    lazy var extractPageView: ExtractPageView = {
       let pageView = ExtractPageView()
        
        return pageView
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        configureViews(viewController: self, pageView: extractPageView)
    }
}

extension TempExtractViewController: ViewControllerAble {

    
    func configureBinding() {
        
    }
}
