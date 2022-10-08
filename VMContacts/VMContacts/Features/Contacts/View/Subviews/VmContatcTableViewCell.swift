//
//  VmContatcTableViewCell.swift
//  VM_app
//
//  Created by Abbut John on 08/10/2022.
//

import UIKit
import NetworkLayer

class VmContatcTableViewCell: UITableViewCell {
    

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var avatarUrl: String!{
        
        didSet {
            
            self.avatarImageView.load(urlString: avatarUrl)

        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
