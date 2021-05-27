

import UIKit
class DateCell: UICollectionViewCell {
    var dayOfTheWeekLabel: UILabel =  {
        var label = UILabel()
            label.font = .systemFont(ofSize: 12, weight: .light)
            label.text = "пн."
            label.textColor = .lightTextColor
        
        return label
    }()
    var dateNumberLabel: UILabel =  {
        var label = UILabel()
            label.font = .systemFont(ofSize: 20, weight: .light)
            label.text = "14"
            label.textColor = .darkTextColor
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    func setupView() {
        contentView.addSubview(dayOfTheWeekLabel)
        dayOfTheWeekLabel.snp.makeConstraints { make in
            make.top.equalTo(4)
            make.centerX.equalToSuperview()
        }
        contentView.addSubview(dateNumberLabel)
        dateNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(dayOfTheWeekLabel.snp.bottom).offset(4)
            make.centerX.equalToSuperview()
        }
    }
}

