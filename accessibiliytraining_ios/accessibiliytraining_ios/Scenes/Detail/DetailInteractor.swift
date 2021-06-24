//
//  DetailInteractor.swift
//  accessibiliytraining_ios
//
//  Created by Atkins Leung on 3/6/2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol DetailBusinessLogic {
    func requestSetupView(request: Detail.SetupView.Request)
}

protocol DetailDataStore
{
    var detail: ListDetailModel? { get }
}

class DetailInteractor: DetailBusinessLogic, DetailDataStore
{
    var presenter: DetailPresentationLogic?
    var worker: DetailWorker?

    var detail: ListDetailModel?

    init(detail: ListDetailModel?) {
        self.detail = detail
    }

    func requestSetupView(request: Detail.SetupView.Request) {
        presenter?.presentSetupView(response: Detail.SetupView.Response(detail: detail))
    }
}
