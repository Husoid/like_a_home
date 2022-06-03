//
//  MagazineViewController.swift
//  likeAhome
//
//  Created by User on 31/05/2022.
//

import UIKit

class MagazineViewController: UIViewController {
    
    private let productTypeCollectionView: ProductTypeCollectionView = {
        let productTypeCollectionView = ProductTypeCollectionView()
        productTypeCollectionView.translatesAutoresizingMaskIntoConstraints = false
        return productTypeCollectionView
    }()
    
    private let productTableView: ProductTableView = {
        let productTableView = ProductTableView()
        productTableView.translatesAutoresizingMaskIntoConstraints = false
        return productTableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "BackgroundColor")
        layout()
    }
    
    private func layout() {
        
        [productTypeCollectionView, productTableView] .forEach {view.addSubview($0)}
        
        NSLayoutConstraint.activate([
            productTypeCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            productTypeCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            productTypeCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            productTypeCollectionView.heightAnchor.constraint(equalToConstant: 70),
            
            productTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            productTableView.topAnchor.constraint(equalTo: productTypeCollectionView.bottomAnchor),
            productTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            productTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
