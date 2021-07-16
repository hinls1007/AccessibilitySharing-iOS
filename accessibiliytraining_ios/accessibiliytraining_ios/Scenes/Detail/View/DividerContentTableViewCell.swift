//
//  DividerContentTableViewCell.swift
//  accessibiliytraining_ios
//
//  Created by Atkins Leung on 4/6/2021.
//

import UIKit

struct DividerCellViewConfig {
    let title: String
    let description: String
    let titleTwo: String
    let descriptionTwo: String
}

class DividerContentTableViewCell: UITableViewCell {

    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    let dividerView = UIView()
    let titleTwoLabel = UILabel()
    let descriptionTwoLabel = UILabel()

    lazy var leftStackView: UIStackView = {
        let leftStackView = UIStackView()
        leftStackView.translatesAutoresizingMaskIntoConstraints = false
        leftStackView.axis = .vertical
        leftStackView.alignment = .center
        leftStackView.distribution = .fillProportionally
        leftStackView.isAccessibilityElement = true
        return leftStackView
    }()

    lazy var rightStackView: UIStackView = {
        let rightStackView = UIStackView()
        rightStackView.translatesAutoresizingMaskIntoConstraints = false
        rightStackView.axis = .vertical
        rightStackView.alignment = .center
        rightStackView.distribution = .fillProportionally
        rightStackView.isAccessibilityElement = true
        return rightStackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func setup() {
        dividerView.backgroundColor = .gray

        contentView.addSubview(leftStackView)
        contentView.addSubview(rightStackView)
        leftStackView.addArrangedSubview(titleLabel)
        leftStackView.addArrangedSubview(descriptionLabel)
        contentView.addSubview(dividerView)
        rightStackView.addArrangedSubview(titleTwoLabel)
        rightStackView.addArrangedSubview(descriptionTwoLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        titleTwoLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionTwoLabel.translatesAutoresizingMaskIntoConstraints = false
        accessibilityElements = [leftStackView, rightStackView]

        NSLayoutConstraint.activate([
            leftStackView.heightAnchor.constraint(equalToConstant: 80),
            leftStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            leftStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            leftStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant:-8),
            leftStackView.trailingAnchor.constraint(equalTo: dividerView.leadingAnchor),
            leftStackView.widthAnchor.constraint(equalTo: rightStackView.widthAnchor),

            dividerView.widthAnchor.constraint(equalToConstant: 4),
            dividerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            dividerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            dividerView.trailingAnchor.constraint(equalTo: rightStackView.leadingAnchor),

            rightStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant:8),
            rightStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant:-8),
            rightStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }

    func config(with config: DividerCellViewConfig) {
        titleLabel.text = config.title
        descriptionLabel.text = config.description
        titleTwoLabel.text = config.titleTwo
        descriptionTwoLabel.text = config.descriptionTwo

        leftStackView.accessibilityLabel = "\(config.title), \(config.description)"
        rightStackView.accessibilityLabel = "\(config.titleTwo), \(config.descriptionTwo)"
    }
}
