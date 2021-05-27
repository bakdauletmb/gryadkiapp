

import UIKit
class QuestionCell: UITableViewCell {
    var background: UIView = {
        var view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .white
        return view
    }()
    var answerLabel: UILabel = {
        var label = UILabel()
            label.text = "Вероятно, вы пропустили полив, и погода была жаркой. Если полив регулярный, то не хватает удобрений. Вы не воспользовались функцией удобрить, когда она была предложена. Воспользуйтесь этой функцией сейчас."
            label.numberOfLines = 0
            label.font = .systemFont(ofSize: 14, weight: .light)
            label.textColor = .lightTextColor
    
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        addSubview(background)
        background.snp.makeConstraints { make in
            make.top.equalTo(16)
            make.bottom.equalTo(-16)
            make.right.equalTo(-10)
            make.left.equalTo(60)
        }
        background.addSubview(answerLabel)
        answerLabel.snp.makeConstraints { make in
            make.top.left.equalTo(8)
            make.right.equalTo(-4)
            make.bottom.equalTo(-6)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}









class QuestionView: UIView {
    var background: UIView = {
        var view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .white
        return view
    }()
    var answerLabel: UILabel = {
        var label = UILabel()
            label.text = "Почему пожелтели листья?"
            label.numberOfLines = 0
            label.font = .systemFont(ofSize: 16, weight: .light)
            label.textColor = .lightTextColor
    
        return label
    }()
    var didTap: (()->())?
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(background)
        background.snp.makeConstraints { make in
            make.top.equalTo(8)
            make.bottom.equalToSuperview()
            make.left.equalTo(6)
            make.right.equalTo(-6)
            make.height.equalTo(60)
        }
        background.addSubview(answerLabel)
        answerLabel.snp.makeConstraints { make in
            make.top.left.equalTo(8)
            make.right.equalTo(-4)
            make.bottom.equalTo(2)
        }
        
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapView)))
    }
    @objc func didTapView() {
        didTap?()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

