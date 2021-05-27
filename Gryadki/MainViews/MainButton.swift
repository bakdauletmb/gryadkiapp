

import UIKit

class MainButton: UIButton {
    init(text: String) {
        super.init(frame: .zero)
        self.setTitle(text, for: .normal)
        self.setTitleColor(.white, for: .normal)
        self.backgroundColor = .mainGreenColor
        self.layer.cornerRadius = 15
        self.addTarget(self, action: #selector(targetAction), for: .touchUpInside)
    }
    var tapAction: (()->())?
    @objc func targetAction() {
        self.tapAction?()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}
