import UIKit

class ViewController: UIViewController {
    @IBOutlet var dealerScore: UILabel!
    @IBOutlet var playerScore: UILabel!
    @IBOutlet var betAmount: UITextField!
    @IBOutlet var dealerCards: UITextView!
    @IBOutlet var playerCards: UITextView!
    var game = BlackJackGame()
    var counter:Int = 0
    
    @IBOutlet var gameOutcome: UILabel!
    func refresh () {
        dealerScore.text = String(game.dealer.handSum().strScore)
        playerScore.text = String(game.player.handSum().strScore)
        dealerCards.text = String(game.dealer.showHand())
        playerCards.text = String(game.player.showHand())
        gameOutcome.text = String(game.checkScore())
    }
    
    @IBAction func play(sender: UIButton) {
        if (counter == 5) {
            game.deck.shuffle()
        }
        else {
            counter++ }
        game.resetGame()
        game.start()
        refresh()
        
    }
    
    @IBAction func hitButton(sender: UIButton) {
        game.hit(game.player)
        game.checkScore()
        refresh()
    }
    
    
    @IBAction func standButton(sender: UIButton) {
        game.stand(game.player)
        game.dealer.unhideCard()
        gameOutcome.text = String(game.checkScore())
        
        refresh()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

