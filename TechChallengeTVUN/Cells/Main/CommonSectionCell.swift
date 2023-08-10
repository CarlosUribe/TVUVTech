//
//  CommonSectionCell.swift
//  TechChallengeTVUN
//
//  Created by Carlos Uribe on 08/08/23.
//

import UIKit

class CommonSectionCell: UICollectionReusableView {
    static let identifier = "SectionCell"
    lazy var label: UILabel = {
        let label: UILabel = UILabel()
        label.numberOfLines = 0
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .bold, width: .standard)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
     }()

     override init(frame: CGRect) {
         super.init(frame: frame)

         addSubview(label)

         NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor),
            label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            label.rightAnchor.constraint(equalTo: self.rightAnchor),
         ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
