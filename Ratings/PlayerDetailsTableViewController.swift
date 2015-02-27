//
//  PlayerDetailsTableViewController.swift
//  Ratings
//
//  Created by Zachary Shakked on 2/27/15.
//  Copyright (c) 2015 Shkeek Inc. All rights reserved.
//

import UIKit

class PlayerDetailsTableViewController: UITableViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var detailLabel: UILabel!
    
    var player:Player!
    var game:String = "Chess"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailLabel.text = game
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 {
            nameTextField.becomeFirstResponder()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SavePlayerDetail" {
            player = Player(name: self.nameTextField.text, game: game, rating: 1)
        }
        
        if segue.identifier == "PickGame" {
            let gamePickerViewController = segue.destinationViewController as GamePickerTableViewController
            gamePickerViewController.selectedGame = game
        }
    }
    
    @IBAction func selectedGame(segue:UIStoryboardSegue) {
        let gamePickerViewController = segue.sourceViewController as GamePickerTableViewController
        if let selectedGame = gamePickerViewController.selectedGame {
            detailLabel.text = selectedGame
            game = selectedGame
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        println("init PlayerDetailsViewController")
        super.init(coder: aDecoder)
    }
    
    deinit {
        println("deinit PlayerDetailsViewController")
    }
}
