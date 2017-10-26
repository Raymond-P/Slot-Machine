//
//  Digit.swift
//  Raymond Slot Machine
//
//  Created by Daniel Beltre on 10/23/17.
//  Copyright © 2017 Raymond Perez. All rights reserved.
//

import Foundation
import UIKit

class Digit{
    
    private var color : UIColor = UIColor.black  // initial color game hasn't started
    private var digit : UInt32 = UInt32(0)       // initial digit game hasn't started
    
    private var color_list : [UIColor] = [UIColor.red,UIColor.green,UIColor.blue,UIColor.purple]
    
    func getDigit() -> UInt32{
        return digit
    }
    
    func getColor() -> UIColor{
        return color
    }
    
    func pickDigit() -> UInt32{
        return arc4random_uniform(UInt32(10))
    }
    
    func pickColor() -> UIColor{
        let index = Int(arc4random_uniform(UInt32(4)))
        return color_list[index]
    }
    
    func spinDigit(){
        color = pickColor()
        digit = pickDigit()
    }
}
