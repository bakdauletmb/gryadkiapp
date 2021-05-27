
import UIKit
class ProfileView: UIView {
    var profileImageView: UIImageView = {
        var image = UIImageView(image: #imageLiteral(resourceName: "profile-1"))
        
        return image
    }()
    
    var plusButton: UIButton = {
        var button = UIButton()
            button.setImage(#imageLiteral(resourceName: "plusButton"), for: .normal)
            button.layer.cornerRadius = 17
        
        return button
    }()
    var phoneNumberLabel: UILabel = {
        var label = UILabel()
            label.text = "Номер телефона"
            label.textColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
        return label
    }()
    
    var emailNumberLabel: UILabel = {
        var label = UILabel()
            label.text = "e-mail"
            label.textColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
        
        return label
    }()
    var nameLabel: UILabel = {
        var label = UILabel()
            label.text = "ИМЯ"
            label.font = .systemFont(ofSize: 20, weight: .bold)
            label.textColor = .white
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = #colorLiteral(red: 0.3058823529, green: 0.2980392157, blue: 0.2980392157, alpha: 1)
        self.layer.cornerRadius = 14
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(profileImageView)
        profileImageView.snp.makeConstraints { make in
            make.width.height.equalTo(120)
            make.centerX.equalToSuperview()
            make.top.equalTo(-60)
        }
        addSubview(plusButton)
        plusButton.snp.makeConstraints { make in
            make.bottom.equalTo(profileImageView.snp.bottom)
            make.width.height.equalTo(34)
            make.right.equalTo(profileImageView.snp.right)
        }
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(profileImageView.snp.bottom).offset(8)
        }
        addSubview(phoneNumberLabel)
        phoneNumberLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
        }
        addSubview(emailNumberLabel)
        emailNumberLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(phoneNumberLabel.snp.bottom).offset(10)
        }
    }
}
