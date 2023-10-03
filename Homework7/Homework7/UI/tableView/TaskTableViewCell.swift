//
//  TaskTableViewCell.swift
//  Homework7
//
//  Created by Aleyna IŞIK on 3.10.2023.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
  
  @IBOutlet weak var backgroundViewOutlet: UIView!
  @IBOutlet weak var labelTaskName: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
