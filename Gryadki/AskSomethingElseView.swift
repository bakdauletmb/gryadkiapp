
import UIKit

class AskSomethingElseView: UIView {
    var label: UILabel = {
        var label = UILabel()
            label.text = "Если Вы не нашли ответы на интересующие Вас вопросы, то Вы можете задать вопрос нашему специалисту."
            label.font = .systemFont(ofSize: 16, weight: .regular)
            label.textColor = .darkTextColor
           label.numberOfLines = 0
        
        return label
    }()
    var textField: UITextView = {
        var textView = UITextView()
        textView.textColor = .lightTextColor
        textView.layer.borderWidth = 2
        textView.layer.cornerRadius = 20
        textView.layer.borderColor = UIColor.mainGreenColor.cgColor
        return textView
    }()
    var mainButton = MainButton(text: "Отправить")
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 15
        backgroundColor = .white
        addSubview(label)
        label.snp.makeConstraints { make in
            make.top.left.equalTo(16)
            make.right.equalTo(-16)
        }
        addSubview(textField)
        textField.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(8)
            make.left.right.equalTo(label)
            make.height.equalTo(150)
        }
        addSubview(mainButton)
        mainButton.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(10)
            make.left.right.equalTo(textField)
            make.height.equalTo(40)
            make.bottom.equalTo(-40)
        }
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}
