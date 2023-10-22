//
//  SepetTableViewCell.swift
//  SiparisNoktasi2
//
//  Created by Aleyna IŞIK on 19.10.2023.
//

import UIKit

class SepetTableViewCell: UITableViewCell {
  
  @IBOutlet weak var urunImageView: UIImageView!
  @IBOutlet weak var urunAdLabel: UILabel!
  @IBOutlet weak var urunAdetLabel: UILabel!
  @IBOutlet weak var toplamLabel: UILabel!
  @IBOutlet weak var toplamTutarLabel: UILabel!

  
  override func awakeFromNib()
  {
    super.awakeFromNib()
    
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)

      toplamLabel.text = "Tutar:"
  }
  
}
