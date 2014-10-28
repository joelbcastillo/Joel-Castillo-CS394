//
//  Player.swift
//  BlackJackHomework
//
//  Created by Joel Castillo on 9/22/14.
//  Copyright (c) 2014 Joel Castillo. All rights reserved.
//

import Foundation
class Player: Person {
    var balance: Double = 100;
    var bet: Double = 1

    override init () {
        super.init()
    }
    // setter and getter for bets
    var betAmount: Double {
        get {
            return self.bet
        }
        set(newValue) {
            self.bet = newValue
        }
    }
    
    var maxAmount: Double {
        get {
            return self.balance
        }
        set(newValue) {
            self.balance -= newValue
        }
    }
    
    
}
