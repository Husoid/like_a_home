//
//  TypeCollectionViewCell.swift
//  likeAhome
//
//  Created by User on 01/06/2022.
//

import UIKit

class TypeCollectionViewCell: UICollectionViewCell {
    
    private lazy var leftPart:UIImageView = {
        let leftPart = UIImageView()
        leftPart.translatesAutoresizingMaskIntoConstraints = false
        leftPart.image = UIImage(named: "1")
        leftPart.contentMode = .scaleAspectFit
        return leftPart
    }()
    
    private lazy var rightPart:UIImageView = {
        let rightPart = UIImageView()
        rightPart.translatesAutoresizingMaskIntoConstraints = false
        rightPart.image = UIImage(named: "2")
//        rightPart.clipsToBounds = true
        rightPart.contentMode = .scaleAspectFit
        return rightPart
    }()
    
    private lazy var nameType: UILabel = {
        let nameType = UILabel()
        nameType.translatesAutoresizingMaskIntoConstraints = false
        nameType.text = "тестdsfdsfdsfdsf"
//        nameType.sizeToFit()
        nameType.backgroundColor = UIColor(named: "TextCollection")
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
        
        [leftPart, nameType, rightPart] .forEach {contentView.addSubview($0)}
        
        NSLayoutConstraint.activate([
            leftPart.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            leftPart.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            leftPart.widthAnchor.constraint(equalToConstant: 27),
            leftPart.heightAnchor.constraint(equalToConstant: 50),
            
            nameType.leadingAnchor.constraint(equalTo: leftPart.trailingAnchor),
            nameType.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            nameType.widthAnchor.constraint(equalToConstant: 200),
            nameType.heightAnchor.constraint(equalToConstant: 50),
            
            rightPart.leadingAnchor.constraint(equalTo: nameType.trailingAnchor),
            rightPart.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            rightPart.widthAnchor.constraint(equalToConstant: 27),
            rightPart.heightAnchor.constraint(equalToConstant: 50),
            rightPart.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
}
