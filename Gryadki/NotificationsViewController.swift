

import UIKit

class NotificationsViewController: UIViewController {

    var backgroundView = UIImageView(image: #imageLiteral(resourceName: "diedCocumber"))
    var label: UILabel = {
        var label = UILabel()
        label.text = "К сожалению, Ваш саженец отошел в Огуречный рай."
        label.textAlignment = .center
        label.textColor = .darkTextColor
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.numberOfLines = 0
        return label
    }()
    var stopButton = MainButton(text: "Перестать скорбить")
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "F.A.Q"
        self.navigationController?.navigationBar.barTintColor = .mainGreenColor
        self.view.backgroundColor = .mainBackgroundColor
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "Profile").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action:  #selector(addTapped))
        self.view.backgroundColor = .mainBackgroundColor
        view.addSubview(backgroundView)
        backgroundView.snp.makeConstraints { make in
            make.top.equalTo(40)
            make.bottom.equalTo(-40)
            make.left.right.equalToSuperview()
        }
        view.addSubview(stopButton)
        stopButton.snp.makeConstraints { make in
            make.bottom.equalTo(-100)
            make.left.equalTo(60)
            make.right.equalTo(-60)
            make.height.equalTo(50)
        }
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(stopButton.snp.top).offset(-40)
            make.width.equalTo(180)
        }
    }
    @objc func addTapped() {
        self.navigationController?.pushViewController(ProfileViewController(), animated: true)
    }
    
}
