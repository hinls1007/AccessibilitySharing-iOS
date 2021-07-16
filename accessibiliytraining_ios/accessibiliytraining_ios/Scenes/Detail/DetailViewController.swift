//
//  DetailViewController.swift
//  accessibiliytraining_ios
//
//  Created by Atkins Leung on 3/6/2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol DetailDisplayLogic: class {
    func displaySetupView(viewModel: Detail.SetupView.ViewModel)
}

class DetailViewController: BaseViewController, DetailDisplayLogic
{
    var interactor: DetailBusinessLogic?
    var router: (DetailRoutingLogic & DetailDataPassing)?

    var sections: [Detail.DetailRow] = []

    static let largeImageViewTableViewCellReuseId = "LargeImageViewTableViewCellReuseId"
    static let tooltipsTableViewCellReuseId = "TooltipsTableViewCellReuseId"
    static let sepratorTableViewCellReuseId = "SepratorTableViewCellReuseId"
    static let dividerContentTableViewCellReuseId = "DividerContentTableViewCellReuseId"
    static let imageContentTableViewCellReuseId = "ImageContentTableViewCellReuseId"

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedSectionHeaderHeight = UITableView.automaticDimension
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.rowHeight = UITableView.automaticDimension
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 16, right: 0)
        tableView.separatorInset = .zero
        tableView.allowsSelection = false
        tableView.register(LargeImageViewTableViewCell.self, forCellReuseIdentifier: DetailViewController.largeImageViewTableViewCellReuseId)
        tableView.register(TooltipsTableViewCell.self, forCellReuseIdentifier: DetailViewController.tooltipsTableViewCellReuseId)
        tableView.register(SepratorTableViewCell.self, forCellReuseIdentifier: DetailViewController.sepratorTableViewCellReuseId)
        tableView.register(DividerContentTableViewCell.self, forCellReuseIdentifier: DetailViewController.dividerContentTableViewCellReuseId)
        tableView.register(ImageContentTableViewCell.self, forCellReuseIdentifier: DetailViewController.imageContentTableViewCellReuseId)

        return tableView
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
        
        setupBackButton()
        
        view.backgroundColor = .white
        view.addSubview(tableView)

        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[tableView]|", options: [], metrics: nil, views: ["tableView": tableView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[tableView]|", options: [], metrics: nil, views: ["tableView": tableView]))
        interactor?.requestSetupView(request: Detail.SetupView.Request())
    }

    func displaySetupView(viewModel: Detail.SetupView.ViewModel) {
        navigationItem.title = viewModel.title
        backButton.accessibilityLabel = viewModel.backButtonAccessibilityLabel

        sections = viewModel.sections
        tableView.reloadData()
    }
}

extension DetailViewController: UITableViewDelegate {

}

extension DetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(sections.count)
        return sections.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell?

        switch sections[indexPath.row] {
        case .largeImage(let largeImageCellViewConfig):
            let aCell = tableView.dequeueReusableCell(
                withIdentifier: DetailViewController.largeImageViewTableViewCellReuseId,
                for: indexPath
            ) as? LargeImageViewTableViewCell
            aCell?.config(with: largeImageCellViewConfig)
            cell = aCell
        case .tooltips(let tooltipsViewConfig):
            let aCell = tableView.dequeueReusableCell(
                withIdentifier: DetailViewController.tooltipsTableViewCellReuseId,
                for: indexPath
            ) as? TooltipsTableViewCell
            aCell?.config(with: tooltipsViewConfig)
            aCell?.delegate = self
            cell = aCell
        case .sectionSeparator:
            let aCell = tableView.dequeueReusableCell(
                withIdentifier: DetailViewController.sepratorTableViewCellReuseId,
                for: indexPath
            ) as? SepratorTableViewCell
            cell = aCell
        case .divider(let dividerCellViewConfig):
            let aCell = tableView.dequeueReusableCell(
                withIdentifier: DetailViewController.dividerContentTableViewCellReuseId,
                for: indexPath
            ) as? DividerContentTableViewCell
            aCell?.config(with: dividerCellViewConfig)
            cell = aCell
        case .imageList(let imageContentCellViewConfig):
            let aCell = tableView.dequeueReusableCell(
                withIdentifier: DetailViewController.imageContentTableViewCellReuseId,
                for: indexPath
            ) as? ImageContentTableViewCell
            aCell?.config(with: imageContentCellViewConfig)
            cell = aCell
        }

        return cell ?? UITableViewCell()
    }
}

extension DetailViewController: TooltipsTableViewCellDelegate {
    func tableViewCellTooltipsDidPress(_ cell: TooltipsTableViewCell) {
        view.accessibilityElementsHidden = true
        router?.routeToShowTooltipView()
    }
}

extension DetailViewController: TooltipViewControllerDelegate {
    func tooltipViewControllerDismiss(_ viewController: UIViewController) {
        view.accessibilityElementsHidden = false
    }
}
