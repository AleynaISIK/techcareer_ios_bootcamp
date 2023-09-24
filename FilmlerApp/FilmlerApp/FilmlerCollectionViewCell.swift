//
//  FilmlerCollectionViewCell.swift
//  FilmlerApp
//
//  Created by Aleyna IŞIK on 24.09.2023.
//

import UIKit

class FilmlerCollectionViewCell: UICollectionViewCell {
    
  @IBOutlet weak var labelFiyat: UILabel!
  @IBOutlet weak var imageViewFilm: UIImageView!
  
  var hucreProtocol : HucreProtocol?
  var indexPath : IndexPath?
  
  @IBAction func buttonSepeteEkle(_ sender: Any) {
    hucreProtocol?.sepeteEkleTikla(indexPath: indexPath!) //yazdıktN sonra anasayfaya gidiyoruz 4.
  }
}
