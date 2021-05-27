

import UIKit
class TodayRecommendationsView: UIView, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecommendationsTableViewCell",for: indexPath) as! RecommendationsTableViewCell
        cell.backgroundColor = .white
        return cell
    }
    
    
    var recommendationsLabel: UILabel = {
        var label = UILabel()
        label.text = "Рекомендации на сегодня"
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .darkTextColor
        
        return label
    }()
    var closeButton: UIButton = {
        var button = UIButton()
            button.setImage(#imageLiteral(resourceName: "close button"), for: .normal)
        
        return button
    }()
    var tableView = UITableView()
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
        tableView.register(RecommendationsTableViewCell.self, forCellReuseIdentifier: "RecommendationsTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .white
        backgroundColor = .white
        layer.cornerRadius = 16
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    func setupView() {
        addSubview(recommendationsLabel)
        recommendationsLabel.snp.makeConstraints { make in
            make.top.equalTo(13)
            make.left.equalTo(9)
        }
        addSubview(closeButton)
        closeButton.snp.makeConstraints { make in
            make.width.height.equalTo(30)
            make.right.equalTo(-12)
            make.top.equalTo(10)
        }
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(recommendationsLabel.snp.bottom).offset(10)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.bottom.equalTo(-2)
            make.height.equalTo(100)
        }
    }
    
}
