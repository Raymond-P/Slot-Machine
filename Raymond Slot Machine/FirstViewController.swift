//
//  FirstViewController.swift
//  Raymond Slot Machine
//
//  Created by Raymond Perez on 10/23/17.
//  Copyright © 2017 Raymond Perez. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        history_button.isEnabled = false //History view isn't ready for release
        history_button.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var game = SlotMachineGame(3)

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
    }
    
    func updateView(){
        let game_slots = game.getDigits()
        for index in 0...2{
            slots[index].text = String(game_slots[index].getDigit())
            slots[index].textColor = game_slots[index].getColor()
        }
        score.text = String(game.getScore())
        if game.getScore() < 2{
            spin_button.isEnabled = false
        }
    }
    
    //History isn't ready for realease. button hidden and disabled.
    //button and files kept in project to show progress. 
    
    func getHistory() -> [String]  {
        return game.getHistory()
    }
    @IBAction func history(_ sender: UIButton) {
        performSegue(withIdentifier: "segue", sender: self )
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let HistoryController = segue.destination as! HistoryViewController
        HistoryController.beFilled = getHistory()
    }
    @IBOutlet weak var history_button: UIButton!
    

}

