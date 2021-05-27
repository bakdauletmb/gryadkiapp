

import UIKit

class ProfileTableViewCell: UITableViewCell {
    var iconImageView: UIImageView = {
        var image = UIImageView()
            image.image = #imageLiteral(resourceName: "wallet")
        
        return image
    }()
    var titleLabel: UILabel = {
        var label = UILabel()
            label.text = "Способ оплаты"
            label.font = .systemFont(ofSize: 20, weight: .regular)
            label.textColor = .lightTextColor
        return label
    }()
    var arrowImageView: UIImageView = {
       var image = UIImageView()
        image.image = #imageLiteral(resourceName: "rightArrow")
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        setupView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupView() {
        addSubview(iconImageView)
        iconImageView.snp.makeConstraints { make in
            make.left.equalTo(26)
            make.bottom.equalTo(-26)
            make.top.equalTo(9)
            make.width.height.equalTo(20)
        }
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(12)
            make.left.equalTo(iconImageView.snp.right).offset(14)
        }
        addSubview(arrowImageView)
        arrowImageView.snp.makeConstraints { make in
            make.top.equalTo(iconImageView)
            make.right.equalTo(-18)
            make.width.equalTo(8.5)
            make.height.equalTo(14)
        }
    }
}
