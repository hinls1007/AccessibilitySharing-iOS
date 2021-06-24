//
//  LoadingView.swift
//  accessibiliytraining_ios
//
//  Created by Lun Lam on 02/06/2021.
//

import UIKit

struct LoadingViewConfig {
    let title: String
}

class LoadingView: UIView {
    
    let spinner = UIActivityIndicatorView()
    
    init(){
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup(){
        backgroundColor = .white
        
        spinner.startAnimating()
        
        spinner.translatesAutoresizingMaskIntoConstraints = false
        addSubview(spinner)
        
        NSLayoutConstraint.activate([
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func config( with config: LoadingViewConfig ){
        
    }
    
    func show( in view: UIView ){
        view.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints([
            NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: self, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: self, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: 0),
        ])
    }
}

