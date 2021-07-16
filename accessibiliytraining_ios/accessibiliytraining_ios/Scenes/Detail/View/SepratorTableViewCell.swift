//
//  SepratorTableViewCell.swift
//  accessibiliytraining_ios
//
//  Created by Atkins Leung on 3/6/2021.
//

import UIKit

class SepratorTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        accessibilityElementsHidden = true
        contentView.backgroundColor = .gray
        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
