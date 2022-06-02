//
//  MagazineViewController.swift
//  likeAhome
//
//  Created by User on 31/05/2022.
//

import UIKit

class MagazineViewController: UIViewController {
    
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
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "qqq", for: indexPath) as! TypeCollectionViewCell;()
        return cell
    }
    

}

//MARK: - UICollectionViewDelegateFlowLayout

extension MagazineViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 50)
    }

    
}
