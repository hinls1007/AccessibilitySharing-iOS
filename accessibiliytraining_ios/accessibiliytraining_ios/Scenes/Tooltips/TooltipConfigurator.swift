//
//  TooltipConfigurator.swift
//  accessibiliytraining_ios
//
//  Created by Atkins Leung on 10/6/2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class TooltipConfigurator
{
    class func createScene(
        title: String?,
        content: String?
    ) -> TooltipViewController
    {
        let viewController = TooltipViewController(nibName: nil, bundle: nil)
        let interactor = TooltipInteractor(title: title, content: content)
        let presenter = TooltipPresenter()
        let router = TooltipRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        
        return viewController
    }
}
