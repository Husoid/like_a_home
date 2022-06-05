//
//  ProductTableView.swift
//  like_a_home
//
//  Created by User on 03/06/2022.
//

import UIKit

class ProductTableView: UIView {

    private lazy var productTableView: UITableView = {
        let productTableView = UITableView(frame: .zero, style: .grouped)
        productTableView.translatesAutoresizingMaskIntoConstraints = false
        productTableView.dataSource = self
        productTableView.delegate = self
        productTableView.backgroundColor = UIColor(named: "BackgroundColor")
        return productTableView
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        layou()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layou() {
        addSubview(productTableView)
        
        NSLayoutConstraint.activate([
            productTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            productTableView.topAnchor.constraint(equalTo: topAnchor),
            productTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            productTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        
        ])
    }
}


// MARK: -> UITableViewDataSource
extension ProductTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = UIColor(named: "BackgroundColor")
        return cell
    }
    
    
}

// MARK: -> UITableViewDelegate
extension ProductTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}
