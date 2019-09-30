//
//  Card.swift
//  DeckofOneCard
//
//  Created by Jordan Lamb on 9/30/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

import Foundation


struct TopLevelDictionary: Codable {
    /*
     JSON
     success : true
     deck_id : "xh3nc4tsjhlp"
     remaining : 50
     cards
     */
    let success: Bool
    let deck_id: String
    let remaining: Int
    let cards: [Card]
}

struct Card: Codable {
    /*
     value : "10"
     image : "https://deckofcardsapi.com/static/img/0C.png"
     suit : "CLUBS"
     images
     code : "0C"
    */
    let value: String
    let image: String
    let suit: String
    let code: String
}
