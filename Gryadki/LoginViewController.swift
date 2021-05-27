
import UIKit
import SnapKit
import Amplify
import AmplifyPlugins
import AWSCore
class LoginViewController: UIViewController {
    var logoImageView: UIImageView = {
        var image = UIImageView(image: UIImage(named: "green gryadki"))

        return image
    }()
    var enterLabel: UILabel = {
        var label = UILabel()
            label.text = "Вход"
            label.textColor = .darkTextColor
            label.font = .systemFont(ofSize: 23, weight: .medium)
        return label
    }()
    var phoneNumberLabel: UILabel = {
        var label = UILabel()
            label.text = "Номер телефона"
            label.textColor = .lightTextColor
            label.font = .systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    var phoneTextfield: InputView = {
       var phoneTextfield = InputView(inputType: .phone, placeholder: "")
        phoneTextfield.layer.borderWidth = 2
        phoneTextfield.layer.borderColor = UIColor.mainGreenColor.cgColor
        return phoneTextfield
    }()
    var nextButton = MainButton(text: "Далее")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .mainBackgroundColor
        setupView()
        nextButton.tapAction = {
            self.tapAction()
        }
    }
    func tapAction() {
        let vc = SMSConfirmationViewController()
        self.navigationController?.pushViewController(vc, animated: true)
//        let credentialsProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "us-east-1_rkBlzF2Oh")
//        let configuration = AWSServiceConfiguration(region: .USEast1, credentialsProvider: credentialsProvider)
//        AWSServiceManager.default().defaultServiceConfiguration = configuration
//        
//       
//        var params = ["name":"87002164125"]
//        
//        let userPool = AWSCognitoIdentityUserPool(forKey: "myApp")
//        self.navigationController?.pushViewController(SMSConfirmationViewController(), animated: true)
//        try! Amplify.add(plugin: AWSCognitoAuthPlugin()
//
//
//        Amplify.configure()
//        Amplify.Auth.signUp(username: "77002164125") { (result) in
//            switch result {
//            case .success(let result):
//                print(result)
//            default:
//                break
//            }
//        }
    }
    func setupView() {
        view.addSubview(logoImageView)
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(120)
            make.centerX.equalToSuperview()
            make.width.equalTo(140)
            make.height.equalTo(65)
        }
        view.addSubview(enterLabel)
        enterLabel.snp.makeConstraints { make in
            make.left.equalTo(23)
            make.top.equalTo(logoImageView.snp.bottom).offset(20)
        }
        view.addSubview(phoneNumberLabel)
        phoneNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(enterLabel.snp.bottom).offset(7)
            make.left.equalTo(enterLabel)
        }
        view.addSubview(phoneTextfield)
        phoneTextfield.snp.makeConstraints { make in
            make.top.equalTo(phoneNumberLabel.snp.bottom).offset(7)
            make.right.equalTo(-23)
            make.left.equalTo(23)
            make.height.equalTo(41)
        }
        view.addSubview(nextButton)
        nextButton.snp.makeConstraints { make in
            make.top.equalTo(phoneTextfield.snp.bottom).offset(18)
            make.centerX.equalToSuperview()
            make.width.equalTo(330)
            make.height.equalTo(45)
        }
    }

}

