//
//  Set.swift
//  Set
//
//  Created by John Palevich on 12/25/17.
//  Copyright © 2017 John Palevich. All rights reserved.
//

import Foundation

struct Set{
    var deck = Deck()
    var numOfSelectedCards = 0;
    var selectedCards = [Card]()
    var points = 0
    init(){
      
    }
    mutating func selectCard(_ selectedCard: Card) -> Bool{
        numOfSelectedCards+=1
        selectedCards.append(selectedCard)
        if(numOfSelectedCards == 3)
        {
            return true
        }
        return false
    }
    mutating func checkForSet()
    {
        let colorDiff = (selectedCards[0].color != selectedCards[1].color) && (selectedCards[1].color != selectedCards[2].color)
        let shapeDiff = (selectedCards[0].shape != selectedCards[1].shape) && (selectedCards[1].shape != selectedCards[2].shape)
        let numDiff = (selectedCards[0].numberOfShapes != selectedCards[1].numberOfShapes) && (selectedCards[1].numberOfShapes != selectedCards[2].numberOfShapes)
        let shadeDiff = (selectedCards[0].shading != selectedCards[1].shading) && (selectedCards[1].shading != selectedCards[2].shading)
        if(colorDiff && shadeDiff && numDiff && shapeDiff)
        {
            points += 3
        }
    }
    mutating func deselectCard(_ deselectedCard : Card){
        numOfSelectedCards-=1
        if selectedCards.index(of: deselectedCard) != nil
        {
            selectedCards.remove(at: selectedCards.index(of: deselectedCard)!)
        }
        
    }
}

