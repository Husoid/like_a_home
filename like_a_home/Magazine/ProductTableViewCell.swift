//
//  ProductTableViewCell.swift
//  like_a_home
//
//  Created by User on 03/06/2022.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    private let viewCell:UIView = {
        let viewCell = UIView()
        viewCell.translatesAutoresizingMaskIntoConstraints = false
        viewCell.backgroundColor = .cyan
        viewCell.layer.cornerRadius = 10
        return viewCell
    }()
    
    private let fotoProduct:UIImageView = {
        let fotoProduct = UIImageView()
        fotoProduct.translatesAutoresizingMaskIntoConstraints = false
        fotoProduct.backgroundColor = .white
        return fotoProduct
    }()
    
    private let nameProduct:UILabel = {
        let nameProduct = UILabel()
        nameProduct.translatesAutoresizingMaskIntoConstraints = false
        nameProduct.backgroundColor = .gray
        return nameProduct
    }()
    
    private let descriptionProduct:UILabel = {
        let descriptionProduct = UILabel()
        descriptionProduct.translatesAutoresizingMaskIntoConstraints = false
        descriptionProduct.backgroundColor = .white
        return descriptionProduct
    }()
    
    private let priseProduct:UILabel = {
        let priseProduct = UILabel()
        priseProduct.translatesAutoresizingMaskIntoConstraints = false
        priseProduct.backgroundColor = .systemRed
        return priseProduct
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        addSubview(viewCell)
        NSLayoutConstraint.activate([
            viewCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            viewCell.topAnchor.constraint(equalTo: topAnchor, constant: 9),
            viewCell.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            viewCell.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
        [fotoProduct, nameProduct, descriptionProduct, priseProduct] .forEach {viewCell.addSubview($0)}
        NSLayoutConstraint.activate([
            fotoProduct.leadingAnchor.constraint(equalTo: viewCell.leadingAnchor, constant: 8),
            fotoProduct.topAnchor.constraint(equalTo: viewCell.topAnchor, constant: 8),
            fotoProduct.widthAnchor.constraint(equalToConstant: 100),
            fotoProduct.bottomAnchor.constraint(equalTo: viewCell.bottomAnchor, constant: -8),
            
            nameProduct.leadingAnchor.constraint(equalTo: fotoProduct.trailingAnchor, constant: 8),
            nameProduct.topAnchor.constraint(equalTo: viewCell.topAnchor, constant: 8),
            nameProduct.heightAnchor.constraint(equalToConstant: 10),
            nameProduct.trailingAnchor.constraint(equalTo: viewCell.trailingAnchor, constant: -8),
            
            descriptionProduct.leadingAnchor.constraint(equalTo: fotoProduct.trailingAnchor, constant: 8),
            descriptionProduct.topAnchor.constraint(equalTo: nameProduct.bottomAnchor,constant: 8),
            descriptionProduct.trailingAnchor.constraint(equalTo: viewCell.trailingAnchor, constant: -8),
            descriptionProduct.bottomAnchor.constraint(equalTo: priseProduct.bottomAnchor, constant: -8),
            
            priseProduct.leadingAnchor.constraint(equalTo: fotoProduct.trailingAnchor, constant: 8),
            priseProduct.heightAnchor.constraint(equalToConstant: 20),
            priseProduct.trailingAnchor.constraint(equalTo: viewCell.trailingAnchor, constant: -8),
            priseProduct.bottomAnchor.constraint(equalTo: viewCell.bottomAnchor, constant: -8)
        ])
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
