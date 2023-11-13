//
//  ViewController.swift
//  Score Keeper
//
//  Created by Jacob Davis on 11/7/23.
//

import UIKit

class ViewController: UIViewController {

    var player: Player?
    @IBOutlet weak var playerNameTextField: UITextField!
    @IBOutlet weak var playerScoreTextField: UITextField!
    
    init?(coder: NSCoder, player: Player?) {
        super.init(coder: coder)
        self.player = player
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func savePlayerButtonPressed(_ sender: UIButton) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.destination is PlayersTableViewController else { return }
        guard playerNameTextField.text != nil && playerScoreTextField.text != nil else { return }
        player = Player(score: Int(playerScoreTextField.text!) ?? 0, name: playerNameTextField.text!)
    }
}

