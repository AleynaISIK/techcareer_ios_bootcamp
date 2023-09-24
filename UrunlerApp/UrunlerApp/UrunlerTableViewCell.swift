//
//  UrunlerTableViewCell.swift
//  UrunlerApp
//
//  Created by Aleyna IŞIK on 24.09.2023.
//

import UIKit

protocol HucreProtokol{
  func sepeteEkleTiklandi(indexPath : IndexPath)
  
}

class UrunlerTableViewCell: UITableViewCell {
  

  @IBOutlet weak var arkaplan: UIView!
  @IBOutlet weak var imageViewUrun: UIImageView!
  @IBOutlet weak var labelUrunAd: UILabel!
  @IBOutlet weak var labelFıyat: UILabel!
  
  var hucreProtokol : HucreProtokol?
  var indexPath: IndexPath?
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  @IBAction func buttonSepeteEkle(_ sender: Any) {
    hucreProtokol?.sepeteEkleTiklandi(indexPath: indexPath!)
  }
  
}
