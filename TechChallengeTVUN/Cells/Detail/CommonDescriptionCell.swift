//
//  CommonDescriptionCell.swift
//  TechChallengeTVUN
//
//  Created by Carlos Uribe on 10/08/23.
//

import UIKit

class CommonDescriptionCell: UICollectionViewCell {
    static let identifier = "DescriptionCell"
    var model: FluffyNode? {
        didSet {
            setLabels()
        }
    }

    lazy var descriptionLabel: UITextView = {
        let descriptionLabel = UITextView()
        descriptionLabel.textColor = .white
        descriptionLabel.backgroundColor = .clear
        descriptionLabel.font = .systemFont(ofSize: 13, weight: .regular, width: .standard)
        descriptionLabel.textAlignment = .justified
        descriptionLabel.isEditable = false
        descriptionLabel.isSelectable = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false

        return descriptionLabel
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        [descriptionLabel].forEach(self.addSubview)

        NSLayoutConstraint.activate([
            descriptionLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            descriptionLabel.leftAnchor.constraint(equalTo: self.leftAnchor),
            descriptionLabel.rightAnchor.constraint(equalTo: self.rightAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: self.topAnchor)

        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setLabels() {
        guard let model = model else { return }
        var description: String?

        if let hero = model.heroTarget {
            description = hero.description
        } else if let video = model.video {
            description = video.description + "\n" + getContributors(video.contributors)
        } else if let sports = model.sportsEvent {
            description = sports.name
        } else if let schedule = model.schedule {
            description = schedule.title
        }


        self.descriptionLabel.text = description

    }

    private func getContributors(_ contributors: [Contributor]) -> String {
        var director = "Director:"
        var elenco = "Elenco:"

        for cast in contributors {
            if let role = cast.roles.first {
                if role == .director {
                    director += "\n" + cast.name
                } else if role == .actor {
                    elenco += "\n" + cast.name
                }
            }
        }

        return director + "\n\n" + elenco
    }
}
