//
//  CommonGenreCell.swift
//  TechChallengeTVUN
//
//  Created by Carlos Uribe on 10/08/23.
//

import UIKit

class CommonGenreCell: UICollectionViewCell {
    static let identifier = "GenreCell"
    var model: FluffyNode? {
        didSet {
            setLabels()
        }
    }

    lazy var genreLabel: UILabel = {
        let genreLabel = UILabel()
        genreLabel.numberOfLines = 1
        genreLabel.textColor = .white
        genreLabel.font = .systemFont(ofSize: 13, weight: .regular, width: .standard)
        genreLabel.textAlignment = .center
        genreLabel.translatesAutoresizingMaskIntoConstraints = false

        return genreLabel
    }()

    lazy var classificationLabel: UILabel = {
        let classificationLabel = UILabel()
        classificationLabel.numberOfLines = 1
        classificationLabel.textColor = .white
        classificationLabel.font = .systemFont(ofSize: 8, weight: .regular, width: .standard)
        classificationLabel.layer.cornerRadius = 10
        classificationLabel.layer.borderColor = UIColor.white.cgColor
        classificationLabel.layer.borderWidth = 1
        classificationLabel.textAlignment = .center
        classificationLabel.translatesAutoresizingMaskIntoConstraints = false

        return classificationLabel
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)

        [genreLabel, classificationLabel].forEach(self.addSubview)

        NSLayoutConstraint.activate([
            genreLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            genreLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15),

            classificationLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            classificationLabel.leftAnchor.constraint(equalTo: self.genreLabel.rightAnchor, constant: 15),
            classificationLabel.heightAnchor.constraint(equalTo: self.heightAnchor, constant: 0),
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setLabels() {
        guard let model = model else { return }
        var genreLabel: String?
        var classificationLabel: String?

        if let hero = model.heroTarget {
            genreLabel = hero.genres.joined(separator: ", ")
            classificationLabel = hero.ratings.first?.ratingValue.rawValue
        } else if let video = model.video {
            genreLabel = video.genres.joined(separator: ", ")
            classificationLabel = video.ratings.first?.ratingValue.rawValue
        } else if let sports = model.sportsEvent?.playbackData.trackingMetadata.sharedMetadataJSON {
            genreLabel = sports.videoGenresFirst.rawValue
            classificationLabel = sports.videoRating.rawValue
        } else if let schedule = model.schedule?.trackingMetadata.sharedMetadataJSON {
            genreLabel = schedule.videoGenresFirst
            classificationLabel = schedule.videoRating?.rawValue
        }

        self.genreLabel.text = genreLabel
        self.classificationLabel.text = " \(classificationLabel ?? "")  "

    }
}
