//
//  MagazineViewController.swift
//  likeAhome
//
//  Created by User on 31/05/2022.
//

import UIKit

class MagazineViewController: UIViewController {
    
    private let checkBoxView:CheckDelivery = {
        let checkBoxView = CheckDelivery()
        checkBoxView.translatesAutoresizingMaskIntoConstraints = false
        checkBoxView.backgroundColor = .clear
        checkBoxView.layer.cornerRadius = 10
        return checkBoxView
    }()
    
    private let productTypeCollectionView: ProductTypeCollectionView = {
        let productTypeCollectionView = ProductTypeCollectionView()
        productTypeCollectionView.translatesAutoresizingMaskIntoConstraints = false
        return productTypeCollectionView
    }()
    
    private lazy var productTableView: ProductTableView = {
        let productTableView = ProductTableView()
        productTableView.translatesAutoresizingMaskIntoConstraints = false
        productTableView.delegate = self
        return productTableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "BackgroundColor")
        layout()
    }
    
    private func layout() {
        
        [checkBoxView, productTypeCollectionView, productTableView] .forEach {view.addSubview($0)}
        
        NSLayoutConstraint.activate([
            checkBoxView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            checkBoxView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            checkBoxView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            checkBoxView.heightAnchor.constraint(equalToConstant: 150),
            
            productTypeCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            productTypeCollectionView.topAnchor.constraint(equalTo: checkBoxView.bottomAnchor),
            productTypeCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            productTypeCollectionView.heightAnchor.constraint(equalToConstant: 70),
            
            productTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            productTableView.topAnchor.constraint(equalTo: productTypeCollectionView.bottomAnchor),
            productTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            productTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    
}


//MARK: - ProductTableViewDelegate

extension MagazineViewController: ProductTableViewDelegate {
    func buttonPressed() {
        let detailVC = ProductDeteilViewController()
//        navigationController?.pushViewController(detailVC, animated: true)
        self.present(detailVC, animated: true)
    }
}
