//
//  CommonThumbnailCell.swift
//  TechChallengeTVUN
//
//  Created by Carlos Uribe on 06/08/23.
//

import UIKit

class CommonThumbnailCell: UICollectionViewCell {
    static let identifier = "ThumbnailCell"
    var onReuse: () -> Void = {}

    lazy var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 5
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    override func prepareForReuse() {
        super.prepareForReuse()

        image.image = nil
        image.cancelImageLoad()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(image)

        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: self.topAnchor),
            image.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            image.leftAnchor.constraint(equalTo: self.leftAnchor),
            image.rightAnchor.constraint(equalTo: self.rightAnchor)
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
