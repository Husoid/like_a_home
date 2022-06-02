//
//  TabBarViewController.swift
//  likeAhome
//
//  Created by User on 31/05/2022.
//

import UIKit

class TabBarViewController: UITabBarController {

    let magazinVC = MagazineViewController()
    let profileVC = ProfileViewController()
    let contactVC = ContactViewController()
    let cartVC = CartViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarController()
    }
    
    private func setupTabBarController() {
        
        let navControllerMagazine = UINavigationController(rootViewController: magazinVC)
        let navControllerProfile = UINavigationController(rootViewController: profileVC)
        let navControllerContact = UINavigationController(rootViewController: contactVC)
        let navControllerCart = UINavigationController(rootViewController: cartVC)

        
        magazinVC.tabBarItem.title = "Меню"
        magazinVC.navigationController?.navigationBar.isHidden = true
        magazinVC.tabBarItem.image = UIImage(systemName: "bolt")
        
        profileVC.tabBarItem.title = "Профиль"
        profileVC.navigationController?.navigationBar.isHidden = true
        profileVC.tabBarItem.image = UIImage(systemName: "bolt")
        
        contactVC.tabBarItem.title = "Контакты"
        contactVC.navigationController?.navigationBar.isHidden = true
        contactVC.tabBarItem.image = UIImage(systemName: "bolt")
        
        cartVC.tabBarItem.title = "Корзина"
        cartVC.navigationController?.navigationBar.isHidden = true
        cartVC.tabBarItem.image = UIImage(systemName: "bolt")
        
        viewControllers = [navControllerMagazine, navControllerProfile, navControllerContact, navControllerCart]
    }

}
