//
//  ListDataSource.swift
//  accessibiliytraining_ios
//
//  Created by Lun Lam on 04/06/2021.
//

import Foundation

class ListDataSource {
    
    func getListData( completion: @escaping (Result<ListDataModel,Error>)->Void ){
        if let path = Bundle.main.path(forResource: "list_data", ofType: "json") {
            let url = URL(fileURLWithPath: path)
            DispatchQueue.global(qos: .default).async {
                do{
                    let data = try  Data(contentsOf: url)
                    let listData = try JSONDecoder().decode(ListDataModel.self, from: data)
                    
                    DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                        completion(.success(listData) )
                    }
                }catch{
                    completion(.failure(error))
                }
            }
        }else{
            completion(.failure(NSError()))
        }
    }
    
}
