//
//  GardenBedsvViewController.swift
//  Gryadki
//
//  Created by Bakdaulet Myrzakerov on 07.04.2021.
//

import UIKit
import ScalingCarousel
class GardenBedsvViewController: UIViewController {
    let carousel = ScalingCarouselView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Грядки"
        self.navigationController?.navigationBar.barTintColor = .mainGreenColor
        self.view.backgroundColor = .mainBackgroundColor
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "Profile").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action:  #selector(addTapped))
        setupView()
        setupCarousel()
    }
    @objc func addTapped() {
        
    }
    func setupView() {
        view.addSubview(carousel)
        carousel.snp.makeConstraints { make in
            make.top.equalTo(62)
            make.left.right.equalToSuperview()
            make.height.equalTo(180)
        }
    }
    func setupCarousel() {
        
    }
}
