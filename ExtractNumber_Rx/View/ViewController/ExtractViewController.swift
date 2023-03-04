//
//  RootViewController.swift
//  Example_Programatic
//
//  Created by 김태성 on 2022/09/21.
//
import UIKit
import SnapKit
import RxSwift
import RxCocoa

class ExtractViewController: UIViewController {
    
    //MARK : Properties
    let pickMaxLineNumber = 10
    
    let disposeBag = DisposeBag()
    let rootViewModel = ExtractViewModel()
    

    //MARK : UI Component
    // 전체 화면 요소를 담는 StackView
    let uiCotainerView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.backgroundColor = DesiginService.appBackgroundColor
        stackView.spacing = 10
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        return stackView
    }()
    
    // Min ~ Max Number Input 요소를 담는 StackView
    let inputFieldView: UIView = {
        let view = UIView()
        view.backgroundColor = DesiginService.appViewColor
        view.layer.cornerRadius = 20
        
        return view
    }()
    let minNumberField: UITextField = {
        let textField = UITextField()
        textField.text = "0"
        textField.font = UIFont(name: "Arial Bold", size: 20)
        textField.textColor = .white
        textField.textAlignment = .center
        textField.backgroundColor = .lightGray
        textField.keyboardType = .numberPad
        
        textField.layer.shadowColor = UIColor(red: 71/255, green: 71/255, blue: 71/255, alpha: 1).cgColor
        textField.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        textField.layer.shadowOpacity = 1.0
        textField.layer.shadowRadius = 0.0
        
        return textField
    }()
    
    let waveCharlabel: UILabel = {
        let label = UILabel()
        label.text = "~"
        label.textColor = .white
        label.font = UIFont(name: "Arial", size: 30)
        
        return label
    }()
    
    let maxNumberField: UITextField = {
        let textField = UITextField()
        textField.text = "50"
        textField.font = UIFont(name: "Arial Bold", size: 20)
        textField.textColor = .white
        textField.textAlignment = .center
        textField.backgroundColor = .lightGray
        textField.keyboardType = .numberPad
        
        textField.layer.shadowColor = UIColor(red: 71/255, green: 71/255, blue: 71/255, alpha: 1).cgColor
        textField.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        textField.layer.shadowOpacity = 1.0
        textField.layer.shadowRadius = 0.0
        
        return textField
    }()
    
    // Random Number 요소를 담는 View
    let randomNumberView: UIView = {
        let view = UIView()
        view.backgroundColor = DesiginService.appViewColor
        
        view.clipsToBounds = true
        view.layer.cornerRadius = 25
        return view
    }()
    
    let randomNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont(name: "Arial Bold", size: 65)
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = DesiginService.appBackgroundColor
        
        label.clipsToBounds = true
        label.layer.cornerRadius = 90
        
        return label
    }()
    
    // pick Number 요소를 담는 StackView ( )
    let pickContainerView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = DesiginService.appViewColor
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        
        stackView.clipsToBounds = true
        stackView.layer.cornerRadius = 25
        return stackView
    }()
    
    let firstLineContainerView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    let secondsLineContainerView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    // button 요소를 담는 StackView ( Start, Stop, Pick )
    let functionButtonView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        
        return view
    }()
    
    let startButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .systemGray
        button.setTitle("Start", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont(name: "Arial Bold", size: 20)
        
        button.layer.shadowColor = UIColor.darkGray.cgColor
        button.layer.shadowOffset = CGSize(width: 3, height: 3)
        button.layer.shadowOpacity = 1.0
        button.layer.shadowRadius = 0.0
        
        button.layer.cornerRadius = 15
        
        return button
    }()
    
    let stopButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .systemGray
        button.setTitle("Stop", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont(name: "Arial Bold", size: 20)
        
        button.layer.shadowColor = UIColor.darkGray.cgColor
        button.layer.shadowOffset = CGSize(width: 3, height: 3)
        button.layer.shadowOpacity = 1.0
        button.layer.shadowRadius = 0.0
        
        button.layer.cornerRadius = 15
        
        return button
    }()
    
    let pickButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .systemGray
        button.setTitle("Pick", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont(name: "Arial Bold", size: 20)
        
        button.layer.shadowColor = UIColor.darkGray.cgColor
        button.layer.shadowOffset = CGSize(width: 3, height: 3)
        button.layer.shadowOpacity = 1.0
        button.layer.shadowRadius = 0.0
        
        button.layer.cornerRadius = 15
        
        return button
    }()
    
    let clearButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .systemGray
        button.setTitle("Clear", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont(name: "Arial Bold", size: 20)
        
        button.layer.shadowColor = UIColor.darkGray.cgColor
        button.layer.shadowOffset = CGSize(width: 3, height: 3)
        button.layer.shadowOpacity = 1.0
        button.layer.shadowRadius = 0.0
        
        button.layer.cornerRadius = 15
        
        return button
    }()
    
//    convenience init() {
//        self.init()
//    }
    
    //MARK : LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = DesiginService.appBackgroundColor
        configureUI()
        configureBinding()
    }
    
    // MARK : Event
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
}

extension ExtractViewController{
    //MARK : Methods
    func configureUI() {
        view.addSubview(uiCotainerView)
        
        uiCotainerView.snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(40)
            make.left.equalTo(view.safeAreaLayoutGuide).inset(5)
            make.right.equalTo(view.safeAreaLayoutGuide).inset(5)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(5)

        }
        
        uiCotainerView.addArrangedSubview(inputFieldView)
        inputFieldView.snp.makeConstraints{ make in
            make.height.equalToSuperview().multipliedBy(0.1)
        }
        inputFieldView.addSubview(minNumberField)
        minNumberField.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview().offset(-80)
            make.width.equalToSuperview().multipliedBy(0.23)
            make.height.equalToSuperview().multipliedBy(0.5)
        }
        inputFieldView.addSubview(waveCharlabel)
        waveCharlabel.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
            
        }
        
        inputFieldView.addSubview(maxNumberField)
        maxNumberField.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview().offset(80)
            make.width.equalToSuperview().multipliedBy(0.23)
            make.height.equalToSuperview().multipliedBy(0.5)
        }
        
        uiCotainerView.addArrangedSubview(randomNumberView)
        randomNumberView.snp.makeConstraints{ make in
            make.height.equalToSuperview().multipliedBy(0.45)
            
        }
        randomNumberView.addSubview(randomNumberLabel)
        randomNumberLabel.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(self.randomNumberView.snp.height).multipliedBy(0.6)
            make.height.equalTo(self.randomNumberView.snp.height).multipliedBy(0.6)
        }
        
        uiCotainerView.addArrangedSubview(pickContainerView)
        pickContainerView.snp.makeConstraints{ make in
            make.height.equalToSuperview().multipliedBy(0.2)
        }
        pickContainerView.addArrangedSubview(firstLineContainerView)
        firstLineContainerView.snp.makeConstraints{ make in
            make.width.equalToSuperview()
        }
        pickContainerView.addArrangedSubview(secondsLineContainerView)
        secondsLineContainerView.snp.makeConstraints{ make in
            make.width.equalToSuperview()
        }
        
        uiCotainerView.addArrangedSubview(functionButtonView)
        
        functionButtonView.addSubview(startButton)
        startButton.snp.makeConstraints{ make in
            make.top.equalToSuperview().inset(10)
            make.centerX.equalToSuperview().multipliedBy(0.25)
            make.width.equalToSuperview().multipliedBy(0.2)
            make.height.equalToSuperview().multipliedBy(0.3)
        }
        
        functionButtonView.addSubview(stopButton)
        stopButton.snp.makeConstraints{ make in
            make.top.equalToSuperview().inset(10)
            make.centerX.equalToSuperview().multipliedBy(0.75)
            make.width.equalToSuperview().multipliedBy(0.2)
            make.height.equalToSuperview().multipliedBy(0.3)
        }
        
        functionButtonView.addSubview(pickButton)
        pickButton.snp.makeConstraints{ make in
            make.top.equalToSuperview().inset(10)
            make.centerX.equalToSuperview().multipliedBy(1.25)
            make.width.equalToSuperview().multipliedBy(0.2)
            make.height.equalToSuperview().multipliedBy(0.3)
        }
        
        functionButtonView.addSubview(clearButton)
        clearButton.snp.makeConstraints{ make in
            make.top.equalToSuperview().inset(10)
            make.centerX.equalToSuperview().multipliedBy(1.75)
            make.width.equalToSuperview().multipliedBy(0.2)
            make.height.equalToSuperview().multipliedBy(0.3)
        }
        
        
    }
    
    func configureBinding() {
        startButton.rx.tap
            .bind(to: rootViewModel.tappedStart)
            .disposed(by: disposeBag)
        
        stopButton.rx.tap
            .bind(to: rootViewModel.tappedStop)
            .disposed(by: disposeBag)
        
        pickButton.rx.tap
            .bind(to: rootViewModel.tappedPick)
            .disposed(by: disposeBag)
        
        clearButton.rx.tap
            .bind(to: rootViewModel.tappedClear)
            .disposed(by: disposeBag)
        
        maxNumberField.rx.controlEvent(.editingDidEnd)
            .map{
                return self.maxNumberField.text!.trimmingCharacters(in: .whitespaces)
            }
            .bind(to: rootViewModel.changeMax)
            .disposed(by: disposeBag)
        
        minNumberField.rx.controlEvent(.editingDidEnd)
            .map{
                return self.minNumberField.text!.trimmingCharacters(in: .whitespaces)
            }
            .bind(to: rootViewModel.changeMin)
            .disposed(by: disposeBag)
        
        rootViewModel.randomNumber
            .asObservable()
            .subscribe(onNext: { randomNumber in
                self.randomNumberLabel.text = randomNumber.number
            })
            .disposed(by: disposeBag)
        
        rootViewModel.pickNumbers
            .asObserver()
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { pickNumbers in
                self.reloadPickViews(pickNumbers: pickNumbers)
            })
            .disposed(by: disposeBag)
        
        rootViewModel.isRandoming
            .asObserver()
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { isRandoming in
                self.reloadButtons(isRandoming: isRandoming)
            })
            .disposed(by: disposeBag)
    }
    
    
}

extension ExtractViewController{
    func makePickView(pickNumber: PickNumber? = nil) -> UIView{
        let view = UIView()
        let label = UILabel()
        
        guard let pickNumber = pickNumber else { return view }
                          
        label.font = UIFont(name: "Arial Bold", size: 20)
        label.text = pickNumber.number
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = pickNumber.color
        label.clipsToBounds = true
        label.layer.cornerRadius = 13
        
        view.addSubview(label)
        label.snp.makeConstraints{ (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.7)
            make.height.equalTo(label.snp.width)
        }
        
        return view
    }
    
    func reloadPickViews(pickNumbers: [PickNumber]){
        let count = pickNumbers.count
       
        firstLineContainerView.arrangedSubviews.forEach({ $0.removeFromSuperview() })
        secondsLineContainerView.arrangedSubviews.forEach({ $0.removeFromSuperview() })

        if(count == 0)
        {
            let label = UILabel()
            label.text = "Tapped Pick Button Please...."
            label.font = UIFont(name: "Arial Bold", size: 22)
            label.textColor = .white
            label.textAlignment = .center
            label.clipsToBounds = true
            
            firstLineContainerView.addArrangedSubview(label)
            
            return
        }
        for index in (0..<rootViewModel.numbersLength).reversed(){
            let pickNumber = pickNumbers[safe: index]
            let pickView = makePickView(pickNumber: pickNumber)
            
            let line = Int(floor(Double(index / pickMaxLineNumber))) + 1
            let lineIndex = index - pickMaxLineNumber
            
            if(line == 1){
                if(pickNumber == nil){
                    firstLineContainerView.addArrangedSubview(pickView)
                }
                else{
                    firstLineContainerView.insertArrangedSubview(pickView, at: 0)
                }
            }
            else if (line == 2){
                if(pickNumber == nil){
                    secondsLineContainerView.addArrangedSubview(pickView)
                }
                else{
                    secondsLineContainerView.insertArrangedSubview(pickView, at: 0)
                }
            }
        }
    }
    
    func reloadButtons(isRandoming: Bool){
        if(isRandoming){
            startButton.alpha = 0.5
            stopButton.alpha = 1
        }
        else{
            startButton.alpha = 1
            stopButton.alpha = 0.5
        }
        startButton.isEnabled = !isRandoming
        stopButton.isEnabled = isRandoming
    }
    
}
