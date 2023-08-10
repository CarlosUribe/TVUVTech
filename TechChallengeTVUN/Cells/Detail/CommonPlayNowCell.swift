//
//  CommonPlayNowCell.swift
//  TechChallengeTVUN
//
//  Created by Carlos Uribe on 10/08/23.
//

import UIKit

class CommonPlayNowCell: UICollectionViewCell {
    static let identifier = "PlayNowCell"
    var model: FluffyNode?

    lazy var playButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.title = "Ver ahora"
        config.baseBackgroundColor = UIColor(red: 0.93, green: 0.40, blue: 0.17, alpha: 1.00)
        let playButton = UIButton(type: .system, primaryAction: UIAction(handler: { action in
            //TODO: Open player with video
        } ))
        playButton.configuration = config
        playButton.translatesAutoresizingMaskIntoConstraints = false
        return playButton
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        [playButton].forEach(self.addSubview)

        NSLayoutConstraint.activate([
            playButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            playButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15),
            playButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15),
            playButton.topAnchor.constraint(equalTo: self.topAnchor)
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
