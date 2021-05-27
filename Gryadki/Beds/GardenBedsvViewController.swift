

import UIKit
import ScalingCarousel
import FSCalendar
class GardenBedsvViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let carousel = ScalingCarouselView(withFrame: .zero,andInset: 10)
    var calendar =  FSCalendar()
    var expanded = true
    var dashBoard = ConditionsDashBoard()
    var todoview = TodayRecommendationsView()
    var actionsTableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Грядки"
        calendar.backgroundColor = .white
        self.navigationController?.navigationBar.barTintColor = .mainGreenColor
        self.view.backgroundColor = .mainBackgroundColor
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "Profile").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action:  #selector(addTapped))
        
        actionsTableView.delegate = self
        actionsTableView.dataSource = self
        actionsTableView.register(ActionsCell.self, forCellReuseIdentifier: "ActionsCell")
        actionsTableView.backgroundColor = .white
        actionsTableView.layer.cornerRadius = 10
        
        
        calendar.delegate = self
        calendar.dataSource = self
        let scopeGesture = UIPanGestureRecognizer(target: calendar, action: #selector(calendar.handleScopeGesture(_:)));
        calendar.addGestureRecognizer(scopeGesture)
        
        setupCarousel()
        setupView()
    }
    
    @objc func addTapped() {
        self.navigationController?.pushViewController(ProfileViewController(), animated: true)
    }
    func setupView() {
        view.addSubview(carousel)
        carousel.snp.makeConstraints { make in
            make.top.equalTo(120)
            make.left.right.equalToSuperview()
            make.height.equalTo(180)
        }
        view.addSubview(calendar)
        calendar.snp.makeConstraints { make in
            make.top.equalTo(carousel.snp.bottom).offset(14)
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.height.equalTo(200)
        }
        view.addSubview(dashBoard)
        dashBoard.snp.makeConstraints { make in
            make.top.equalTo(calendar.snp.bottom).offset(12)
            make.left.equalTo(16)
            make.height.equalTo(65)
            make.right.equalTo(-16)
        }
        view.addSubview(todoview)
        todoview.snp.makeConstraints { make in
            make.top.equalTo(dashBoard.snp.bottom).offset(12)
            make.left.equalTo(16)
            make.right.equalTo(-16)
        }
        view.addSubview(actionsTableView)
        actionsTableView.snp.makeConstraints { make in
            make.top.equalTo(todoview.snp.bottom).offset(12)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(350)
        }
    }
    func setupCarousel() {
        carousel.delegate = self
        carousel.dataSource = self
        carousel.backgroundColor = .clear
        carousel.register(SliderImageCollectionViewCell.self, forCellWithReuseIdentifier: "SliderImageCollectionViewCell")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.dequeueReusableCell(withIdentifier: "ActionsCell", for: indexPath) as! ActionsCell
    }
    
}
extension GardenBedsvViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderImageCollectionViewCell", for: indexPath)
        DispatchQueue.main.async {
            cell.setNeedsLayout()
            cell.layoutIfNeeded()
        }
        return cell
    }
}
extension GardenBedsvViewController: FSCalendarDelegate, FSCalendarDataSource {
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        calendar.snp.makeConstraints { make in
            make.height.equalTo(!expanded ? 40: 200)
        }
        expanded.toggle()
        view.layoutIfNeeded()
    }
}
