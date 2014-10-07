//
//  Person.swift
//  BlackJackHomework
//
//  Created by Joel Castillo on 9/30/14.
//  Copyright (c) 2014 Joel Castillo. All rights reserved.
//

import Foundation
class Person {
    var stood: Bool = false
    var cards: [Card] = []
    init () {
        
    }


    func score () -> (score: Int, stringScore: String){
        // Calculate the player's score
        var score = 0
        for card in cards {
            if (card.hidden) {
                continue
            }
            else {
                score += card.rank.values.first
            }
        }
        return (score, "\(score)")
    }
    
    func showHand() -> String{
        // Show the player's hand
        var hand = ""
        for card in cards {
            if (card.hidden) {
                hand += "Hidden Card \n"
            } else {
                hand += card.description
                hand += "\n"
            }
        }
        return hand
    }

    func hit (card: Card) {
        // Player hit function: appends card to hand
        cards.append(card)
    }
    
    func stand () {
        // Player stand function,: ends turn and calculates score
        score()
    }
}