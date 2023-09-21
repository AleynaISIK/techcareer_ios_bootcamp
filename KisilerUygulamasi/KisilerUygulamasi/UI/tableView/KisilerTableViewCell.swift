//
//  KisilerTableViewCell.swift
//  KisilerUygulamasi
//
//  Created by Aleyna IŞIK on 21.09.2023.
//

import UIKit

class KisilerTableViewCell: UITableViewCell {
  
  @IBOutlet weak var labelKisiAd: UILabel!
  
  @IBOutlet weak var labelKisiTel: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
