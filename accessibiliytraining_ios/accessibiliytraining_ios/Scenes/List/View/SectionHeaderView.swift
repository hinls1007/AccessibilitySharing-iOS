//
//  SectionHeaderView.swift
//  accessibiliytraining_ios
//
//  Created by Lun Lam on 03/06/2021.
//

import UIKit

struct SectionHeaderViewConfig {
    let title: String
}

class SectionHeaderView: UITableViewHeaderFooterView {
    
    let titleLabel = UILabel()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setup()
    }
    
    func setup(){
        contentView.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[view]-8-|", options: [], metrics: nil, views: ["view":titleLabel]))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[view]-8-|", options: [], metrics: nil, views: ["view":titleLabel]))
    }
    
    func config( with config: SectionHeaderViewConfig ){
        titleLabel.text = config.title
        titleLabel.accessibilityTraits = .header
    }
}

