//
//  PlayersViewController.swift
//  Ratings
//
//  Created by Zachary Shakked on 2/27/15.
//  Copyright (c) 2015 Shkeek Inc. All rights reserved.
//

import UIKit

class PlayersViewController: UITableViewController {
    
    var players: [Player] = playersData
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    @IBAction func cancelToPlayersViewController(segue:UIStoryboardSegue) {
        
    }
    
    @IBAction func savePlayerDetail(segue:UIStoryboardSegue) {
        let playerDetailsViewController = segue.sourceViewController as PlayerDetailsTableViewController
        
        //add the new player to the players array
        players.append(playerDetailsViewController.player)
        
        //update the tableView
        let indexPath = NSIndexPath(forRow: players.count-1, inSection: 0)
        tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        
        //hide the detail view controller
        dismissViewControllerAnimated(true, completion: nil)

    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PlayerCell", forIndexPath: indexPath) as UITableViewCell
        
        let player = players[indexPath.row] as Player
        
        
        if let gameLabel = cell.viewWithTag(101) as? UILabel {
            gameLabel.text = player.game
        }
        
        if let ratingImageView = cell.viewWithTag(102) as? UIImageView {
            ratingImageView.image = self.imageForRating(player.rating)
        }
        
        return cell
    }
    
    func imageForRating(rating:Int) -> UIImage? {
        switch rating {
        case 1:
            return UIImage(named: "1StarSmall")
        case 2:
            return UIImage(named: "2StarsSmall")
        case 3:
            return UIImage(named: "3StarsSmall")
        case 4:
            return UIImage(named: "4StarsSmall")
        case 5:
            return UIImage(named: "5StarsSmall")
        default:
            return nil
        }
        
    }
}
