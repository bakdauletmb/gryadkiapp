

import UIKit

class ConditionsDashBoard: UIView, UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ConditionsCollectionCell", for: indexPath) as! ConditionsCollectionCell
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 42)
    }
    var collectionView: UICollectionView!
    var layout = UICollectionViewFlowLayout()
    override init(frame: CGRect) {
        super.init(frame: .zero)

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.register(ConditionsCollectionCell.self, forCellWithReuseIdentifier: "ConditionsCollectionCell")
        setupView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupView() {
        layer.cornerRadius = 10
        backgroundColor = .white
        
        addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(12)
            make.left.equalTo(12)
            make.right.equalTo(-12)
            make.bottom.equalTo(-12)
        }
        
    }
}
