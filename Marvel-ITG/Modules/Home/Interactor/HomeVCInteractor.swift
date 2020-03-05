//
//  HomeVCInteractor.swift
//  Marvel-ITG
//
//  Created by a7med on 3/5/20.
//  Copyright © 2020 a7med. All rights reserved.
//

import Foundation
class HomeVCInteractor {

private let apiManager =  APIManager()
private let decoder = JSONDecoder()
typealias model = (CharacterBaseData)->()

    func get_charactors(offeset:Int, didDataReady: @escaping model, andErrorCompletion errorCompletion: @escaping errorCompletionType) {
        apiManager.contectToApiWith(url: AppUrls.shared.getCharacters(pageNumber: offeset),
                                methodType: .get,
                                params: nil,
                                success: { (json) in
                                    print("#jsn ==> ",json)
                                    if let data = try? JSONSerialization.data(withJSONObject: json) {
                                        
                                        do {
                                            let result = try self.decoder.decode(CharacterBaseData.self, from: data)
                                            didDataReady(result)
                                            
                                        }catch{
                                            print("XParsing model error\(error)")
                                            
                                        }
                                        
                                    }
    }) { (error, msg) in
        print(error, msg!)
        errorCompletion(error)
    }
}
}
