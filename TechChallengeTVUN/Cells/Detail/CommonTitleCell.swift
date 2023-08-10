//
//  CommonTitleCell.swift
//  TechChallengeTVUN
//
//  Created by Carlos Uribe on 06/08/23.
//

import UIKit

class CommonTitleCell: UICollectionViewCell {
    static let identifier = "TitleCell"
    var model: FluffyNode? {
        didSet {
            setLabels()
        }
    }

    lazy var headerLabel: UILabel = {
        let header = UILabel()
        header.numberOfLines = 2
        header.textColor = .white
        header.lineBreakMode = .byWordWrapping
        header.font = .systemFont(ofSize: 38, weight: .ultraLight, width: .standard)
        header.translatesAutoresizingMaskIntoConstraints = false

        return header
    }()

    lazy var subHeaderLabel: UILabel = {
        let subHeaderLabel = UILabel()
        subHeaderLabel.numberOfLines = 3
        subHeaderLabel.lineBreakMode = .byTruncatingTail
        subHeaderLabel.textColor = .white
        subHeaderLabel.font = .systemFont(ofSize: 13, weight: .light, width: .standard)
        subHeaderLabel.translatesAutoresizingMaskIntoConstraints = false

        return subHeaderLabel
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)

        [headerLabel, subHeaderLabel].forEach(self.addSubview)

        NSLayoutConstraint.activate([
            headerLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            headerLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15),
            headerLabel.widthAnchor.constraint(equalTo: self.widthAnchor, constant: 15),
            headerLabel.heightAnchor.constraint(equalTo: self.heightAnchor, constant: 100),

            subHeaderLabel.topAnchor.constraint(equalTo: self.topAnchor),
            subHeaderLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15),
            subHeaderLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15),
            subHeaderLabel.heightAnchor.constraint(equalTo: self.heightAnchor, constant: 50)
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setLabels() {
        guard let model = model else { return }
        var header: String?
        var subHeader: String?

        if let hero = model.heroTarget {
            header = hero.title
            subHeader = hero.description
        } else if let video = model.video {
            header = video.title
            subHeader = video.description
        } else if let sports = model.sportsEvent {
            header = sports.name
        } else if let schedule = model.schedule {
            header = schedule.title
        }

        headerLabel.text = header
        subHeaderLabel.text = subHeader

    }
}
