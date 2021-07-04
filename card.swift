//
//  card.swift
//  project_card
//
//  Created by Konstantin on 29.06.2021.
//

import Foundation

struct Card {
    var isFaseUp = false
    var isMatched = false
    var identifier: Int
    
    static var indentifierNumber = 0
    static func indentifierGenerator() -> Int {
        indentifierNumber += 1
        return indentifierNumber
    }
    
    init(){
        self.identifier = Card.indentifierGenerator()
        
    }
}
