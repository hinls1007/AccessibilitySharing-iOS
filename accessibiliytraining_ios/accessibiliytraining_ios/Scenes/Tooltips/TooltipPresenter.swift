//
//  TooltipPresenter.swift
//  accessibiliytraining_ios
//
//  Created by Atkins Leung on 10/6/2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol TooltipPresentationLogic {
    func presentSetupView(response: Tooltip.SetupView.Response)
}

class TooltipPresenter: TooltipPresentationLogic
{
    weak var viewController: TooltipDisplayLogic?

    func presentSetupView(response: Tooltip.SetupView.Response) {
        let viewModel = Tooltip.SetupView.ViewModel(
            title: response.title,
            content: response.content
        )
        viewController?.displaySetupView(viewModel: viewModel)
    }
}
