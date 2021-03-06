//
//  ProductDeteilViewController.swift
//  like_a_home
//
//  Created by User on 07/06/2022.
//

import UIKit

class ProductDeteilViewController: UIViewController {
    
    private let productImage: UIImageView = {
        let productImage = UIImageView()
        productImage.translatesAutoresizingMaskIntoConstraints = false
        productImage.backgroundColor = .clear
        return productImage
    }()
    
    private let productName: UILabel = {
        let productName = UILabel()
        productName.translatesAutoresizingMaskIntoConstraints = false
        productName.backgroundColor = .clear
        return productName
    }()
    
    private let productDiscription: UILabel = {
        let productDiscription = UILabel()
        productDiscription.translatesAutoresizingMaskIntoConstraints = false
        productDiscription.backgroundColor = .clear
        return productDiscription
    }()

    private let productPrise: UILabel = {
        let productPrise = UILabel()
        productPrise.translatesAutoresizingMaskIntoConstraints = false
        productPrise.backgroundColor = .cyan
        return productPrise
    }()
    
    private let cancelButton: UIButton = {
        let cancelButton = UIButton()
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.backgroundColor = .brown
        return cancelButton
    }()
    
    private let addToCartButton: UIButton = {
        let addToCartButton = UIButton()
        addToCartButton.translatesAutoresizingMaskIntoConstraints = false
        addToCartButton.backgroundColor = .systemRed
        return addToCartButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
    
    private func layout() {
        view.backgroundColor = UIColor(named: "BackgroundColor")
        [productImage, productName, productDiscription, productPrise, cancelButton, addToCartButton] .forEach {view.addSubview($0)}
        
        NSLayoutConstraint.activate([
            productImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            productImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            productImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            productImage.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 32),
            
            productName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            productName.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 8),
            productName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            productName.heightAnchor.constraint(equalToConstant: 50),
            
            productDiscription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            productDiscription.topAnchor.constraint(equalTo: productName.bottomAnchor, constant: 8),
            productDiscription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            productDiscription.heightAnchor.constraint(equalToConstant: 200),
            
            productPrise.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            productPrise.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
//            productPrise.heightAnchor.constraint(equalToConstant: 50),
            productPrise.widthAnchor.constraint(equalToConstant: 60),
            
            addToCartButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            addToCartButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            addToCartButton.widthAnchor.constraint(equalToConstant: 120),
            
            cancelButton.topAnchor.constraint(equalTo: productImage.topAnchor,constant: 16),
            cancelButton.trailingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: -16),
            cancelButton.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 16),
            cancelButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 16)
        ])
    }

    func completedData (_ product: Product) {
        let url = product.productFoto?.url
        let data = try? Data(contentsOf: url!)
        productImage.image = UIImage(data: data!)
        productName.text = product.productName
        productDiscription.text = product.descriptionProduct
        productPrise.text = String(product.prise!)
        
    }

}
