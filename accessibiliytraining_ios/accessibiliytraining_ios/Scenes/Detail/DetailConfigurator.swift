//
//  DetailConfigurator.swift
//  accessibiliytraining_ios
//
//  Created by Atkins Leung on 3/6/2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class DetailConfigurator
{
    class func createScene(detail: ListDetailModel) -> DetailViewController
    {
        let viewController = DetailViewController(nibName: nil, bundle: nil)
        let interactor = DetailInteractor(detail: detail)
        let presenter = DetailPresenter()
        let router = DetailRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        
        return viewController
    }
}
