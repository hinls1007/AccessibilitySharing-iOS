//
//  DetailRouter.swift
//  accessibiliytraining_ios
//
//  Created by Atkins Leung on 3/6/2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol DetailRoutingLogic
{
    func routeToShowTooltipView()
}

protocol DetailDataPassing
{
    var dataStore: DetailDataStore? { get }
}

class DetailRouter: DetailRoutingLogic, DetailDataPassing
{
    weak var viewController: DetailViewController?
    var dataStore: DetailDataStore?

    func routeToShowTooltipView() {
        guard let detail = dataStore?.detail else { return }

        let tooltipVC = TooltipConfigurator.createScene(title: detail.title, content: detail.amount)
        tooltipVC.modalTransitionStyle = .crossDissolve
        tooltipVC.modalPresentationStyle = .overFullScreen
        tooltipVC.delegate = viewController
        viewController?.navigationController?.present(tooltipVC, animated: true)
    }
}
