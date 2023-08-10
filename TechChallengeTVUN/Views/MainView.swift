//
//  MainView.swift
//  TechChallengeTVUN
//
//  Created by Carlos Uribe on 05/08/23.
//

import UIKit
import Combine
import AVKit

class MainView: UIViewController {
    private let mainViewModel = MainViewModel()
    var model: MainDataModel?
    var cancellable = Set<AnyCancellable>()

    lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .black
        collectionView.register(CommonThumbnailCell.self, forCellWithReuseIdentifier: CommonThumbnailCell.identifier)
        collectionView.register(CommonSectionCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CommonSectionCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        // Do any additional setup after loading the view.
        setupViews()
        setupBindingView()
        serviceCall()
    }

    private func setupViews() {
        self.view.backgroundColor = .black
        [collectionView].forEach(view.addSubview)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50),
            collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 5),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -5)

        ])
    }

    private func setupBindingView() {
        mainViewModel.$model.sink { [collectionView] model in
            self.model = model
            collectionView.reloadData()
        }.store(in: &cancellable)
    }

    private func serviceCall() {
        mainViewModel.getMainData()
    }
}

extension MainView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = getModelForDetailView(indexPath)
        let detail = DetailView()
        detail.model = model
        self.present(detail, animated: true)
    }

    private func getModelForDetailView(_ indexPath: IndexPath) -> FluffyNode? {
        guard let model = model else { return nil }

        let content = model.data.uiPage.uiModules.edges[indexPath.section]
        let item = content.node.contents?.edges[indexPath.row].node

        return item
    }
}

extension MainView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        guard let model = model else {
            return 0
        }

        return model.data.uiPage.uiModules.edges.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let model = model else {
            return 0
        }

        let content = model.data.uiPage.uiModules.edges[section]
        let sizeOfContent = content.node.contents?.edges.count
        return sizeOfContent ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CommonThumbnailCell.identifier, for: indexPath) as! CommonThumbnailCell

        if let url = getURLForImage(indexPath) {
            cell.image.loadImage(at: url)
        }

        return cell
    }

    private func getURLForImage(_ indexPath: IndexPath) -> URL? {
        guard let model = model else { return nil }

        let content = model.data.uiPage.uiModules.edges[indexPath.section]
        let item = content.node.contents?.edges[indexPath.row].node
        if let url = URL(string: item?.image?.link ?? "") {
            return url
        } else if let url = URL(string: item?.portraitFillImage?.link ?? "") {
            return url
        }else if let url = URL(string: item?.tournamentLogo?.link ?? "") {
            return url
        }

        return nil
    }

}

extension MainView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CommonSectionCell.identifier, for: indexPath) as! CommonSectionCell
            sectionHeader.label.text = getHeaderTitle(indexPath.section)

            return sectionHeader
        }

        return UICollectionReusableView()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 25)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 135)
    }

    private func getHeaderTitle(_ section: Int) -> String {
        guard let model = model else {
            return ""
        }

        let content = model.data.uiPage.uiModules.edges[section]
        return content.node.title
    }
}

