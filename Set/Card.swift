//
//  Card.swift
//  Set
//
//  Created by John Palevich on 12/25/17.
//  Copyright © 2017 John Palevich. All rights reserved.
//

import Foundation

struct Card{
    var  isSelected = false
    var  shape : Int = -1
    var  color : Int = -1
    var  shading : Int = -1
    var  numberOfShapes : Int = -1
    init(shapeType shape : Int, colorType color : Int, shadingType shading : Int, numberOfShapes : Int) {
        self.shape = shape
        self.color = color
        self.shading = shading
        self.numberOfShapes = numberOfShapes
    }
}
