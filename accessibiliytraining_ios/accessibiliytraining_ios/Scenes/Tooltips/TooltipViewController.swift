//
//  TooltipViewController.swift
//  accessibiliytraining_ios
//
//  Created by Atkins Leung on 10/6/2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol TooltipViewControllerDelegate: class {
    func tooltipViewControllerDismiss(_ viewController: UIViewController)
}

protocol TooltipDisplayLogic: class {
    func displaySetupView(viewModel: Tooltip.SetupView.ViewModel)
}

class TooltipViewController: UIViewController, TooltipDisplayLogic
{
    var interactor: TooltipBusinessLogic?
    var router: (TooltipRoutingLogic & TooltipDataPassing)?
    weak var delegate: TooltipViewControllerDelegate?
    
    lazy var tooltipView: TooltipView = {
        let tooltipView = TooltipView()
        tooltipView.layer.cornerRadius = 10
        tooltipView.layer.masksToBounds = true
        tooltipView.delegate = self
        tooltipView.translatesAutoresizingMaskIntoConstraints = false
        return tooltipView
    }()

    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    // MARK: View lifecycle
    override func viewDidLoad()
    {
        super.viewDidLoad()

        view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        view.addSubview(tooltipView)

        activeConstraints()
        interactor?.requestSetupView(request: Tooltip.SetupView.Request())
    }

    private func activeConstraints() {
        NSLayoutConstraint.activate([
            tooltipView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tooltipView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            tooltipView.heightAnchor.constraint(equalToConstant: 150),
            tooltipView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tooltipView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
    }

    func displaySetupView(viewModel: Tooltip.SetupView.ViewModel) {
        tooltipView.config(title: viewModel.title, content: viewModel.content)
    }
}

extension TooltipViewController: TooltipViewDelegate {
    func closeButtonDidPress(_ view: TooltipView) {
        dismiss(animated: true)
        delegate?.tooltipViewControllerDismiss(self)
    }
}

