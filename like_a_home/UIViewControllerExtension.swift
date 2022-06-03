//
//  UIViewControllerExtension.swift
//  like_a_home
//
//  Created by User on 03/06/2022.
//

import UIKit.UIViewController

extension UIViewController {
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let backAction = UIAlertAction(title: "Back", style: .default) { _ in
            alertController.dismiss(animated: true, completion: nil)
        }
                
        alertController.addAction(backAction)
        
        present(alertController, animated: true, completion: nil)
    }
}
