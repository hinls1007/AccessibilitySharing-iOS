//
//  LoginConfigurator.swift
//  accessibiliytraining_ios
//
//  Created by Lun Lam on 03/06/2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class LoginConfigurator
{
    class func createScene() -> LoginViewController
    {
        let viewController = LoginViewController(nibName: nil, bundle: nil)
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let router = LoginRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        
        return viewController
    }
}
