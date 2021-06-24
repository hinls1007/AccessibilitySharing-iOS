//
//  TooltipsView.swift
//  accessibiliytraining_ios
//
//  Created by Atkins Leung on 10/6/2021.
//

import UIKit

protocol TooltipViewDelegate: class {
    func closeButtonDidPress(_ view: TooltipView)
}


class TooltipView: UIView {
    enum Dimens {
        static let containerViewTopPadding: CGFloat = 24
        static let containerViewBottomPadding: CGFloat = 24
        static let scrollViewToCtaViewPadding: CGFloat = 40
        static let shadowImageVIewToCtaViewPadding: CGFloat = 16
    }

    lazy var containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .red
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()

    lazy var containerStackView: UIStackView = {
        let containerStackView = UIStackView()
        containerStackView.axis = .vertical
        containerStackView.alignment = .top
        containerStackView.spacing = 8
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        return containerStackView
    }()

    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .left
        titleLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .vertical)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()

    lazy var contentLabel: UILabel = {
        let contentLabel = UILabel()
        contentLabel.textAlignment = .left
        contentLabel.numberOfLines = 0
        return contentLabel
    }()

    lazy var closeButton: UIButton = {
        let closeButton = UIButton()
        closeButton.setImage(UIImage(named: "ic_close"), for: .normal)
        closeButton.addTarget(self, action: #selector(closeButtonDidPress(_:)), for: .touchUpInside)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        return closeButton
    }()

    weak var delegate: TooltipViewDelegate?

    init() {
        super.init(frame: .zero)
        commitInit()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func commitInit() {
        addViews()
        activeConstraints()
    }

    private func addViews() {
        backgroundColor = .white
        addSubview(containerStackView)
        addSubview(closeButton)
        containerStackView.addArrangedSubview(titleLabel)
        containerStackView.addArrangedSubview(contentLabel)
    }

    private func activeConstraints() {
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            containerStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            containerStackView.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: 8),
            containerStackView.trailingAnchor.constraint(greaterThanOrEqualTo: closeButton.leadingAnchor, constant: 8),

            closeButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            closeButton.widthAnchor.constraint(equalToConstant: 20),
            closeButton.heightAnchor.constraint(equalToConstant: 20),
            closeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
        ])
    }


    func config(title: String?, content: String?) {
        titleLabel.text = title
        contentLabel.text = content
    }

    @objc func closeButtonDidPress(_ sender: UIButton) {
        delegate?.closeButtonDidPress(self)
    }
}
