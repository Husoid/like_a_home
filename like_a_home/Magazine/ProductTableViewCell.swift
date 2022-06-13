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
        viewCell.backgroundColor = .clear
        viewCell.layer.cornerRadius = 10
        return viewCell
    }()
    
    private let fotoProduct:UIImageView = {
        let fotoProduct = UIImageView()
        fotoProduct.translatesAutoresizingMaskIntoConstraints = false
        fotoProduct.backgroundColor = .clear
        return fotoProduct
    }()
    
    private let nameProduct:UILabel = {
        let nameProduct = UILabel()
        nameProduct.translatesAutoresizingMaskIntoConstraints = false
        nameProduct.backgroundColor = .clear
        return nameProduct
    }()
    
    private let descriptionProduct:UILabel = {
        let descriptionProduct = UILabel()
        descriptionProduct.translatesAutoresizingMaskIntoConstraints = false
        descriptionProduct.backgroundColor = .clear
        return descriptionProduct
    }()
    
    private let priseProduct:UILabel = {
        let priseProduct = UILabel()
        priseProduct.translatesAutoresizingMaskIntoConstraints = false
        priseProduct.backgroundColor = UIColor(named: "TextCollection")
        priseProduct.clipsToBounds = true
        priseProduct.layer.cornerRadius = 10
        priseProduct.layer.borderColor = UIColor.black.cgColor
        priseProduct.layer.borderWidth = 1
        priseProduct.textAlignment = .center
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
            fotoProduct.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3 - 16),
            fotoProduct.bottomAnchor.constraint(equalTo: viewCell.bottomAnchor, constant: -8),
            
            nameProduct.leadingAnchor.constraint(equalTo: fotoProduct.trailingAnchor, constant: 8),
            nameProduct.topAnchor.constraint(equalTo: viewCell.topAnchor, constant: 8),
            nameProduct.heightAnchor.constraint(equalToConstant: 20),
            nameProduct.trailingAnchor.constraint(equalTo: viewCell.trailingAnchor, constant: -8),
            
            descriptionProduct.leadingAnchor.constraint(equalTo: fotoProduct.trailingAnchor, constant: 8),
            descriptionProduct.topAnchor.constraint(equalTo: nameProduct.bottomAnchor,constant: 8),
            descriptionProduct.trailingAnchor.constraint(equalTo: viewCell.trailingAnchor, constant: -8),
            descriptionProduct.bottomAnchor.constraint(equalTo: priseProduct.topAnchor, constant: -8),
            
            priseProduct.leadingAnchor.constraint(equalTo: fotoProduct.trailingAnchor, constant: 8),
            priseProduct.heightAnchor.constraint(equalToConstant: 20),
            priseProduct.widthAnchor.constraint(equalToConstant: 60),
            priseProduct.bottomAnchor.constraint(equalTo: viewCell.bottomAnchor, constant: -8)
        ])
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setupCell(_ product: Product) {
        nameProduct.text = product.productName
        descriptionProduct.text = product.descriptionProduct
        let url = product.productFoto?.url
        let data = try? Data(contentsOf: url!)
        fotoProduct.image = UIImage(data: data!)
        priseProduct.text = String(product.prise!)
    }

}
