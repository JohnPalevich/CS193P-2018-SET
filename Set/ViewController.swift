//
//  ViewController.swift
//  Set
//
//  Created by John Palevich on 12/25/17.
//  Copyright © 2017 John Palevich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var game = Set()
    var numVisible = 0
    var cardsDrawn = [Card]()
    var selectedButtons = [UIButton]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for iterator in 0..<cardButtons.count{
            cardButtons[iterator].layer.cornerRadius = 8.0
        }
        setUpBoard()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func touchCard(_ sender: UIButton) {
        let index = cardButtons.index(of: sender)
        if index! < cardsDrawn.count
        {
            if cardsDrawn[index!].isSelected
            {
                sender.layer.borderWidth = 0.0
                sender.layer.borderColor = UIColor.clear.cgColor
                cardsDrawn[index!].isSelected = false
                game.deselectCard(cardsDrawn[index!])
                selectedButtons.remove(at: selectedButtons.index(of: sender)!)
            }
            else if game.numOfSelectedCards < 3
            {
                sender.layer.borderWidth = 3.0
                sender.layer.borderColor = UIColor.blue.cgColor
                cardsDrawn[index!].isSelected = true
                selectedButtons.append(sender)
                let threeCardsSelected = game.selectCard(cardsDrawn[index!])
                if threeCardsSelected{
                    game.checkForSet()
                }
                
            }
            else{
                deselectButtons(index)
            }
        }
        
    }
    func deselectButtons(_ index : Int?){
        for iterator in 0..<selectedButtons.count{
            game.selectedCards = [Card]()
            game.numOfSelectedCards =  0
            selectedButtons[iterator].layer.borderWidth = 0.0
            selectedButtons[iterator].layer.borderColor = UIColor.clear.cgColor
            cardsDrawn[index!].isSelected = false
        }
        print(game.selectedCards)
    }
    
    @IBOutlet var cardButtons: [UIButton]!
    @IBAction func newGame(_ sender: UIButton) {
        setUpBoard()
    }
    @IBAction func addCards(_ sender: UIButton) {
        if(numVisible < 24)
        {
            drawCards()
        }
    }
    func setUpBoard(){
        for iterator in 0..<cardButtons.count{
            cardButtons[iterator].backgroundColor = UIColor.clear
            cardButtons[iterator].setAttributedTitle(NSAttributedString(string : ""), for: .normal)
            cardButtons[iterator].layer.borderWidth = 0.0
            cardButtons[iterator].layer.borderColor = UIColor.clear.cgColor
            
        }
        game = Set()
        numVisible = 0
        drawCards()
        drawCards()
        drawCards()
        drawCards()
    }
    func drawCards()
    {
        let newCards = game.deck.drawCards()
        var attributedDictionary = [NSAttributedStringKey : Any]()
        for iterator in 0..<3{
            cardButtons[numVisible+iterator].backgroundColor = UIColor.white
            var cardString : String
            var color : UIColor
            if newCards[iterator].shape == 0
            {
                cardString = "▲"
            }
            else if newCards[iterator].shape == 1
            {
                cardString = "●"
            }
            else{
                cardString = "■"
            }
            if newCards[iterator].numberOfShapes == 1
            {
                cardString = cardString + cardString
            }
            else if newCards[iterator].numberOfShapes == 2
            {
                cardString = cardString + cardString + cardString
            }
            if newCards[iterator].color == 0
            {
                attributedDictionary[NSAttributedStringKey.foregroundColor] = UIColor.red
                color = UIColor.red
            }
            else if newCards[iterator].color == 1
            {
                attributedDictionary[NSAttributedStringKey.foregroundColor] = UIColor.green
                color = UIColor.green
            }
            else
            {
                attributedDictionary[NSAttributedStringKey.foregroundColor] = UIColor.blue
                color = UIColor.blue
            }
            if newCards[iterator].shading == 0
            {
                attributedDictionary[NSAttributedStringKey.strokeColor] = attributedDictionary[NSAttributedStringKey.foregroundColor]
                attributedDictionary[NSAttributedStringKey.strokeWidth] = 5.0
            }
            else if newCards[iterator].shading == 1
            {
                attributedDictionary[NSAttributedStringKey.foregroundColor] = color.withAlphaComponent(0.15)
            }
            cardsDrawn.append(newCards[iterator])
            let attributedString = NSAttributedString(string : cardString, attributes: attributedDictionary)
            cardButtons[numVisible+iterator].setAttributedTitle(attributedString, for: .normal)
            
        }
        numVisible += 3
    }
    
}

