//
//  AttributesTableViewCell.swift
//  Monsters
//
//  Created by mitchell hudson on 4/12/16.
//  Copyright © 2016 mitchell hudson. All rights reserved.
//

import UIKit

class AttributesTableViewCell: UITableViewCell {
    
    var attributes: Attributes? {
        didSet {
            if attributes != nil {
                displayAttributes(attributes!)
            }
        }
    }
    
    @IBOutlet var strLabel: UILabel!
    @IBOutlet var dexLabel: UILabel!
    @IBOutlet var conLabel: UILabel!
    @IBOutlet var intLabel: UILabel!
    @IBOutlet var wisLabel: UILabel!
    @IBOutlet var chaLabel: UILabel!
    
    
    func displayAttributes(attr: Attributes) {
        strLabel.text = attr.strStr
        dexLabel.text = attr.dexStr
        conLabel.text = attr.conStr
        intLabel.text = attr.intStr
        wisLabel.text = attr.wisStr
        chaLabel.text = attr.chaStr
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        if let attributes = attributes {
            displayAttributes(attributes)
        }
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
