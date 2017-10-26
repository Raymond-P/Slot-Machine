//
//  SlotMachineGame.swift
//  Raymond Slot Machine
//
//  Created by Raymond Perez on 10/23/17.
//  Copyright © 2017 Raymond Perez. All rights reserved.
//

import Foundation

class SlotMachineGame{
    
    
    private var slots: [Digit] = []
    
    private var history: [String] = []
    
    private var score = 100
    
    
    init(_ numberOfDigits: Int){
        
        for _ in 0..<numberOfDigits{
            slots.append(Digit())
        }
        
    }
    
    func resetGame(){
        score = 100
        let amount_of_digits = slots.count  
        slots = []
        for _ in 0..<amount_of_digits{
            slots.append(Digit())
        }
        history.removeAll()
    }
    
    func getScore() -> Int{
        return score
    }
    
    func getDigits() -> [Digit]{
        return slots
    }
    
    func spinDigits(){
        if score > 1 {
            score = score - 2
            for current_digit in slots{
                current_digit.spinDigit()
            }
            score = score + eval_spin_score()
        }
        update_history()
    }
    
    private func eval_spin_score() -> Int{
        var earned_points = 0
        
        if same_colors && same_numbers {
            earned_points = 100 * slots.count
        }
        else if same_numbers{
            earned_points = 50 * slots.count
        }
        else if same_colors{
            earned_points = 25 * slots.count
        }
        
        return earned_points
    }
    
    private var same_colors: Bool {
        get{
            let color = slots[0].getColor()
            for current_digit in slots{
                if !current_digit.getColor().isEqual(color){
                    return false
                }
            }
            return true
        }
        
    }
    
    private var same_numbers: Bool {
        get{
            let number = slots[0].getDigit()
            for current_digit in slots{
                if current_digit.getDigit() != (number){
                    return false
                }
            }
            return true
        }
        
    }
    
    private func update_history(){
        var history_string:String = "";
        for digit in slots{
            history_string.append(String(digit.getDigit()))
        }
        history.append(history_string)
    }
    
    func getHistory() -> [String]{
        return history
    }
    
}
