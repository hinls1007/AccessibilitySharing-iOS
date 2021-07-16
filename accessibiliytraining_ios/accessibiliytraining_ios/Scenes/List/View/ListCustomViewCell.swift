//
//  ListCellWithCustomView.swift
//  accessibiliytraining_ios
//
//  Created by Lun Lam on 03/06/2021.
//

import UIKit

class ListCustomViewCell: UITableViewCell {
    
    let listCustomView = ListCustomView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setup()
    }
    
    func setup(){
        
        contentView.addSubview(listCustomView)
        
        listCustomView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|", options: [], metrics: nil, views: ["view":listCustomView]))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|", options: [], metrics: nil, views: ["view":listCustomView]))
        
    }
    
}
