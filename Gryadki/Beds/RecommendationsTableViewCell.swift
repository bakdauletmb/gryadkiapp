
import UIKit

class RecommendationsTableViewCell: UITableViewCell {
    var signImageView: UIImageView = {
        var image = UIImageView()
        image.image = #imageLiteral(resourceName: "Check Circle")
        image.contentMode = .scaleAspectFit
        return image
    }()
    var signLabel: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.text = "Полить"
        label.textColor = .darkTextColor
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        selectionStyle = .none
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupView() {
        addSubview(signImageView)
        signImageView.snp.makeConstraints { make in
            make.width.height.equalTo(24)
            make.left.bottom.equalToSuperview()
            make.top.equalTo(4)
        }
        addSubview(signLabel)
        signLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(signImageView.snp.right).offset(12)
        }
    }
}
