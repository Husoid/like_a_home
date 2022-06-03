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
        typeCollection.register(TypeCollectionViewCell.self, forCellWithReuseIdentifier: "qqq")
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "qqq", for: indexPath) as! TypeCollectionViewCell;()
        cell.setupCell(items[indexPath.row])
        cell.backgroundColor = UIColor(named: "TextCollection")
        cell.layer.cornerRadius = 25
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 2
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension ProductTypeCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: items[indexPath.item].nameType!.size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17)]).width + 25, height: 50)
    }
    
}

// MARK: - CRUD Flow
extension ProductTypeCollectionView {
    /// Creates a ToDoListItem and stores it on your Back4App Database
    /// - Parameters:
    ///   - title: The title for the to-do task
    ///   - description: An optional description for the to-to task
    func createObject(nameType: String?, description: String?) {
        let item = ProductType(nameType: nameType, description: description)
        
        item.save { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let savedItem):
                self.items.append(savedItem)
                DispatchQueue.main.async {
//                    self.tableView.insertRows(at: [IndexPath(row: self.items.count - 1, section: 0)], with: .right)
                }
            case .failure(let error):
                DispatchQueue.main.async {
//                    self.showAlert(title: "Error", message: "Failed to save item: \(error.message)")
                }
            }
        }
    }
    
    /// Retrieves all the ToDoListItem objects from your Back4App Database
    func readObjects() {
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
    
    /// Updates a ToDoListItem object on your Back4App Database
    /// - Parameters:
    ///   - objectId: The object id of the ToDoListItem to update
    ///   - newTitle: New title for the to-to task
    ///   - newDescription: New description for the to-do task
    func updateObject(objectId: String, newNameType: String, newDescription: String?) {
        var item = ProductType(objectId: objectId)
        item.nameType = newNameType
        item.description = newDescription
        
        item.save { [weak self] result in
            switch result {
            case .success:
                if let row = self?.items.firstIndex(where: { $0.objectId == item.objectId }) {
                    self?.items[row] = item
                    DispatchQueue.main.async {
//                        self?.tableView.reloadRows(at: [IndexPath(row: row, section: 0)], with: .fade)
                    }
                }
            case .failure(let error):
                DispatchQueue.main.async {
//                    self?.showAlert(title: "Error", message: "Failed to save item: \(error.message)")
                }
            }
        }
    }
    
    /// Deletes a ToDoListItem on your Back4App Database
    /// - Parameter item: The item to be deleted on your Back4App Database
    func deleteObject(item: ProductType) {
        item.delete { [weak self] result in
            switch result {
            case .success:
                if let row = self?.items.firstIndex(where: { $0.objectId == item.objectId }) {
                    self?.items.remove(at: row)
                    DispatchQueue.main.async {
//                        self?.tableView.deleteRows(at: [IndexPath(row: row, section: 0)], with: .left)
                    }
                }
            case .failure(let error):
                DispatchQueue.main.async {
//                    self?.showAlert(title: "Error", message: "Failed to save item: \(error.message)")
                }
            }
        }
    }
}

