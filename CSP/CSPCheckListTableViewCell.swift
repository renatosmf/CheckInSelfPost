//
//  CSPCheckListTableViewCell.swift
//  CSP
//
//  Created by Renato Machado on 12/14/16.
//  Copyright © 2016 Renato Machado. All rights reserved.
//

import UIKit

class CSPCheckListTableViewCell: UITableViewCell {

    @IBOutlet weak var btCheck: UIButton!
    @IBOutlet weak var lbInvitedName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
