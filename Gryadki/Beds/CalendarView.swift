
import UIKit

class CalendarView: UIView {
    var calendar = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    var leftArrowButton: UIButton = {
        var button = UIButton()
            button.setImage(#imageLiteral(resourceName: "arrowLeft"), for: .normal)
        return button
    }()
    var rightArrowButton: UIButton = {
        var button = UIButton()
            button.setImage(#imageLiteral(resourceName: "rightArrow"), for: .normal)
        return button
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        calendar.delegate = self
        calendar.dataSource = self
        calendar.register(DateCell.self, forCellWithReuseIdentifier: "DateCell")
        calendar.backgroundColor = .white
        layer.cornerRadius = 10
        backgroundColor = .white
        
        addSubview(leftArrowButton)
        leftArrowButton.snp.makeConstraints { make in
            make.bottom.equalTo(-12)
            make.left.equalTo(7)
            make.width.equalTo(9)
            make.height.equalTo(16)
        }
        addSubview(rightArrowButton)
        rightArrowButton.snp.makeConstraints { make in
            make.bottom.equalTo(-12)
            make.right.equalTo(-7)
            make.width.equalTo(9)
            make.height.equalTo(16)
        }
        addSubview(calendar)
        calendar.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.left.equalTo(leftArrowButton.snp.right).offset(12)
            make.right.equalTo(rightArrowButton.snp.left).offset(-12)
        }
        
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}
extension CalendarView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        60
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DateCell", for: indexPath) as! DateCell

        return cell
    }
}
