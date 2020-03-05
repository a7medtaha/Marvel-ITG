//
//  ComicBaseData.swift
//  Marvel-ITG
//
//  Created by a7med on 3/5/20.
//  Copyright © 2020 a7med. All rights reserved.
//
import Foundation
struct ComicBaseData: Codable {
    
    let responseCode: Int?
    let apiDataSource: ComicBookDataSource?
    
    enum CodingKeys: String, CodingKey{
        case responseCode = "code"
        case apiDataSource = "data"
    }
}
