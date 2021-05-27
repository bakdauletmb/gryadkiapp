import UIKit
enum InputTypes {
    case phone
    case plainText
    case secureText
    
    var isSecure: Bool {
        return .secureText == self
    }
}

enum InputViewTypes {
    case email
    case phone
    case iin
    case `default`
}


class InputView: UIView {
    
    //MARK: - Properties
    let inputType: InputTypes
    var placeholder: String
    private let icon: UIImage?
    var iconAction: (() -> ())?

    
    lazy var textField: UITextField = {
        let tf = UITextField()
            tf.layer.cornerRadius = 10
            tf.clipsToBounds = true
            tf.tag = 0
            tf.isSecureTextEntry = inputType.isSecure
            tf.borderStyle = .none
            tf.font = .systemFont(ofSize: 13, weight: .regular)
            tf.textColor = #colorLiteral(red: 0.9725490196, green: 0.9725490196, blue: 0.9725490196, alpha: 0.9)
            tf.backgroundColor = .white
            tf.attributedPlaceholder = NSAttributedString(string: placeholder,
                                                          attributes: [
                                                            NSAttributedString.Key.foregroundColor:  UIColor.lightTextColor,
                                                            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13, weight: .medium)])
            //margin left
            tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
            tf.leftViewMode = .always

        return tf
    }()
    
    lazy var phoneTextField: PhoneTextField = {
        let tf = PhoneTextField()
            tf.tag = 1
            tf.borderStyle = .none
            tf.font = .systemFont(ofSize: 24, weight: .medium)
            tf.textColor = #colorLiteral(red: 0.3058823529, green: 0.2980392157, blue: 0.2980392157, alpha: 1)
            tf.backgroundColor = .white
            tf.attributedPlaceholder = NSAttributedString(string: placeholder,
                                                      attributes: [
                                                        NSAttributedString.Key.foregroundColor: UIColor.lightTextColor,
                                                        NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13, weight: .medium)])
            //margin left
             tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
             tf.leftViewMode = .always
        
        return tf
    }()
    
    lazy var iconView: UIImageView = {
        let iv = UIImageView()
            iv.contentMode = .scaleAspectFit
            iv.image = icon
            iv.isUserInteractionEnabled = true
        
        return iv
    }()


    //MARK: - Initialization
    init(inputType: InputTypes, placeholder: String, icon: UIImage? = nil) {
        self.inputType = inputType
        self.placeholder = placeholder
        self.icon = icon
        super.init(frame: .zero)
        
        setupViews()
        setupGesture()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup functions
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    private func setupViews() {

        self.layer.cornerRadius = 8
        
        if inputType == .phone {
            self.addSubview(self.phoneTextField)
            self.phoneTextField.snp.makeConstraints { (make) in
                make.edges.equalToSuperview()
            }
        } else {
            self.addSubview(self.textField)
            self.textField.snp.makeConstraints { (make) in
                make.edges.equalToSuperview()
            }
        }
            addSubview(iconView)
            iconView.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.right.equalToSuperview().offset(-10)
                make.height.width.equalTo(23)
            }

    }
    
    private func setupGesture() -> Void {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(iconTarget))
        iconView.addGestureRecognizer(tapGesture)
        
    }
    @objc func iconTarget() -> Void {
        iconAction?()
    }


}

class PhoneTextField: UITextField {
    
    //MARK:- Preasure
    
    var didBeginEditing: (() -> ())?
    var didEndEditing: (() -> ())?
    
    fileprivate var label: UILabel = {
        let label = UILabel()
        label.text = ""
        
        return label
    }()
    
    //MARK:- Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- SetupViews
    func setupViews() -> Void {
        layer.cornerRadius = 10
        
        leftView = label
        leftViewMode = .always
        rightViewMode = .always
        font = UIFont.boldSystemFont(ofSize: 15)
        text = "+7"
        delegate = self
        keyboardType = .decimalPad
    }
    
}
//MARK:- UITextFieldDelegate
extension PhoneTextField: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let text = textField.text!
        let spaceIndex = [2, 6, 10, 13]

        if text == "+7" && string == "" {
            return false
        }

        if text.count == 16 && string != "" {
            return false
        }

        if spaceIndex.contains(textField.text!.count) && string != "" {
            textField.text!.append(" ")
        }
        
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        didBeginEditing?()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        didEndEditing?()
    }
}
