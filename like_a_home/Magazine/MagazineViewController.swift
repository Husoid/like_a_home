//
//  MagazineViewController.swift
//  likeAhome
//
//  Created by User on 31/05/2022.
//

import UIKit

class MagazineViewController: UIViewController {
    
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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "BackgroundColor")
        
        readObjects()
        layout()
    }
    
    private func layout() {
        
       view.addSubview(typeCollection)
        
        NSLayoutConstraint.activate([
            typeCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            typeCollection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            typeCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            typeCollection.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}


//MARK: - UICollectionViewDataSource

extension MagazineViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "qqq", for: indexPath) as! TypeCollectionViewCell;()
        cell.setupCell(items[indexPath.row])
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension MagazineViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 50)
    }
    
}

// MARK: - CRUD Flow
extension MagazineViewController {
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
                    self.showAlert(title: "Error", message: "Failed to save item: \(error.message)")
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
                    self.showAlert(title: "Error", message: "Failed to save item: \(error.message)")
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
                    self?.showAlert(title: "Error", message: "Failed to save item: \(error.message)")
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
                    self?.showAlert(title: "Error", message: "Failed to save item: \(error.message)")
                }
            }
        }
    }
}

