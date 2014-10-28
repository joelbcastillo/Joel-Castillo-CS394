//
//  ViewController.swift
//  BlackJackHomework
//
//  Created by Joel Castillo on 9/21/14.
//  Copyright (c) 2014 Joel Castillo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var dealer_score: UILabel!
    @IBOutlet var player_score: UILabel!
    @IBOutlet var bet_amount: UITextField!
    
    @IBOutlet var player_cards: UILabel!
    @IBOutlet var dealer_cards: UILabel!
    @IBOutlet var play: UIButton!
    @IBOutlet var max_bet: UITextView!
    @IBOutlet var outcome: UILabel!
    
    @IBOutlet var stand: UIButton!
    @IBOutlet var hit: UIButton!
    @IBOutlet var next: UIButton!
    @IBOutlet weak var player_label: UILabel!
    var game = Game()
    
    var index: Int = 0
    var counter:Int = 0
    var balance:Int = 100
    var current_player:Player = Player ()
    func refresh () {
        if counter == 5 {
            for deck in game.decks {
                deck.shuffle()
            }
        }
        if (index < game.players.count ){
            current_player = game.selectPlayers(index)
        }
        else {
            game.dealerLogic()
            index = 0
            current_player = game.players.first!
        }
        if (current_player.pressedStand) {
            buttonIsHidden(true, standBtn: true, nextBtn: false)
        }
        player_label.text = String("Player \(index + 1) Score")
        dealer_score.text = String(game.dealer.score().stringScore)
        player_score.text = String(current_player.score().stringScore)
        dealer_cards.text = String(game.dealer.showHand())
        player_cards.text = String(current_player.showHand())
        outcome.text = String(game.checkScore(current_player))
    }
    
    func buttonIsHidden (hitBtn: Bool, standBtn:Bool, nextBtn: Bool ) {
        hit.hidden = hitBtn
        stand.hidden = standBtn
        next.hidden = nextBtn
    }
    
    @IBAction func nextButton(sender: UIButton) {
        buttonIsHidden(false, standBtn: false, nextBtn: true)
        refresh()
    }
    @IBAction func play(sender: UIButton) {
        
        game.start(numDecks: 3, numPlayers: 3)
        index = 0
        buttonIsHidden(false, standBtn: false, nextBtn: true)
        current_player = game.players.first!
        refresh()
        var temp:Int = balance - bet_amount.text.toInt()!
        balance = temp
        max_bet.text = String("$\(temp)")
        if(balance - bet_amount.text.toInt()! < 0) {
            max_bet.text = String("00")
            outcome.text = String("You have no money left, sorry!")
            game.start(numDecks: 3, numPlayers: 3)
            play.enabled = false
            play.hidden = true
        }
    }
    
    
    @IBAction func hitButton(sender: UIButton) {
        game.hit(current_player)
        outcome.text = String(game.checkScore(current_player))
        if (outcome.text != "") {
            buttonIsHidden(true, standBtn: true, nextBtn: false) }
        refresh()
    }
    
    
    @IBAction func standButton(sender: UIButton) {
        current_player.pressedStand = true
        game.stand(current_player)
        index+=1
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

