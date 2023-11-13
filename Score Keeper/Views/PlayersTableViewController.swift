//
//  PlayersTableViewController.swift
//  Score Keeper
//
//  Created by Jacob Davis on 11/8/23.
//

import UIKit

class PlayersTableViewController: UITableViewController, PlayerTableViewCellDelegate {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    
    func stepperDidTap(in cell: PlayerTableViewCell, with value: Double) {
        guard let playerName = cell.playerNameLabel.text, let playerIndex = listOfPlayers.firstIndex(where: { $0.name == playerName}) else {
            return
        }
        // Find player in table view and update score
        var playerToUpdate = listOfPlayers[playerIndex]
        playerToUpdate.score += Int(value)
        
        // Actually updating the player in the list
        listOfPlayers[playerIndex] = playerToUpdate
        
        // Update the cell's labels and TableView accordingly
        cell.scoreCountLabel.text = String(playerToUpdate.score)
        
        // Reload the corresponding cell in the table view
        if let indexPath = tableView.indexPath(for: cell) {
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        
        // Sort the player list by highest score and update tableview
        listOfPlayers.sort(by: >)
        tableView.reloadData()
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listOfPlayers.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath) as! PlayerTableViewCell

        // Configure the cell...
        let playerAtRow = listOfPlayers[indexPath.row]
        cell.delegate = self
        cell.playerNameLabel.text = playerAtRow.name
        cell.scoreCountLabel.text = String(playerAtRow.score)
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    
    // MARK: - Navigation

    @IBSegueAction func addNewPlayer(_ coder: NSCoder, sender: Any?) -> ViewController? {
        return ViewController(coder: coder, player: nil)
    }
    
    @IBAction func unwindToPlayerTableViewController(segue: UIStoryboardSegue) {
        guard segue.identifier == "savePlayer", 
        let sourceVC = segue.source as? ViewController,
        let player = sourceVC.player  else { return }
        
        listOfPlayers.append(player)

        listOfPlayers.sort(by: >)
        tableView.reloadData()
//        tableView.reloadRows(at: [], with: .automatic)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedRow = tableView.indexPathForSelectedRow else { return }
        let selectedPlayer = listOfPlayers[selectedRow.row]
        
        tableView.deselectRow(at: selectedRow, animated: true)
    }
    
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}



