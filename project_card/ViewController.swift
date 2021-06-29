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
    @IBOutlet var buttonCollection: [UIButton]!
    
    @IBOutlet weak var touch: UILabel!
    let emojicollection = ["🥰", "🍗", "🤌", "🤷‍♂️"]
    var touchs = 0{
        didSet{
            if touchs == 10{
                touch.text = "машина \(touchs)"
            }else{
                touch.text = "count \(touchs)"
            }
            
        }
    }
    func flipButton (emoji: String, button: UIButton){
        if button.currentTitle == emoji{
            button.setTitle("", for: .normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        } else{
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
   
    
    @IBAction func buttonAction(_ sender: UIButton) {
        touchs += 1
        //опасная распаковка, так как может не оказаться индекса
//        let buttonIndex = buttonCollection.firstIndex(of: sender)!
        //лучше делать так
        if let buttonIndex = buttonCollection.firstIndex(of: sender){
            flipButton(emoji: emojicollection[buttonIndex], button: sender)
        }else{
            sender.setTitle("Потеряли кнопку(", for: .normal)
        }
    }
}

