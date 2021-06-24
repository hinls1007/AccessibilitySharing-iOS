//
//  ListConfigurator.swift
//  accessibiliytraining_ios
//
//  Created by Lun Lam on 03/06/2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class ListConfigurator
{
    class func createScene() -> ListViewController
    {
        let viewController = ListViewController(nibName: nil, bundle: nil)
        let interactor = ListInteractor()
        let presenter = ListPresenter()
        let router = ListRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        
        return viewController
    }
}
