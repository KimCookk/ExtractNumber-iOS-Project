//
//  PreViewController.swift
//  ExtractNumber_Rx
//
//  Created by 김태성 on 2023/03/06.
//

import Foundation
import UIKit

class PreViewController: UIViewController {
 
    lazy var flexibleStackView: FlexibleStackView = {
        let stackView = FlexibleStackView(ratios: [0.3, 0.1, 0.2, 0.1, 0.3], axis: .vertical)
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureController()
    }
    
    func configureController() {
        view.backgroundColor = .white
        
        view.addSubview(flexibleStackView)
        flexibleStackView.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        flexibleStackView.configureView()
    }
}
