//
//  DetailVC.swift
//  SiparisNoktasi2
//
//  Created by Aleyna IŞIK on 18.10.2023.
//

import UIKit
import Kingfisher

class DetailVC: UIViewController {
  @IBOutlet weak var sepeteEkle: UIButton!
  @IBOutlet weak var yemek_ucreti_label_outlet: UILabel!
  @IBOutlet weak var yemek_toplam_hesap_label_outlet: UILabel!
  @IBOutlet weak var yemek_imageview_outlet: UIImageView!
  @IBOutlet weak var adetLabel: UILabel!
  @IBOutlet weak var yemek_Adi_label_outlet: UILabel!

  
  var fiyat:Int?
  var yemek:Yemekler?
  var count : Int = 1
  let kullanici_adi = "Aleyna"
  
  
  var viewModel = DetailViewModel()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    yemek_toplam_hesap_label_outlet.text = "Tutar: \(yemek?.yemek_fiyat! ?? "").00 ₺"
    yemek_ucreti_label_outlet.text! = "\(yemek?.yemek_fiyat! ?? "").00 ₺"
    
    if let yemek2 = yemek{
      yemek_Adi_label_outlet.text = yemek2.yemek_adi
      if let url = URL(string : "http://kasimadalan.pe.hu/yemekler/resimler/\(yemek2.yemek_resim_adi!)") {
        DispatchQueue.main.async {
          self.yemek_imageview_outlet.kf.setImage(with : url)
        }
      }
    }
  }

  
  func addFoodToCart(){
    if count >= 1 && count < 20{
      count += 1
    }
    adetLabel.text = "\(count)"
    if let yemek2 = yemek
    {
      let toplamYemekFiyati = Int(yemek2.yemek_fiyat!)
      yemek_toplam_hesap_label_outlet.text = "Tutar: \(toplamYemekFiyati! * count).00 ₺"
    }
  }
  
  func takeFoodOutFromCart(){
    if count > 1 && count <= 20 {
      count -= 1
    }
    adetLabel.text = "\(count)"
    if let yemek2 = yemek {
      let toplamYemekFiyati = Int(yemek2.yemek_fiyat!)
      yemek_toplam_hesap_label_outlet.text = "Tutar: \(toplamYemekFiyati! * count).00 ₺"
    }
  }
  
    @IBAction func minusButton(_ sender: Any) {
    print("azaldı")
    takeFoodOutFromCart()
  }
  @IBAction func plusButton(_ sender: Any) {
    print("arttı")
    addFoodToCart()
  }
  
    @IBAction func sepeteEkle(_ sender: Any) {
    
    if let yemek2 = yemek {
      
      viewModel.sepeteYemekEkle(yemek: yemek2, adet: count, username: kullanici_adi)
      

      
      let alert = UIAlertController(title: "Sepete Eklendi", message: "\(yemek2.yemek_adi!) sepete eklendi!", preferredStyle: .alert)
      let OKAction = UIAlertAction(title: "Tamam", style: .default)
      alert.addAction(OKAction)
      self.present(alert, animated: true)
      
   
    }

  }
}






