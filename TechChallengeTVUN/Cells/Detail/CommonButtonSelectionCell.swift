//
//  CommonButtonSelectionCell.swift
//  TechChallengeTVUN
//
//  Created by Carlos Uribe on 10/08/23.
//

import UIKit

class CommonButtonSelectionCell: UICollectionViewCell {
    static let identifier = "ButtonSelectionCell"
    var model: FluffyNode?

    lazy var detailButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.title = "Detalle"
        config.titleAlignment = .center
        config.cornerStyle = .capsule
        config.baseBackgroundColor = .darkGray

        let detailButton = UIButton(type: .system, primaryAction: UIAction(handler: { action in
            //TODO: Upodate view
        } ))
        detailButton.configuration = config
        detailButton.translatesAutoresizingMaskIntoConstraints = false
        return detailButton
    }()

    lazy var othersButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.title = "Otros recomiendan"
        config.titleAlignment = .center
        config.cornerStyle = .capsule
        config.baseBackgroundColor = .darkText

        let othersButton = UIButton(type: .system, primaryAction: UIAction(handler: { action in
            //TODO: Upodate view
        } ))
        othersButton.configuration = config
        othersButton.translatesAutoresizingMaskIntoConstraints = false
        return othersButton
    }()

    lazy var moreButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.title = "más"
        config.titleAlignment = .center
        config.cornerStyle = .capsule
        config.baseBackgroundColor = .darkText

        let moreButton = UIButton(type: .system, primaryAction: UIAction(handler: { action in
            //TODO: Upodate view
        } ))
        moreButton.configuration = config
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        return moreButton
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        [detailButton, othersButton, moreButton].forEach(self.addSubview)

        NSLayoutConstraint.activate([
            detailButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            detailButton.leftAnchor.constraint(equalTo: self.othersButton.rightAnchor, constant: 15),

            othersButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            othersButton.leftAnchor.constraint(equalTo: self.moreButton.rightAnchor, constant: 15),

            moreButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            moreButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5),

        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

