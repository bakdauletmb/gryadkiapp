

import UIKit

class TabbarViewController: UITabBarController {
    let gardenBedVC = UINavigationController(rootViewController: GardenBedsvViewController())
    let notificationsVC = UINavigationController(rootViewController: NotificationsViewController())
    let ordersVC = OrdersViewController()
    let qaVC = UINavigationController(rootViewController: QAViewController())
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
        viewControllers = [gardenBedVC,ordersVC,notificationsVC,qaVC]
        self.tabBar.barTintColor = .white
    }
    func setupViewControllers() {
        gardenBedVC.tabBarItem = UITabBarItem.init(title: "Грядки", image: #imageLiteral(resourceName: "beds"), tag: 0)
        ordersVC.tabBarItem = UITabBarItem.init(title: "Заказ", image: #imageLiteral(resourceName: "orders"), tag: 1)
        notificationsVC.tabBarItem = UITabBarItem.init(title: "Уведомления", image: #imageLiteral(resourceName: "push"), tag: 2)
        qaVC.tabBarItem = UITabBarItem.init(title: "F.A.Q", image: #imageLiteral(resourceName: "questions"), tag: 3)
        self.tabBar.tintColor = .mainGreenColor
    }
}
