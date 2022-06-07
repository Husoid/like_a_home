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
        productImage.backgroundColor = .gray
        return productImage
    }()
    
    private let productName: UILabel = {
        let productName = UILabel()
        productName.translatesAutoresizingMaskIntoConstraints = false
        productName.backgroundColor = .gray
        return productName
    }()
    
    private let productDiscription: UILabel = {
        let productDiscription = UILabel()
        productDiscription.translatesAutoresizingMaskIntoConstraints = false
        productDiscription.backgroundColor = .blue
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

        // Do any additional setup after loading the view.
    }
    
    private func layout() {
        view.backgroundColor = UIColor(named: "BackgroundColor")
        [productImage, productName, productDiscription, productPrise, cancelButton, addToCartButton] .forEach {view.addSubview($0)}
        
        NSLayoutConstraint.activate([
            productImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            productImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            productImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            productImage.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 16),
            
            productName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            productName.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 8),
            productName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            productName.heightAnchor.constraint(equalToConstant: 50),
            
            productDiscription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            productDiscription.topAnchor.constraint(equalTo: productName.bottomAnchor, constant: 8),
            productDiscription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            productDiscription.heightAnchor.constraint(equalToConstant: 200),
            
            productPrise.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            productPrise.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            productPrise.heightAnchor.constraint(equalToConstant: 50),
            productPrise.widthAnchor.constraint(equalToConstant: 60),
            
            addToCartButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            addToCartButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            addToCartButton.widthAnchor.constraint(equalToConstant: 120),
            
            cancelButton.topAnchor.constraint(equalTo: productImage.topAnchor,constant: 16),
            cancelButton.trailingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: -16),
            cancelButton.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 16),
            cancelButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 16)
        ])
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
