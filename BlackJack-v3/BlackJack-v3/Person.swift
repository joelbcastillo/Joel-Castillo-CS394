//
//  Person.swift
//  BlackJack-v3
//
//  Created by Joel Castillo on 10/7/14.
//  Copyright (c) 2014 Joel Castillo. All rights reserved.
//

import Foundation
class Person {
    var hands: [Hand] = []
    
    var cash: Int = 100
    
    func addHand(hand: [Card], bet: Double!) {
        var newHand: Hand = Hand(cards: hand, bet: bet, player: self)
    }
}