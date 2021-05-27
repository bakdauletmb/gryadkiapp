
import UIKit

class SliderImageCollectionViewCell: UICollectionViewCell {
    let sliderImage: UIImageView =  {
        let sliderImage = UIImageView(image: #imageLiteral(resourceName: "sample"))
        sliderImage.layer.cornerRadius  = 10
        return sliderImage
    }()
    override init(frame: CGRect) {
        super.init(frame: .zero)
        addSubview(sliderImage)
        sliderImage.snp.makeConstraints { make in
            make.right.equalTo(-10)
            make.left.equalTo(10)
            make.top.bottom.equalToSuperview()
        }
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}
