//
//  ListCellView.swift
//  accessibiliytraining_ios
//
//  Created by Lun Lam on 03/06/2021.
//

import UIKit

struct ListSectionOneTableViewCellViewConfig {
    let title: String
    let amount: String
    let date: String
    let arrow: UIImage?
}

class ListSectionOneTableViewCell: UITableViewCell {
    
    let titleLabel = UILabel()
    let amountLabel = UILabel()
    let dateLabel = UILabel()
    let arrowImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setup()
    }
    
    func setup(){
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(amountLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(arrowImageView)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let views = [
            "title": titleLabel,
            "amount": amountLabel,
            "date": dateLabel,
            "arrow": arrowImageView
        ]
        
        contentView.addConstraints(NSLayoutConstraint.constraints(
                                    withVisualFormat: "H:|-8-[title]-(>=8)-[amount]-8-[arrow]-8-|", options: [], metrics: nil, views: views))
        contentView.addConstraints(NSLayoutConstraint.constraints(
                                    withVisualFormat: "V:|-8-[amount]-4-[date]-(>=8)-|", options: [], metrics: nil, views: views))
        contentView.addConstraints([
            NSLayoutConstraint(item: titleLabel, attribute: .centerY, relatedBy: .equal, toItem: contentView, attribute: .centerY, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: dateLabel, attribute: .left, relatedBy: .equal, toItem: amountLabel, attribute: .left, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: dateLabel, attribute: .width, relatedBy: .equal, toItem: amountLabel, attribute: .width, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: arrowImageView, attribute: .centerY, relatedBy: .equal, toItem: contentView, attribute: .centerY, multiplier: 1, constant: 0)
        ])
        arrowImageView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[arrow(20)]", options: [], metrics: nil, views: views))
        arrowImageView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[arrow(20)]", options: [], metrics: nil, views: views))
    }
    
    func config( with config: ListSectionOneTableViewCellViewConfig) {
        titleLabel.text = config.title
        amountLabel.text = config.amount
        dateLabel.text = config.date
        arrowImageView.image = config.arrow
    }
}

