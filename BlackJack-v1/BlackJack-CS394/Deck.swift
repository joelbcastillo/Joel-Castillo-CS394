import Foundation
class Deck {
    var cardDeck: [Card] = [];
    func createDeck() {
        let ranks = [Rank.Ace, Rank.Two, Rank.Three, Rank.Four, Rank.Five, Rank.Six, Rank.Seven, Rank.Eight, Rank.Nine, Rank.Ten, Rank.Jack, Rank.Queen, Rank.King]
        let suits = [Suit.Spades, Suit.Hearts, Suit.Diamonds, Suit.Clubs]
        for suit in suits {
            for rank in ranks {
                cardDeck.append(Card(rank: rank, suit: suit))
            }
        }
    }
    
    func size() -> Int {
        return cardDeck.count
    }
    
    func shuffle() {
        
        var deckSize = size()
        
        for i in 0..<deckSize {
            // Randomly choose a location for card
            var randomNumber = Int(arc4random_uniform(UInt32(deckSize-i)))
            
            var temp = cardDeck[i]
            cardDeck[i] = cardDeck[randomNumber]
            cardDeck[randomNumber] = temp
        }
    }
}

