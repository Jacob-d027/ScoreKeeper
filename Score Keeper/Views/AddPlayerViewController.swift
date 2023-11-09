//
//  ViewController.swift
//  Score Keeper
//
//  Created by Jacob Davis on 11/7/23.
//

import UIKit

class ViewController: UIViewController {

    var player: Player?
    
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


}

