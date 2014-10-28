//
//  ViewController.swift
//  BlackJack-v3
//
//  Created by Joel Castillo on 10/7/14.
//  Copyright (c) 2014 Joel Castillo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Variables for Game
    var numDecks: Int! // Number of decks in the shoe
    var game: Game! // Actual game
    var playCount = 0 // Number of rounds played
    var numPlayers: Int! // Total number of players

    // Card Information

    // Player Cards (Dealer)
    @IBOutlet weak var dealerCardOne: UIImageView!
    @IBOutlet weak var dealerCardOneCover: UIImageView(image: UIImage(named: "back"))
    @IBOutlet weak var dealerCardTwo: UIImageView!
    @IBOutlet weak var dealerHitOne: UiImageView!
    @IBOutlet weak var dealerHitTwo: UIImageView!
    @IBOutlet weak var dealerHitThree: UIImageView!


    // Player Cards (User)
    @IBOutlet weak var playerCardOne: UIImageView!
    @IBOutlet weak var playerCardTwo: UIImageView!
    @IBOutlet weak var playerHitOne: UIImageView!
    @IBOutlet weak var playerHitTwo: UIImageView!
    @IBOutlet weak var playerHitThree: UIImageView!

    // Player Cards (AI)
    @IBOutlet weak var aiCardOne: UIImageView!
    @IBOutlet weak var aiCardTwo: UiImageView!
    @IBOutlet weak var aiHitOne: UIImageView!
    @IBOutlet weak var aiHitTwo: UIImageView!
    @IBOutlet weak var aiHitThree: UIImageView!

    // Score Information
    @IBOutlet weak var playerScore: UILabel!
    @IBOutlet weak var dealerScore: UILabel!
    @IBOutlet weak var aiScore: UILabel!

    // Cash Information
    @IBOutlet weak var playerCash: UILabel!
    @IBOutlet weak var aiCash: UILabel!

    // Player Labels
    @IBOutlet weak var playerLabel: UILabel!
    @IBOutlet weak var aiLabel: UILabel!
    @IBOutlet weak var dealerLabel: UILabel!

    // Buttons
    @IBOutlet weak var restartGame: UIButton!
    @IBOutlet weak var hitBtn: UIButton!
    @IBOutlet weak var standBtn: UIButton!

    // Messages
    @IBOutlet weak var gameMessage: UILabel!

    // BlackJackTable
    @IBOutlet var board: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        newGame.addPlayers(numPlayers)
        newGame.addDecks(numDecks)
        startGame()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func startGame() {
        // Initial Dealer Hand
        game.dealerDraw()
        self.dealerCardOne.image = UIImage(named: game.dealer.getCardName())
        game.dealerDraw()
        self.dealerCardTwo.image = UIImage(named: game.dealer.getCardName())

        // Initial Player and AI Hand
        for(var ndx = 0; ndx < game.players.count; ++ndx) {
            if ndx == 0 {
                game.playerDraw(ndx)
                self.playerCard1.image = UIImage(named: game.players[ndx].getCardName())
                game.playerDraw(ndx)
                self.playerCard2.image = UIImage(named: game.players[ndx].getCardName())
            } else if ndx == 1 {
                game.playerDraw(ndx)
                self.aiCard1.image = UIImage(named: game.players[ndx].getCardName())
                game.playerDraw(ndx)
                self.aiCard2.image = UIImage(named: game.players[ndx].getCardName())
        }
        updateScore()
    }

    func updateScore() {
        for (var ndx = 0; ndx < game.players.count; ++ndx) {
            if ndx == 0 {
                self.playerScore.text = String(game.players[ndx].score)
                self.playerCash.text = "$\(game.players[ndx].cash)"
            }
            if ndx == 0 {
                self.aiScore.text = String(game.players[ndx].score)
                self.aiCash.text = "$\(game.players[ndx].cash)"
                self.aiScore.hidden = false
                self.aiCash.hidden = true
            }
    }
}

