//
//  PlayerTableViewCell.swift
//  Score Keeper
//
//  Created by Jacob Davis on 11/8/23.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var scoreCountLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func stepperWasTapped(_ sender: UIStepper) {
        if let scoreAsDouble = Double(scoreCountLabel.text ?? "0") {
            
        }
        print(sender.value)
        
    }
    

}
