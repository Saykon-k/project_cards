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
    private var emojicollection = ["🍌","🍉","🍇","🍓","🫐", "🍈","🍒","🥭","🍍","👽","🤬","🌚","♂️"]
    @IBOutlet var buttonCollection: [UIButton]!
    
    private lazy var game = ConcentrationGame(numberofParisofCards: numberofParisofCards)
    
    var numberofParisofCards: Int{
        return(emojicollection.count+1)/2
    }
    

    @IBOutlet weak var touch: UILabel!
    
    private var emojiDict = [Int:String]()
    
    
    
    var touchs = 0
    {
        didSet
        {
            if touchs < 30
            {
                touch.text = "count \(touchs)"
            }
        }
    }
    
    private func emojiIndentifier(for card: Card) -> String{
        if emojiDict[card.identifier] == nil{
            //двойная конвертация ???
            let randomIndex  = Int(arc4random_uniform(UInt32(emojicollection.count)))

            emojiDict[card.identifier] = emojicollection.remove(at: randomIndex)
        }
//        print(emojiDict)
        //тоже самое, что и внизу
//        if  emojiDict[card.identifier] != nil {
//            return emojiDict[card.identifier]!
//        }else{
//            return "?"
//        }
        return emojiDict[card.identifier] ?? "?"
       
    }
   
    private func  updateViewFromModel(){
        for index in buttonCollection.indices{
            let button = buttonCollection[index]
            let card = game.cards[index]
            if card.isFaseUp{
                button.setTitle(emojiIndentifier(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }else{
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
                button.setTitle(card.isMatched ? emojiIndentifier(for: card): "???", for:  .normal)

                
            }
        }
    }
    func restart(){
        emojicollection = ["🍌","🍉","🍇","🍓","🫐", "🍈","🍒","🥭","🍍","👽","🤬","🌚","♂️"]
        game = ConcentrationGame(numberofParisofCards: (emojicollection.count+1)/2)
        touchs = 0
        
        for i in 0...(Int(buttonCollection.count)-1){
            buttonCollection[i].setTitle("???", for: .normal)
            buttonCollection[i].backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            buttonCollection[i].isEnabled = true
            
        }
        
    }
    func check_all_cards_for_win(){
        var test_win_games = true
        for i in 0...(Int(buttonCollection.count)-1){
            if !game.cards[i].isMatched{
                test_win_games = false
                break
            }
            
        }
        if test_win_games{
            touch.text = "Вы выйграли"
            flip_all_cards()
        }
    }
    func flip_all_cards(){
        for i in 0...(Int(buttonCollection.count)-1){
            buttonCollection[i].setTitle(emojiIndentifier(for: game.cards[i]), for: .normal)
           
            print(i)
            if !game.cards[i].isMatched{
                buttonCollection[i].backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }
            buttonCollection[i].isEnabled = false
        }
    }
    @IBAction func buttonAction(_ sender: UIButton) {
        touchs += 1
        //опасная распаковка, так как может не оказаться индекса
//        let buttonIndex = buttonCollection.firstIndex(of: sender)!
        //лучше делать так
        if let buttonIndex = buttonCollection.firstIndex(of: sender){
            if touchs > 30{
                touch.text = "Вы проиграли"
                flip_all_cards()
            }else{
                game.chooseCard(at: buttonIndex)
                updateViewFromModel()
                check_all_cards_for_win()
                
            }
         
        }else{
            restart()
        }
}
}
