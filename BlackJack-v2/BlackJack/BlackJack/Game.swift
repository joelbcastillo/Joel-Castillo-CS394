//
//  Game.swift
//  BlackJackHomework
//
//  Created by Joel Castillo on 9/22/14.
//  Copyright (c) 2014 Joel Castillo. All rights reserved.
//

import Foundation
class Game {
    var decks: [Deck] = []
    var players: [Player] = []
    var dealer = Dealer()

    func start(numDecks: Int = 1, numPlayers:Int = 5) {
        // Reset game variables
        decks.removeAll(keepCapacity: false)
        players.removeAll(keepCapacity: false)
        dealer.cards.removeAll()

        // Create shoe
        for i in 0..<numDecks {
            var temp = Deck()
            temp.createDeck()
            decks.append(temp)
        }
        // Create players
        for i in 0..<numPlayers {
            var temp = Player()
            for x in 0..<2 {
                temp.hit(drawCard()!)
            }
            players.append(temp)
        }
        // Give dealer cards
        for i in 0..<2 {
            dealer.hit(drawCard()!)
        }
        // Set dealer hole card to hidden
        dealer.cards[0].hidden = true
    }

    func drawCard() -> Card? {
        for i in 0..<decks.count {
            if (decks[i].deck.count > players.count) {
                var randomNumberOne = Int(arc4random_uniform(UInt32(decks[i].deck.count)))
                if (decks[i].deck.count > randomNumberOne) {
                    decks[i].current = true
                    var card = decks[i].deck[randomNumberOne]
                    decks[i].deck.removeAtIndex(randomNumberOne)
                    return card
                }
                return nil
            }
            return nil
        }
        return nil
    }
    
    //individual game output for each player and if player is busted, that player
    //is removed from the players set and that player is out of the game
    func checkScore(player: Player) -> String {
        var dealerScore: Int = dealer.score().score + dealer.cards[0].rank.toRaw()
        if (player.stood == true) {
            if (player.score().score > 21) {
                dealer.showCards()
                dealer.showHand()
                return "Busted, You lost!"
            }
            else if (dealer.score().score > 21) {
                return "You won!"
            }
            else if (dealer.score().score > player.score().score) {
                return "House won!"
            }
            else {
                return "You won!"
            }
        }
        else {
            if( player.score().score > 21 ) {
                return "Busted, You lost!"
            }
            if (dealer.score().score > 21) {
                return "You won!"
            }
        }
        return ""
    }
    
    func selectPlayers(index: Int) -> Player {
        // Keep track of current player
        return players[index]
    }
    
    func hit (player: Player) {
        // Give the player a card if they decide to hit
        player.hit(drawCard()!)
    }

    func dealerLogic () {
        // When the dealer takes their turn, if their score is less than 16, they hit
        while (dealer.score().score < 16) {
            dealer.hit(drawCard()!)
        }
        // Otherwise they stand
        if (dealer.score().score > 16) {
            stand(dealer)
        }
        // Dealer can now show all of their cards
        dealer.showCards()
        dealer.showHand()
    }
    
    func stand (player: Person){
        // Call the player stand function
        player.stand()
    }
}
