//
//  ExtractPageView.swift
//  ExtractNumber_Rx
//
//  Created by 김태성 on 2023/03/07.
//

import Foundation
import UIKit

class ExtractPageView: UIView {
    
    lazy var verticalMainStackView: FlexibleStackView = {
        let flexibleStackView = FlexibleStackView(ratios: [0.1, 0.5, 0.3, 0.1], axis: .vertical)
        
        return flexibleStackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ExtractPageView: ViewAble {
    func configureDraw() {
        self.addSubview(verticalMainStackView)
        
        verticalMainStackView.snp.makeConstraints{ (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
    }
    
    func configureEvent() {
        
    }
}
