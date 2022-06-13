//
//  ProductTableView.swift
//  like_a_home
//
//  Created by User on 03/06/2022.
//

import UIKit

protocol ProductTableViewDelegate: AnyObject {
    func buttonPressed(product: Product)
}

class ProductTableView: UIView {
    
    weak var delegate: (ProductTableViewDelegate)?
     
    var items: [Product] = []

    private lazy var productTableView: UITableView = {
        let productTableView = UITableView(frame: .zero, style: .plain)
        productTableView.translatesAutoresizingMaskIntoConstraints = false
        productTableView.dataSource = self
        productTableView.delegate = self
        productTableView.register(ProductTableViewCell.self, forCellReuseIdentifier: "www")
        return productTableView
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        readObjects()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
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
        items.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "www", for: indexPath) as! ProductTableViewCell
        
        cell.setupCell(items[indexPath.row])
        cell.backgroundColor = UIColor(named: "BackgroundColor")
        return cell
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.buttonPressed(product: items[indexPath.row])
    }
}

// MARK: -> UITableViewDelegate
extension ProductTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UIScreen.main.bounds.width / 2 - 42
    }
}


// MARK: - CRUD Flow
extension ProductTableView {
    
    /// Retrieves all the TypeProduct objects from your Back4App Database
    func readObjects() {
        let query = Product.query()
        
        query.find { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let items):
                self.items = items
                DispatchQueue.main.async {
                    self.productTableView.reloadData()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    MagazineViewController().showAlert(title: "Error", message: "Failed to save item: \(error.message)")
                }
            }
        }
    }
}

