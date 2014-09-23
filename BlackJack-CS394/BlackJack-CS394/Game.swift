import Foundation
class BlackJackGame {
    var deck: Deck
    var player: Player
    var dealer: Player
    var gameCount: Int = 0
    
    init () {
        self.player = Player()
        self.dealer = Player()
        self.deck = Deck()
    }
    
    func start () {
        gameCount++
        deck.createDeck()
        drawCard(player)
        drawCard(dealer)
        drawCard(player)
        drawCard(dealer)
        dealer.cards[0].hidden = true
    }
    
    func drawCard(who: Player){
        var randomNumberOne = Int(arc4random_uniform(UInt32(deck.cardDeck.count)))
        var cardOne = deck.cardDeck[randomNumberOne]
        deck.cardDeck.removeAtIndex(randomNumberOne)
        who.cards.append(cardOne)
    }
    
    func checkScore() -> String {
        if (player.handSum().intScore > 21) {
            dealer.unhideCard()
            dealer.showHand()
            return "Busted, House wins!"}
        if (dealer.handSum().intScore > 21) {
            return "You won!"
        }
        return ""
    }
    
    func hit (playerId:Player) {
        drawCard(playerId)
    }
    
    func stand(playerId:Player) -> String {
        playerId.stand()
        var dealerScore: Int = dealer.handSum().intScore + dealer.cards[0].rank.toRaw()
        if(dealerScore == 21) {
            if( playerId.handSum().intScore != 21 ) {
                return "Busted, House wins!"
            }
        }
        else if dealerScore < 16 {
            while(dealer.handSum().intScore < 16) {
                drawCard(dealer)
                if dealer.handSum().intScore > 21 {
                    // Exit loop
                    break
                }
            }
        }
        return checkScore()
        
    }
    func resetGame () {
        deck.cardDeck.removeAll(keepCapacity: true)
        player.cards.removeAll(keepCapacity: true)
        dealer.cards.removeAll(keepCapacity: true)
    }
}
