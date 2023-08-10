//
//  DetailView.swift
//  TechChallengeTVUN
//
//  Created by Carlos Uribe on 09/08/23.
//

import UIKit

enum DetailSections: Int {
    case header = 0
    case genre
    case playNow
    case buttonSelection
    case description
}

class DetailView: UIViewController {
    var model: FluffyNode? {
        didSet {
            setupBackgroundImage()
        }
    }

    lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        collectionView.register(CommonTitleCell.self, forCellWithReuseIdentifier: CommonTitleCell.identifier)
        collectionView.register(CommonGenreCell.self, forCellWithReuseIdentifier: CommonGenreCell.identifier)
        collectionView.register(CommonPlayNowCell.self, forCellWithReuseIdentifier: CommonPlayNowCell.identifier)
        collectionView.register(CommonButtonSelectionCell.self, forCellWithReuseIdentifier: CommonButtonSelectionCell.identifier)
        collectionView.register(CommonDescriptionCell.self, forCellWithReuseIdentifier: CommonDescriptionCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        return collectionView
    }()

    lazy var backgroundImageView: UIImageView = {
        let backgroundImageView = UIImageView()
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        backgroundImageView.layer.cornerRadius = 5
        backgroundImageView.addoverlay(color: .black, alpha: 0.4)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false

        return backgroundImageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }

    private func setupViews() {
        [backgroundImageView, collectionView].forEach(view.addSubview)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 150),
            collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 5),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -5),

            backgroundImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50),
            backgroundImageView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 5),
            backgroundImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -5)

        ])
    }

    private func setupBackgroundImage() {
        if let imageURL = URL(string: model?.image?.link ?? "") {
            backgroundImageView.loadImage(at: imageURL)
        } else if let imageURL = URL(string: model?.portraitFillImage?.link ?? "") {
            backgroundImageView.loadImage(at: imageURL)
        }else if let imageURL = URL(string: model?.tournamentLogo?.link ?? "") {
            backgroundImageView.loadImage(at: imageURL)
        }

    }
}

extension DetailView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {

    }
}

extension DetailView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = DetailSections(rawValue: indexPath.row)
        guard let model = model else { return UICollectionViewCell() }

        switch section {
        case .header:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CommonTitleCell.identifier, for: indexPath) as! CommonTitleCell
            cell.model = model

            return cell
        case .genre:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CommonGenreCell.identifier, for: indexPath) as! CommonGenreCell
            cell.model = model

            return cell
        case .playNow:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CommonPlayNowCell.identifier, for: indexPath) as! CommonPlayNowCell
            cell.model = model

            return cell
        case .buttonSelection:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CommonButtonSelectionCell.identifier, for: indexPath) as! CommonButtonSelectionCell

            cell.model = model

            return cell
        case .description:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CommonDescriptionCell.identifier, for: indexPath) as! CommonDescriptionCell

            cell.model = model

            return cell
        case .none:
            return UICollectionViewCell()
        }
    }

}

extension DetailView: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let section = DetailSections(rawValue: indexPath.row)
        switch section {
        case .header:
            return CGSize(width: collectionView.frame.width, height: 250)
        case .genre:
            return CGSize(width: collectionView.frame.width, height: 20)
        case .playNow:
            return CGSize(width: collectionView.frame.width, height: 50)
        case .buttonSelection:
            return CGSize(width: collectionView.frame.width, height: 40)
        case .description:
            return CGSize(width: collectionView.frame.width, height: 350)

        case .none:
            return .zero
        }

    }
}

