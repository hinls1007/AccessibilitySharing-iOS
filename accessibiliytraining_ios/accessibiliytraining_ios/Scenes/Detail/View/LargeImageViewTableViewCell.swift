//
//  LargeImageViewTableViewCell.swift
//  accessibiliytraining_ios
//
//  Created by Atkins Leung on 3/6/2021.
//

import UIKit

struct LargeImageCellViewConfig {
    let image: UIImage?
}

class LargeImageViewTableViewCell: UITableViewCell {
    lazy var largeImageView: UIImageView = {
        let largeImageView = UIImageView()
        largeImageView.translatesAutoresizingMaskIntoConstraints = false
        largeImageView.contentMode = .scaleAspectFit
        return largeImageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        contentView.addSubview(largeImageView)
        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(equalToConstant: 120),
            largeImageView.widthAnchor.constraint(equalToConstant: 80),
            largeImageView.heightAnchor.constraint(equalToConstant: 80),
            largeImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            largeImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }

    func config(with config: LargeImageCellViewConfig) {
        largeImageView.image = config.image
    }
}
