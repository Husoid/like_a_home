//
//  TypeCollectionViewCell.swift
//  likeAhome
//
//  Created by User on 01/06/2022.
//

import UIKit

class TypeCollectionViewCell: UICollectionViewCell {
    
    private lazy var nameType: UILabel = {
        let nameType = UILabel()
        nameType.translatesAutoresizingMaskIntoConstraints = false
        nameType.font = .boldSystemFont(ofSize: 17)
        return nameType
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        contentView.addSubview(nameType)
        NSLayoutConstraint.activate([
            nameType.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            nameType.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func setupCell(_ productType: ProductType) {
        nameType.text = productType.nameType
    }
    
}
