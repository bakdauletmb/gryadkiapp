
import UIKit

class ProfileViewController: UIViewController {
    var profileView = ProfileView()
    var backgroundView: UIView = {
        var view = UIView()
            view.backgroundColor = #colorLiteral(red: 0.1254901961, green: 0.662745098, blue: 0.6392156863, alpha: 1)
            view.layer.cornerRadius = 10
        
        return view
    }()
    var labels = ["Способ оплаты","Адрес доставки","Социальные сети ","Помощь","О приложении"]
    var images : [UIImage] = [#imageLiteral(resourceName: "wallet"),#imageLiteral(resourceName: "Delicery address"),#imageLiteral(resourceName: "social help"),#imageLiteral(resourceName: "help icon"),#imageLiteral(resourceName: "about icon")]
    var whiteBackgroundView: UIView = {
       var view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        return view
    }()
    var tableView: UITableView = {
        var tableView = UITableView()
        
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Профиль"
        self.navigationController?.navigationBar.barTintColor = .mainGreenColor
        self.view.backgroundColor = .mainBackgroundColor
        self.navigationController?.navigationBar.tintColor = .white
        setupView()
        setupTableView()
    }
    func setupTableView() {
        tableView.isScrollEnabled = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: "ProfileTableViewCell")
        tableView.backgroundColor = .white
    }
    func setupView() {
        view.addSubview(backgroundView)
        backgroundView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(340)
            
        }
        view.addSubview(whiteBackgroundView)
        whiteBackgroundView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.height.equalTo(400)
            make.top.equalTo(backgroundView.snp.bottom).offset(26)
        }
        view.addSubview(profileView)
        profileView.snp.makeConstraints { make in
            make.height.equalTo(160)
            make.top.equalTo(backgroundView.snp.bottom).offset(-80)
            make.left.equalTo(58)
            make.right.equalTo(-58)
        }

        whiteBackgroundView.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(280)
        }
    }
}
extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as! ProfileTableViewCell
        cell.titleLabel.text = labels[indexPath.row]
        cell.iconImageView.image = images[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
