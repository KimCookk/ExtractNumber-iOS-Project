//
//  FlexibleStackView.swift
//  ExtractNumber_Rx
//
//  Created by 김태성 on 2023/03/05.
//

import Foundation
import UIKit
import SnapKit

// 화면을 비율을 설정할 수 있게끔...

class FlexibleStackView: UIStackView {
    
    var stackUnitViews: [FlexibleStackUnitView] = []
    
    convenience init(ratios: [Float], axis: NSLayoutConstraint.Axis? = nil, spacing: CGFloat? = nil) {
        self.init()
        if let axis = axis {
            self.axis = axis
        }
        if let spacing = spacing {
            self.spacing = spacing
        }
        self.distribution = .fill
        
        ratios.forEach{ ratio in
            let stackUnitView = FlexibleStackUnitView(ratio: ratio)
            stackUnitViews.append(stackUnitView)
        }
    }
}

extension FlexibleStackView: ViewAble {
    func configureDraw() {
        stackUnitViews.forEach{ stackUnitView in
            self.addArrangedSubview(stackUnitView)
            stackUnitView.snp.makeConstraints{ make in
                if(self.axis == .vertical) {
                    make.width.equalToSuperview()
                    make.height.equalToSuperview().multipliedBy(stackUnitView.ratio)
                }
                else {
                    make.height.equalToSuperview()
                    make.width.equalToSuperview().multipliedBy(stackUnitView.ratio)
                }
            }
        }
    }
    
    func configureEvent() {
        
    }
}

class FlexibleStackUnitView: UIView {
    var ratio: Float = 0.0
    
    convenience init(ratio: Float) {
        self.init()
        self.ratio = ratio
        let randomRed:CGFloat = CGFloat(drand48())
        let randomGreen:CGFloat = CGFloat(drand48())
        let randomBlue:CGFloat = CGFloat(drand48())
         
        self.backgroundColor = UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
    }
}
