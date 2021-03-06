//
//  LoginPresenter.swift
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

protocol LoginPresentationLogic
{
    func presentSetupView(response: Login.SetupView.Response)
    func presentLogin(response: Login.Login.Response)
}

class LoginPresenter: LoginPresentationLogic
{
    weak var viewController: LoginDisplayLogic?

    func presentSetupView(response: Login.SetupView.Response) {
        viewController?.displaySetupView(viewModel: Login.SetupView.ViewModel(
                                            title: "login_page_title".localized,
                                            iconImage: UIImage(named: "bacteria"),
                                            usernameTitle: "username_title".localized,
                                            passwordTitle: "password_title".localized,
                                            loginButtonTitle: "login_button".localized))
    }
    
    func presentLogin(response: Login.Login.Response) {
        if response.success {
            viewController?.displayLogin(viewModel: Login.Login.ViewModel(error: nil))
        }else{
            viewController?.displayLogin(viewModel: Login.Login.ViewModel(error: "username_error_message".localized))
        }
    }
}
