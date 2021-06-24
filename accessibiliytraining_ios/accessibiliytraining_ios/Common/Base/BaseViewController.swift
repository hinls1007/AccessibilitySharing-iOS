//
//  BaseViewController.swift
//  accessibiliytraining_ios
//
//  Created by Lun Lam on 04/06/2021.
//

import UIKit

class BaseViewController: UIViewController {
    
    let backButton = UIButton()

    func setupBackButton(){
        backButton.setImage(UIImage(named: "ic_back"), for: .normal)
        backButton.addConstraints([
            NSLayoutConstraint(item: backButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: backButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 20)
        ])
        backButton.addTarget(self, action: #selector(backButtonDidPress), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
    }
    
    @objc func backButtonDidPress( sender: UIButton ){
        navigationController?.popViewController(animated: true)
    }
}
