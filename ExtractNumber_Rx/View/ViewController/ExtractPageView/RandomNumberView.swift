import UIKit

class RandomNumberView: UIView {
    
    var circleRandomNumberView: CircleNumberView = {
        let randomNumberview = CircleNumberView(number: "1", color: UIColor.getRandom())
        
        return randomNumberview
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RandomNumberView: ViewAble {
    func configureDraw() {
        self.addSubview(circleRandomNumberView)
        
        circleRandomNumberView.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.height.equalTo(self.snp.width).multipliedBy(0.5)
            
        }
    }
    
    func configureEvent() {
        
    }
}
