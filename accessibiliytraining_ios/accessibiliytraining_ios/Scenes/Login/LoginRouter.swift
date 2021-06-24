//
//  LoginRouter.swift
//  accessibiliytraining_ios
//
//  Created by Lun Lam on 02/06/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol LoginRoutingLogic
{
    func routeToList()
}

protocol LoginDataPassing
{
    var dataStore: LoginDataStore? { get }
}

class LoginRouter: NSObject, LoginRoutingLogic, LoginDataPassing
{
    weak var viewController: LoginViewController?
    var dataStore: LoginDataStore?
    
    // MARK: Routing
    
    func routeToList() {
        let dstVc = ListConfigurator.createScene()
        viewController?.navigationController?.pushViewController(dstVc, animated: true)
    }
}
