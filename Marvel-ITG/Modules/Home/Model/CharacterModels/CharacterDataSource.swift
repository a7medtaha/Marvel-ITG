//
//  CharacterDataSource.swift
//  Marvel-ITG
//
//  Created by a7med on 3/5/20.
//  Copyright © 2020 a7med. All rights reserved.
//

import Foundation
struct CharacterDataSource : Codable {
    let limit: Int?
    let numberOfCharacter: Int?
    let characters: [Character]?
    
    enum CodingKeys: String, CodingKey{
        case numberOfCharacters = "count"
        case characters = "results"
        case limit
    }
//
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        numberOfCharacter = try values.decodeIfPresent(Int.self, forKey: .numberOfCharacters)
        limit = try values.decodeIfPresent(Int.self, forKey: .limit)
        characters = try values.decodeIfPresent([Character].self, forKey: .characters)
    }
    
    func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: CodingKeys.self)
        try values.encodeIfPresent(self.numberOfCharacter, forKey: .numberOfCharacters)
        try values.encodeIfPresent(self.characters, forKey: .characters)
        try values.encodeIfPresent(self.limit, forKey: .limit)
    }
    
}
