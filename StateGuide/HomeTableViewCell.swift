//
//  HomeTableViewCell.swift
//  StateGuide
//
//  Created by APPLE on 25/02/24.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var stateName: UILabel!
    @IBOutlet weak var capitalName: UILabel!
    @IBOutlet weak var emblemImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
