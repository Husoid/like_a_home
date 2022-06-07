//
//  ProductTypeCollectionView.swift
//  like_a_home
//
//  Created by User on 03/06/2022.
//

import UIKit

class ProductTypeCollectionView: UIView {

    var items: [ProductType] = []
    
    private lazy var typeCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let typeCollection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        typeCollection.translatesAutoresizingMaskIntoConstraints = false
        typeCollection.register(ProductTypeCollectionViewCell.self, forCellWithReuseIdentifier: "qqq")
        typeCollection.dataSource = self
        typeCollection.delegate = self
        typeCollection.backgroundColor = UIColor(named: "BackgroundColor")
        return typeCollection
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
        addSubview(typeCollection)
        NSLayoutConstraint.activate([
            typeCollection.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            typeCollection.topAnchor.constraint(equalTo: topAnchor),
            typeCollection.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            typeCollection.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}


//MARK: - UICollectionViewDataSource

extension ProductTypeCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "qqq", for: indexPath) as! ProductTypeCollectionViewCell;()
        cell.setupCell(items[indexPath.row])
        cell.backgroundColor = UIColor(named: "TextCollection")
        cell.layer.cornerRadius = 15
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension ProductTypeCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: items[indexPath.item].nameType!.size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17)]).width + 25, height: 40)
    }
    
}

// MARK: - CRUD Flow
extension ProductTypeCollectionView {
    
    /// Retrieves all the TypeProduct objects from your Back4App Database
    private func readObjects() {
        let query = ProductType.query()
        
        query.find { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let items):
                self.items = items
                DispatchQueue.main.async {
                    self.typeCollection.reloadData()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    MagazineViewController().showAlert(title: "Error", message: "Failed to save item: \(error.message)")
                }
            }
        }
    }
}

