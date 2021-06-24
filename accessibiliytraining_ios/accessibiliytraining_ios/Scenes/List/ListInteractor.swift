//
//  ListInteractor.swift
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

protocol ListBusinessLogic
{
    func setupViews( request: List.SetupViews.Request )
    func loadData( request: List.LoadData.Request )
    func selectRow( request: List.SelectRow.Request )
}

protocol ListDataStore
{
    var detail: ListDetailModel? { get }
}

class ListInteractor: ListBusinessLogic, ListDataStore
{
    var presenter: ListPresentationLogic?
    var worker: ListWorker?
    var listDataSource = ListDataSource()
    
    var list: ListDataModel?
    var detail: ListDetailModel?
        
    func setupViews(request: List.SetupViews.Request) {
        presenter?.presentSetupViews(response: List.SetupViews.Response())
    }
    
    func loadData(request: List.LoadData.Request) {
        listDataSource.getListData { (result) in
            switch result {
            case .success(let listData):
                self.list = listData
                self.presenter?.presentLoadData(response: List.LoadData.Response(list: listData))
            case .failure(_):
                break
            }
        }
    }
    
    func selectRow(request: List.SelectRow.Request) {
        guard let detail = list?.section[request.section].rows[request.row].detail else { return }
        self.detail = detail
        presenter?.presentSelectRow(response: List.SelectRow.Response())
    }
}
