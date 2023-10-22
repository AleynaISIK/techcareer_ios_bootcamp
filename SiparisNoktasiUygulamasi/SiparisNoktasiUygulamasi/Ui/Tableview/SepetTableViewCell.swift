//
//  SepetTableViewCell.swift
//  SiparisNoktasiUygulamasi
//
//  Created by Aleyna IŞIK on 10.10.2023.
//

import UIKit

class SepetTableViewCell: UITableViewCell {
  
  var yemek = YemekDetay()
  var viewModel = SepetViewModel()

  @IBOutlet weak var yemekImageview: UIImageView!
  @IBOutlet weak var yemekAdilabel: UILabel!
  @IBOutlet weak var adetLabel: UILabel!
  @IBOutlet weak var ucretLabel: UILabel!
  @IBOutlet weak var silButtonOutlet: UIButton!
  @IBAction func silButtonAction(_ sender: Any) {
      
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

   

