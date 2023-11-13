//
//  PlayerTableViewCell.swift
//  Score Keeper
//
//  Created by Jacob Davis on 11/8/23.
//

import UIKit

protocol PlayerTableViewCellDelegate: AnyObject {
    func stepperDidTap(in cell: PlayerTableViewCell, with value: Double, playerId: UUID)
}

class PlayerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var scoreCountLabel: UILabel!
    
    var player: Player!
    weak var delegate: PlayerTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with player: Player) {
        self.player = player
        playerNameLabel.text = player.name
        scoreCountLabel.text = String(player.score)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func stepperWasTapped(_ sender: UIStepper) {
        delegate?.stepperDidTap(in: self, with: sender.value, playerId: player.id)
        sender.value = 0
    }
    
}
