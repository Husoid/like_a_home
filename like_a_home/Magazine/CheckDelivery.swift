//
//  CheckDelivery.swift
//  like_a_home
//
//  Created by User on 05/06/2022.
//

import UIKit

class CheckDelivery: UIView {

private var onDelivery = true

    private let checkBoxView:UIView = {
        let checkBoxView = UIView()
        checkBoxView.translatesAutoresizingMaskIntoConstraints = false
        checkBoxView.backgroundColor = UIColor(named: "BackgroundColorL")
        checkBoxView.layer.cornerRadius = 10
        return checkBoxView
    }()
    
    private let checkButtonView:UIView = {
        let checkButtonView = UIView()
        checkButtonView.translatesAutoresizingMaskIntoConstraints = false
        checkButtonView.backgroundColor = UIColor(named: "TextCollection")
        checkButtonView.layer.cornerRadius = 5
        return checkButtonView
    }()
    
    private let textDelivery:UILabel = {
        let textDelivery = UILabel()
        textDelivery.translatesAutoresizingMaskIntoConstraints = false
        textDelivery.text = "Тюмень. Широтная, дом 163, кв. 34"
        textDelivery.textAlignment = .center
        return textDelivery
    }()
    
    private let buttonDelivery:UIButton = {
        let buttonDelivery = UIButton()
        buttonDelivery.translatesAutoresizingMaskIntoConstraints = false
        buttonDelivery.backgroundColor = UIColor(named: "BackgroundColor")
        buttonDelivery.layer.cornerRadius = 3
        buttonDelivery.setTitle("На доставку", for: .normal)
        buttonDelivery.setTitleColor(UIColor.black, for: .normal)
        return buttonDelivery
    }()
    
    private let onDeliveryLabel:UILabel = {
        let onDeliveryLabel = UILabel()
        onDeliveryLabel.translatesAutoresizingMaskIntoConstraints = false
        onDeliveryLabel.text = "На доставку"
        onDeliveryLabel.textAlignment = .center
        return onDeliveryLabel
    }()
    
    private let inRoomLabel:UILabel = {
        let inRoomLabel = UILabel()
        inRoomLabel.translatesAutoresizingMaskIntoConstraints = false
        inRoomLabel.text = "В пекарне"
        inRoomLabel.textAlignment = .center
        return inRoomLabel
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        
        [checkBoxView] .forEach {addSubview($0)}
        
        NSLayoutConstraint.activate([
            checkBoxView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            checkBoxView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            checkBoxView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            checkBoxView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        [checkButtonView, textDelivery] .forEach {checkBoxView.addSubview($0)}
        
        NSLayoutConstraint.activate([
            checkButtonView.leadingAnchor.constraint(equalTo: checkBoxView.leadingAnchor, constant: 16),
            checkButtonView.topAnchor.constraint(equalTo: checkBoxView.topAnchor, constant: 16),
            checkButtonView.trailingAnchor.constraint(equalTo: checkBoxView.trailingAnchor, constant: -16),
            checkButtonView.heightAnchor.constraint(equalToConstant: 40),
            
            textDelivery.leadingAnchor.constraint(equalTo: checkBoxView.leadingAnchor, constant: 16),
            textDelivery.topAnchor.constraint(equalTo: checkButtonView.bottomAnchor, constant: 8),
            textDelivery.trailingAnchor.constraint(equalTo: checkBoxView.trailingAnchor, constant: -16),
            textDelivery.bottomAnchor.constraint(equalTo: checkBoxView.bottomAnchor,constant: -8)
        ])
        
        [onDeliveryLabel, inRoomLabel , buttonDelivery] .forEach {checkButtonView.addSubview($0)}
        
        NSLayoutConstraint.activate([
            buttonDelivery.leadingAnchor.constraint(equalTo: checkButtonView.leadingAnchor, constant: 5),
            buttonDelivery.topAnchor.constraint(equalTo: checkButtonView.topAnchor, constant: 5),
            buttonDelivery.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2 - 42),
            buttonDelivery.bottomAnchor.constraint(equalTo: checkButtonView.bottomAnchor, constant: -5),
            
            onDeliveryLabel.leadingAnchor.constraint(equalTo: checkButtonView.leadingAnchor, constant: 5),
            onDeliveryLabel.topAnchor.constraint(equalTo: checkButtonView.topAnchor, constant: 5),
            onDeliveryLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2 - 42),
            onDeliveryLabel.bottomAnchor.constraint(equalTo: checkButtonView.bottomAnchor, constant: -5),
            
            inRoomLabel.topAnchor.constraint(equalTo: checkButtonView.topAnchor, constant: 5),
            inRoomLabel.trailingAnchor.constraint(equalTo: checkButtonView.trailingAnchor, constant: -5),
            inRoomLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2 - 42),
            inRoomLabel.bottomAnchor.constraint(equalTo: checkButtonView.bottomAnchor, constant: -5),
        ])
    }
    
    private func clickOnDeliveryLabel() {
        if onDelivery {
//            перемещаю кнопку на забор товара в магазине
            
            onDelivery = false
        } else {
//            перемещаю кнопку на доставку
            
            onDelivery = true
        }
    }
}
