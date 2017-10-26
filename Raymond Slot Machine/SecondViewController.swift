//
//  SecondViewController.swift
//  Raymond Slot Machine
//
//  Created by Raymond Perez on 10/23/17.
//  Copyright © 2017 Raymond Perez. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var game = SlotMachineGame(5)
    
    @IBOutlet var slots: [UILabel]!
    
    @IBOutlet weak var score: UILabel!
    
    @IBOutlet weak var spin_button: UIButton!
    
    @IBAction func spin_button(_ sender: UIButton) {
        game.spinDigits()
        updateView()
    }
    
    
    @IBAction func reset_button(_ sender: UIButton) {
        game.resetGame()
        updateView()
        spin_button.isEnabled = true
    }
    
    func updateView(){
        let game_slots = game.getDigits()
        for index in 0..<slots.count{
            slots[index].text = String(game_slots[index].getDigit())
            slots[index].textColor = game_slots[index].getColor()
        }
        score.text = String(game.getScore())
        if game.getScore() < 2{
            spin_button.isEnabled = false
        }
    }


}

