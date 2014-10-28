//
//  Deck.swift
//  BlackJack-v3
//
//  Created by Joel Castillo on 10/7/14.
//  Copyright (c) 2014 Joel Castillo. All rights reserved.
//

import Foundation
class Deck {
    var deck: [Card] = [];
    
    init() {
        let Ranks = [Card.Rank.Ace, Card.Rank.Two, Card.Rank.Three, Card.Rank.Four, Card.Rank.Five, Card.Rank.Six, Card.Rank.Seven, Card.Rank.Eight, Card.Rank.Nine, Card.Rank.Ten, Card.Rank.Jack, Card.Rank.Queen, Card.Rank.King]
        let Suits = [Card.Suit.Spades, Card.Suit.Hearts, Card.Suit.Diamonds, Card.Suit.Clubs]
        for suit in Suits {
            for rank in Ranks {
                deck.append(Card(rank: rank, suit: suit))
            }
        }
    }
}