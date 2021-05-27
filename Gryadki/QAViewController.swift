
import UIKit

class QAViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var backgroundView: UIView = {
        var view = UIView()
            view.backgroundColor = #colorLiteral(red: 0.1254901961, green: 0.662745098, blue: 0.6392156863, alpha: 1)
            view.layer.cornerRadius = 10
        
        return view
    }()
    var askLabel: UILabel = {
        var label = UILabel()
        label.text = "Как мы можем Вам помочь?"
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 28, weight: .semibold)
        return label
    }()
    var selected = [false,false,false]
    var askSomthingElse = AskSomethingElseView()
    var questionsTableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        self.title = "F.A.Q"
        self.navigationController?.navigationBar.barTintColor = .mainGreenColor
        self.view.backgroundColor = .mainBackgroundColor
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "Profile").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action:  #selector(addTapped))
        
        setupView()
        questionsTableView.delegate = self
        questionsTableView.backgroundColor = .clear
        questionsTableView.dataSource = self
        questionsTableView.register(QuestionCell.self, forCellReuseIdentifier: "QuestionCell")
    }
    @objc func addTapped() {
        self.navigationController?.pushViewController(ProfileViewController(), animated: true)
    }
    func setupView() {
        view.addSubview(backgroundView)
        backgroundView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(340)
        }
        backgroundView.addSubview(askLabel)
        askLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(40)
            make.width.equalTo(180)
        }
        view.addSubview(questionsTableView)
        questionsTableView.snp.makeConstraints { make in
            make.top.equalTo(backgroundView.snp.bottom).offset(16)
            make.left.right.equalToSuperview()
         //   make.bottom.equalTo(-20)
            make.height.equalTo(200)
        }
        view.addSubview(askSomthingElse)
        askSomthingElse.snp.makeConstraints { make in
            make.top.equalTo(questionsTableView.snp.bottom).offset(20)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(-10)
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        selected[section] ? 1 : 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        selected.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = QuestionView()
        headerView.didTap = {
            self.selected[section].toggle()
            tableView.reloadSections(IndexSet(section...section), with: .top)
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! QuestionCell
        cell.selectionStyle = .none
        return cell
    }
}
