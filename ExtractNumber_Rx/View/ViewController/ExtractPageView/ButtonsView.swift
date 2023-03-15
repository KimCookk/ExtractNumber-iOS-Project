import UIKit

class ButtonsView: UIView {
    
    enum ButtonType {
        case start, stop, pick, clear
    }
    
    private let verticalMainStackView: FlexibleStackView = {
        let flexibleStackView = FlexibleStackView(ratios: [0.2, 1, 0.2, 1, 0.2, 1, 0.2, 1 , 0.2], axis: .horizontal)
        
        return flexibleStackView
    }()
    
    private let startButton: UIButton = {
        let button = UIButton()
        button.setTitle("시작", for: .normal)
        
        return button
    }()
    
    private let stopButton: UIButton = {
        let button = UIButton()
        button.setTitle("중지", for: .normal)
        
        return button
    }()
    
    private let pickButton: UIButton = {
        let button = UIButton()
        button.setTitle("뽑기", for: .normal)
        
        return button
    }()
    
    private let clearButton: UIButton = {
        let button = UIButton()
        button.setTitle("초기화", for: .normal)

        return button
    }()
    
    var tappedButtonDelegate: ((ButtonType) -> Void)?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ButtonsView: ViewAble {
    func configureDraw() {
        self.addSubview(verticalMainStackView)
        verticalMainStackView.snp.makeConstraints{ (make) in
            make.centerX.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        verticalMainStackView.addStackView(1, addView: startButton)
        startButton.snp.makeConstraints{ (make) in
            make.centerX.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        verticalMainStackView.addStackView(3, addView: stopButton)
        stopButton.snp.makeConstraints{ (make) in
            make.centerX.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        verticalMainStackView.addStackView(5, addView: pickButton)
        pickButton.snp.makeConstraints{ (make) in
            make.centerX.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        verticalMainStackView.addStackView(7, addView: clearButton)
        clearButton.snp.makeConstraints{ (make) in
            make.centerX.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
    }
    
    func configureEvent() {
        startButton.addTarget(self, action: #selector(tappedStartButton), for: .touchDown)
        stopButton.addTarget(self, action: #selector(tappedStopButton), for: .touchDown)
        pickButton.addTarget(self, action: #selector(tappedPickButton), for: .touchDown)
        clearButton.addTarget(self, action: #selector(tappedClearButton), for: .touchDown)
    }
}

extension ButtonsView {
    
    @objc
    func tappedStartButton() {
        if let tappedButtonDelegate = tappedButtonDelegate {
            tappedButtonDelegate(.start)
        }
    }
    
    @objc
    func tappedStopButton() {
        if let tappedButtonDelegate = tappedButtonDelegate {
            tappedButtonDelegate(.stop)
        }
    }
    
    @objc
    func tappedClearButton() {
        if let tappedButtonDelegate = tappedButtonDelegate {
            tappedButtonDelegate(.clear)
        }
    }
    
    @objc
    func tappedPickButton() {
        if let tappedButtonDelegate = tappedButtonDelegate {
            tappedButtonDelegate(.pick)
        }
    }
}
