//
//  TooltipInteractor.swift
//  accessibiliytraining_ios
//
//  Created by Atkins Leung on 10/6/2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol TooltipBusinessLogic {
    func requestSetupView(request: Tooltip.SetupView.Request)
}

protocol TooltipDataStore {
}

class TooltipInteractor: TooltipBusinessLogic, TooltipDataStore {
    var presenter: TooltipPresentationLogic?
    var worker: TooltipWorker?
    
    var title: String?
    var content: String?

    init(title: String?, content: String?) {
        self.title = title
        self.content = content
    }

    func requestSetupView(request: Tooltip.SetupView.Request) {
        let response = Tooltip.SetupView.Response(title: title, content: content)
        presenter?.presentSetupView(response: response)
    }
}
