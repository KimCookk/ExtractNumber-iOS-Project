import UIKit

fileprivate let cellID = "historyNumbeCell"

class HistoryNumberView: UIView {
    
    let historyCollectView: UICollectionView = {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        collectionViewFlowLayout.scrollDirection = .vertical
        collectionView.backgroundColor = .lightGray
        
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HistoryNumberView: ViewAble {
    
    func configureView() {
        historyCollectView.register(HistoryCollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        configureDraw()
        configureEvent()
    }
    
    func configureDraw() {
        self.addSubview(historyCollectView)
        historyCollectView.snp.makeConstraints{ (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.95)
            make.height.equalToSuperview().multipliedBy(0.95)
        }
    }
    
    func configureEvent() {
        historyCollectView.delegate = self
        historyCollectView.dataSource = self
    }
}

extension HistoryNumberView {
    func addHistoryNumber() {
        
    }
}

extension HistoryNumberView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? HistoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        //let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! HistoryCollectionViewCell
        
        cell.backgroundColor = .red
        return cell
    }
}

extension HistoryNumberView: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width / 10, height: self.frame.width / 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(5.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
}
