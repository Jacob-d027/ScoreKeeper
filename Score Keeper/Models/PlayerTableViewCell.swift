//
//  PlayerTableViewCell.swift
//  Score Keeper
//
//  Created by Jacob Davis on 11/8/23.
//

import UIKit

protocol PlayerTableViewCellDelegate: AnyObject {
    func stepperDidTap(in cell: PlayerTableViewCell, with value: Double)
}

class PlayerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var scoreCountLabel: UILabel!
    
    weak var delegate: PlayerTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func stepperWasTapped(_ sender: UIStepper) {
        delegate?.stepperDidTap(in: self, with: sender.value)
        sender.value = 0
    }
    

}
