//
//  Shoe.swift
//  BlackJack-v3
//
//  Created by Joel Castillo on 10/7/14.
//  Copyright (c) 2014 Joel Castillo. All rights reserved.
//

import Foundation
class Shoe {
    var decks: [Deck] = []
    
    init(numberOfDecks: Int = 3) {
        for i in 0..<numberOfDecks {
            decks.append(Deck())
        }
    }
}