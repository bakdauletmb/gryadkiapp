
import UIKit
class ActionsCell: UITableViewCell {
    var signImageView: UIImageView = {
        var image = UIImageView()
        image.image = #imageLiteral(resourceName: "blueFrame")
        
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        return image
    }()
    var background = UIView()
    var applyButton = MainButton(text: "Применить")
    var signLabel: UILabel = {
        var label = UILabel()
            label.font = .systemFont(ofSize: 16, weight: .regular)
            label.text = "Полить"
            label.textColor = .darkTextColor
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(background)
        background.layer.cornerRadius = 20
        background.backgroundColor = .white
        self.backgroundColor = .clear
        background.snp.makeConstraints { make in
            make.top.equalTo(12)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        background.addSubview(signImageView)
        signImageView.snp.makeConstraints { make in
            make.top.left.bottom.equalToSuperview()
            make.height.width.equalTo(95)
        }
        background.addSubview(signLabel)
        signLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(signImageView.snp.right).offset(14)
        }
        background.addSubview(applyButton)
        applyButton.snp.makeConstraints { make in
            make.height.equalTo(36)
            make.width.equalTo(100)
            make.right.equalTo(-12)
            make.centerY.equalToSuperview()
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
