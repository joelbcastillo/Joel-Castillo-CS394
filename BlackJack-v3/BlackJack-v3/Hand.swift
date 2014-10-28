//
//  Hand.swift
//  BlackJack-v3
//
//  Created by Joel Castillo on 10/7/14.
//  Copyright (c) 2014 Joel Castillo. All rights reserved.
//

import Foundation
class Hand {
    var player: Person = Person()
    var bet: Double = 1
    var cards: [Card] = []
    
    init(cards: [Card], bet: Double, player: Person) {
        
    }
    func hit() {
        
    }
    
    func stand() {
        
    }
    
    func setBet(newBet: Double) {
        self.bet = newBet
    }
    func split() {
        // Split Hand
        
        // Matching cards
        var match: [Card] = []
        // Index of first card
        var i: Int = 0
        // Index of second card
        var s: Int = 0
        // For each card
        for card in cards {
            // For each card
            for second in cards{
                // If the first card is equivalent to the second, skip over this
                if card.description == second.description {
                    // Increment the second card index
                    s += 1
                    continue
                }
                else {
                    // If the cards are not the same, check to see if they are a matching pair
                    if card.suit == second.suit || card.rank == second.rank {
                        // If they match, add cards to match array
                        match.append(card)
                        match.append(second)
                        // Remove matching cards from cards array
                        cards.removeAtIndex(s)
                        cards.removeAtIndex(i)
                        break
                    }
                }
            }
            // Increment first card array
            i += 1
        }
        
        // If no match found, stop processing split
        if match.count < 2 {
            return
        }
        
        // Create card arrays for split
        var firstHand: [Card] = []
        var secondHand: [Card] = []
        firstHand.append(match.first!)
        secondHand.append(match.last!)
        
        // Populate arrays
        var array: Int = 0
        for card in cards {
            if array == 0 {
                firstHand.append(card)
                array += 1
            }
            else {
                secondHand.append(card)
                array -= 1
            }
        }
        
        // Add new hands to player
        var newBet: Double = self.bet/2
        player.addHand(hand firstHand, bet: newBet)
        player.addHand(hand: secondHand, bet: newBet)
        
    }
    
    func calculateScore() -> String {
        // Calculate the score for the hand (sum of pip values)
        var score = 0
        for card in cards {
            if card.hidden {
                continue
            }
            else {
                if let second = card.rank.values.second {
                    if score < 10 {
                        score += second
                    }
                }
                else {
                    score += card.rank.values.first
                }
            }
        }
        
        return "\(score)"
    }
}