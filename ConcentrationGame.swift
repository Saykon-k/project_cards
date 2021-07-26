//
//  ConcentrationGame.swift
//  project_card
//
//  Created by Konstantin on 29.06.2021.
//

import Foundation

class ConcentrationGame{
    private(set) var cards = [Card]()
    private var indexOfOneAndOnlyFaceupCard: Int?{
        get{
            var found_index: Int?
            
            for idex in cards.indices{
                if cards[idex].isFaseUp{
                    if found_index == nil{
                        found_index = idex
                    }
                    else{
                        return nil
                    }
                }
            }
            return found_index
        }
        set{
            for idex in cards.indices{
                cards[idex].isFaseUp = (idex == newValue)
        }
    }
    }
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched{
            if let matchingIndex = indexOfOneAndOnlyFaceupCard, matchingIndex != index{
                if cards[matchingIndex].identifier == cards[index].identifier{
                    cards[matchingIndex].isMatched = true
                    cards[index].isMatched = true
                    
                }
                cards[index].isFaseUp = true
                
            }else{
                indexOfOneAndOnlyFaceupCard = index
            }
            
        }
        
        
    }
    init(numberofParisofCards: Int){
        for _ in 1...numberofParisofCards{
            assert(numberofParisofCards>0, "Concentration game must have at least one peir card ")
            let card = Card()
//            cards.append(card)
//            cards.append(card)
            cards += [card,card]
        }
//        for i in cards{
//            print(i)
//            print("_____________")
//        }
        cards.shuffle()
//        var cards_dict: Dictionary = [Int:Int]()
//        for i in cards{
//            print()
//            if cards_dict[i.identifier] != nil{
//                cards_dict[i.identifier]! += 1
//            }else{
//                cards_dict[i.identifier] = 1
//            }
//            print(i)
//            print("++++++++++")
//        }
//        print(cards_dict)
    }
}
