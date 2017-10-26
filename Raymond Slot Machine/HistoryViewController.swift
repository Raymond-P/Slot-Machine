//
//  HistoryViewController.swift
//  Raymond Slot Machine
//
//  Created by Daniel Beltre on 10/24/17.
//  Copyright © 2017 Raymond Perez. All rights reserved.
//

import Foundation
import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var beFilled = [String]()
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return beFilled.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = beFilled[indexPath.row]
        
        return cell
    }
    
}
