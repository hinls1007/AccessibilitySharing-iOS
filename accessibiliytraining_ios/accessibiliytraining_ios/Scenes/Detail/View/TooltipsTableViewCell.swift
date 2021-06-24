//
//  TooltipsTableViewCell.swift
//  accessibiliytraining_ios
//
//  Created by Atkins Leung on 3/6/2021.
//

import UIKit

struct TooltipsCellViewConfig{
    let title: String
    let amount: String
    let date: String
}

protocol TooltipsTableViewCellDelegate: class {
    func tableViewCellTooltipsDidPress(_ cell: TooltipsTableViewCell)
}

class TooltipsTableViewCell: UITableViewCell {

    let titleLabel = UILabel()
    lazy var tooltipsButton: UIButton = {
        let tooltipsButton = UIButton()
        tooltipsButton.setImage(UIImage(named: "ic_info"), for: .normal)
        tooltipsButton.addTarget(self, action: #selector(tooltipsDidPress), for: .touchUpInside)
        return tooltipsButton
    }()
    let amountLabel = UILabel()
    let dateLabel = UILabel()
    weak var delegate: TooltipsTableViewCellDelegate?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    func setup() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(tooltipsButton)
        contentView.addSubview(amountLabel)
        contentView.addSubview(dateLabel)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        tooltipsButton.translatesAutoresizingMaskIntoConstraints = false
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false

        let views = [
            "title": titleLabel,
            "tooltips": tooltipsButton,
            "amount": amountLabel,
            "date": dateLabel,
        ]

        contentView.addConstraints(NSLayoutConstraint.constraints(
                                    withVisualFormat: "H:|-8-[title]-8-[tooltips(20)]-(>=8)-[amount]-8-|", options: [], metrics: nil, views: views))
        contentView.addConstraints(NSLayoutConstraint.constraints(
                                    withVisualFormat: "V:|-8-[amount]-4-[date]-(>=8)-|", options: [], metrics: nil, views: views))
        contentView.addConstraints([
            NSLayoutConstraint(item: titleLabel, attribute: .centerY, relatedBy: .equal, toItem: contentView, attribute: .centerY, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: tooltipsButton, attribute: .centerY, relatedBy: .equal, toItem: titleLabel, attribute: .centerY, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: dateLabel, attribute: .left, relatedBy: .equal, toItem: amountLabel, attribute: .left, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: dateLabel, attribute: .width, relatedBy: .equal, toItem: amountLabel, attribute: .width, multiplier: 1, constant: 0),
        ])

        tooltipsButton.addConstraints(NSLayoutConstraint.constraints(
                                    withVisualFormat: "V:[tooltips(20)]", options: [], metrics: nil, views: views))
    }

    func config( with config: TooltipsCellViewConfig ){
        titleLabel.text = config.title
        amountLabel.text = config.amount
        dateLabel.text = config.date
    }

    @objc func tooltipsDidPress(_ sender: UIButton) {
        delegate?.tableViewCellTooltipsDidPress(self)
    }
}
