//
//  Deck.swift
//  Set
//
//  Created by John Palevich on 12/25/17.
//  Copyright © 2017 John Palevich. All rights reserved.
//

import Foundation

struct Deck {
    var cardDeck = [Card]()
    
    init()
    {
        for shapeType in 0..<3
        {
            for colorType in 0..<3
            {
                for shadingType in 0..<3
                {
                    for numberOfShapes in 0..<3
                    {
                        cardDeck.append(Card(shapeType: shapeType, colorType: colorType, shadingType: shadingType, numberOfShapes: numberOfShapes))
                    }
                }
            }
        }
        shuffle()
    }
    mutating func shuffle(){
        for i in 0..<cardDeck.count-1{
            let swapIndex = i+Int(arc4random_uniform(UInt32(cardDeck.count-i)))
            let temp = cardDeck[i]
            cardDeck[i] = cardDeck[swapIndex]
            cardDeck[swapIndex] = temp
        }
    }
    mutating func drawCards() -> [Card] {
        var returnedCardDeck = [Card]()
        for iterator in 0..<3
        {
            returnedCardDeck.append(cardDeck.removeFirst())
        }
        return returnedCardDeck
    }
}
