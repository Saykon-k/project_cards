//
//  ConcentrationGame.swift
//  project_card
//
//  Created by Konstantin on 29.06.2021.
//

import Foundation

class ConcentrationGame{
    var cards = [Card]()
    var indexOfOneAndOnlyFaceupCard: Int?
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched{
            if let matchingIndex = indexOfOneAndOnlyFaceupCard, matchingIndex != index{
                if cards[matchingIndex].identifier == cards[index].identifier{
                    cards[matchingIndex].isMatched = true
                    cards[index].isMatched = true
                    
                }
                cards[index].isFaseUp = true
                indexOfOneAndOnlyFaceupCard = nil
            }else{
                for flipDown in cards.indices{
                    cards[flipDown].isFaseUp = false
                }
                cards[index].isFaseUp = true
                indexOfOneAndOnlyFaceupCard = index
            }
            
        }
        
        
    }
    init(numberofParisofCards: Int){
        for _ in 1...numberofParisofCards{
            let card = Card()
//            cards.append(card)
//            cards.append(card)
            cards += [card,card]
        }
        cards.shuffle()
    }
}
