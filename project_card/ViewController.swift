//
//  ViewController.swift
//  project_card
//
//  Created by Konstantin on 28.06.2021.
//

import UIKit

class ViewController: UIViewController {

//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//    }
    var emojicollection = ["🍌","🍉","🍇","🍓","🫐", "🍈","🍒","🥭","🍍","👽","🤬","🌚","♂️"]
    @IBOutlet var buttonCollection: [UIButton]!
    
    lazy var game = ConcentrationGame(numberofParisofCards: (emojicollection.count+1)/2)

    @IBOutlet weak var touch: UILabel!
    
    var emojiDict = [Int:String]()
    
    
    
    var touchs = 0{
        didSet{
            if touchs == 20{
                touch.text = "Вы проиграли"
                
            }else{
                touch.text = "count \(touchs)"
            }
            
        }
    }
//    func flipButton (emoji: String, button: UIButton){
//        if button.currentTitle == emoji{
//            button.setTitle("", for: .normal)
//            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//        } else{
//            button.setTitle(emoji, for: .normal)
//            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//        }
//    }
    func emojiIndentifier(for card: Card) -> String{
        if emojiDict[card.identifier] == nil{
            //двойная конвертация ???
            let randomIndex  = Int(arc4random_uniform(UInt32(emojicollection.count)))
            print("124")
            print(randomIndex)
            print(emojicollection.count)
            print(emojicollection)
            print(card.identifier)
            print("12456")
            emojiDict[card.identifier] = emojicollection.remove(at: randomIndex)
        }
        print(emojiDict)
        //тоже самое, что и внизу
//        if  emojiDict[card.identifier] != nil {
//            return emojiDict[card.identifier]!
//        }else{
//            return "?"
//        }
        return emojiDict[card.identifier] ?? "?"
       
    }
   
    func  updateViewFromModel(){
        for index in buttonCollection.indices{
            let button = buttonCollection[index]
            let card = game.cards[index]
            if card.isFaseUp{
                button.setTitle(emojiIndentifier(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }else{
                button.setTitle("", for:  .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
                
            }
        }
    }
    
    
    @IBAction func buttonAction(_ sender: UIButton) {
        touchs += 1
        //опасная распаковка, так как может не оказаться индекса
//        let buttonIndex = buttonCollection.firstIndex(of: sender)!
        //лучше делать так
        if let buttonIndex = buttonCollection.firstIndex(of: sender){
            print(buttonIndex)
            print(emojicollection)
            game.chooseCard(at: buttonIndex)
            updateViewFromModel()
    }
}
}
