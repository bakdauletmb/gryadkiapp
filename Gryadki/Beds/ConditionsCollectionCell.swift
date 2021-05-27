
import UIKit

class ConditionsCollectionCell: UICollectionViewCell {
    var imageView: UIImageView = {
        var image = UIImageView()
        image.image = #imageLiteral(resourceName: "heat")
        image.contentMode = .scaleAspectFit
        return image
    }()
    var subTitle: UILabel = {
        var label = UILabel()
            label.font = .systemFont(ofSize: 8, weight: .regular)
            label.textColor = .lightTextColor
            label.text = "Температура"
        return label
    }()
    var mainTitle: UILabel = {
        var label = UILabel()
            label.font = .systemFont(ofSize: 20, weight: .medium)
            label.textColor = .darkTextColor
            label.text = "22"
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    func setupView() {
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.left.bottom.equalToSuperview()
            make.height.width.equalTo(42)
        }
        contentView.addSubview(subTitle)
        subTitle.snp.makeConstraints { make in
            make.top.equalTo(6)
            make.left.equalTo(imageView.snp.right).offset(6)
            make.right.equalTo(10)
        }
        contentView.addSubview(mainTitle)
        mainTitle.snp.makeConstraints { make in
            make.top.equalTo(subTitle.snp.bottom).offset(2)
            make.left.equalTo(subTitle)
        }
        
    }
}
