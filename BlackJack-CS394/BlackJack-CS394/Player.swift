import Foundation

class Player {
    // Variables
    var cards: [Card] = [];
    var cash: Double = 100;
    var bet: Double = 1
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
            return self.cash
        } set(newValue) {
            self.cash -= newValue
        }
    }
    func handSum () -> (intScore: Int, strScore:String){
        var sum = 0
        for card in cards {
            if (card.hidden) {
                continue
            }
            if let second = card.rank.values.second {
                if sum < 10 {
                    sum += card.rank.values.second!
                }
            }
            else {sum += card.rank.values.first}
            
        }
        return (sum, "\(sum)")
    }
    
    func unhideCard() {
        // Unhide Dealer Hole Card
        cards[0].hidden = false
    }
    
    func showHand() -> String {
        // Show Player Hand
        var output = ""
        
        for card in cards {
            
            if (card.hidden) {
                // If dealer hole card, don't display
                output += "Hidden Card \n"
            } else {
                output += card.description
                output += "\n"
            }
        }
        return output
    }
    func hit (card:Card) {
        cards.append(card)
    }
    
    func stand () {
        handSum()
    }
    
    
    
}
