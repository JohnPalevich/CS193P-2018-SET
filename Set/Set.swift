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
    func checkForSet()
    {
        
    }
    mutating func deselectCard(_ deselectedCard : Card){
        numOfSelectedCards-=1
        if selectedCards.index(of: deselectedCard) != nil
        {
            selectedCards.remove(at: selectedCards.index(of: deselectedCard)!)
        }
        
    }
}

