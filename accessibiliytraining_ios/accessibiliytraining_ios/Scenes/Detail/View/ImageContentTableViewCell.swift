//
//  ImageContentTableViewCell.swift
//  accessibiliytraining_ios
//
//  Created by Atkins Leung on 7/6/2021.
//

import UIKit

struct ImageContentCellViewConfig {
    let image: UIImage?
    let title: String
    let date: String
}

class ImageContentTableViewCell: UITableViewCell {

    lazy var contentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    let titleLabel = UILabel()
    let dateLabel = UILabel()
    let contentStackView: UIStackView = {
        let contentStackView = UIStackView()
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.axis = .vertical
        contentStackView.alignment = .center
        contentStackView.distribution = .fill
        return contentStackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        contentView.addSubview(contentImageView)
        contentView.addSubview(contentStackView)
        contentStackView.addArrangedSubview(titleLabel)
        contentStackView.addArrangedSubview(dateLabel)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            contentImageView.widthAnchor.constraint(equalToConstant: 30),
            contentImageView.heightAnchor.constraint(equalToConstant: 30),
            contentImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            contentImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            contentImageView.trailingAnchor.constraint(greaterThanOrEqualTo: contentStackView.leadingAnchor, constant: 10),
            contentStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant:8),
            contentStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant:-8),
            contentStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }

    func config(with config: ImageContentCellViewConfig) {
        contentImageView.image = config.image
        titleLabel.text = config.title
        dateLabel.text = config.date
        dateLabel.accessibilityLabel = config.date.accessibilityLabelDate

    }
}
