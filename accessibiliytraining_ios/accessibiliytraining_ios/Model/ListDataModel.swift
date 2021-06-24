//
//  ListDataModel.swift
//  accessibiliytraining_ios
//
//  Created by Lun Lam on 02/06/2021.
//

import Foundation

struct ListImageModel: Codable {
    let title: String
    let date: String
}

struct ListDetailModel: Codable {
    let title: String
    let amount: String
    let date: String
    let item1: String
    let item2: String
    let item3: String
    let item4: String
    let images: [ListImageModel]
}

struct ListRowModel: Codable {
    
    let title: String
    let amount: String
    let date: String
    let detail: ListDetailModel?
    
}
    
struct ListSectionModel: Codable {
    
    let headerTitle: String
    let rows: [ ListRowModel ]
    
}

struct ListDataModel: Codable {
    
    let section: [ListSectionModel]
    
}
