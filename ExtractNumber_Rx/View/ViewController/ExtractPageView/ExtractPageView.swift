//
//  ExtractPageView.swift
//  ExtractNumber_Rx
//
//  Created by 김태성 on 2023/03/07.
//

import Foundation
import UIKit

class ExtractPageView: UIView {
    
    private var verticalMainStackView: FlexibleStackView = {
        let flexibleStackView = FlexibleStackView(ratios: [0.1, 0.45, 0.3, 0.15], axis: .vertical)
        
        return flexibleStackView
    }()
    
    private var randomNumberView: RandomNumberView = {
       let randomNumberView = RandomNumberView()
        
        return randomNumberView
    }()
    
    private var historyNumberView: HistoryNumberView = {
        let historyNumberView = HistoryNumberView()
        
        return historyNumberView
    }()
    
    private var buttonsView: ButtonsView = {
        let buttonsView = ButtonsView()
        
        return buttonsView
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
        
        verticalMainStackView.addStackView(1, addView: randomNumberView)
        randomNumberView.snp.makeConstraints{ (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        verticalMainStackView.addStackView(2, addView: historyNumberView)
        historyNumberView.snp.makeConstraints{ (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        verticalMainStackView.addStackView(3, addView: buttonsView)
        buttonsView.snp.makeConstraints{ (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
            
        }
    }
    
    func configureEvent() {
        
    }
}
