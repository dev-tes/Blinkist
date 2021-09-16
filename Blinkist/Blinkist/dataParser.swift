//
//  dataParser.swift
//  Blinkist
//
//  Created by  Decagon on 27/07/2021.
//

import Foundation

// MARK: - Welcome
//struct Blinkist: Codable {
//    let welcomeJSONData: [JSONDatum]
//    
//    enum CodingKeys: String, CodingKey {
//        case welcomeJSONData = "jsonData"
//    }
//}

// MARK: - JSONDatum
struct JSONDatum: Codable {
    let id: Int
    let title, author: String
    let bookType: String
    let length: Int
    let image, jsonDatumDescription: String
    let access: Access
    
    enum CodingKeys: String, CodingKey {
        case id, title, author
        case bookType = "book_type"
        case length, image
        case jsonDatumDescription = "description"
        case access
    }
}

enum Access: String, Codable {
    case free = "free"
    case locked = "locked"
}

enum BookType: String, Codable {
    case audiobook = "audiobook"
}
