//
//  SepetVC.swift
//  SiparisNoktasiUygulamasi
//
//  Created by Aleyna IŞIK on 10.10.2023.
//

import UIKit
import RxSwift
import Kingfisher

class SepetVC: UIViewController {
  
  var viewModel       = SepetViewModel()
  var yemekDetay      = [YemekDetay]()
  
  @IBOutlet weak var tableView  : UITableView!
  @IBOutlet weak var ucretLabel : UILabel!
  @IBOutlet weak var bosView: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.delegate        = self
    tableView.dataSource      = self
    tableView.backgroundColor = .none
    
    _ = viewModel.yemekDetayListe.subscribe(onNext: { liste in
      self.yemekDetay = liste.sorted(by: { $0.yemek_adi! < $1.yemek_adi! })
      self.badge()
      self.tableView.reloadData()
    })
    
    tableView.reloadData()
    ucretLabelRadius()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    sepetiGuncelle()
    NotificationCenter.default.addObserver(self, selector: #selector(itemSilindi(notification:)), name: Notification.Name("itemSilindi"), object: nil)
  }
  
  func sepetiGuncelle(){
    viewModel.sepetGuncelle(kullanici_adi: "Aleyna")
    badge()
  }
  
  func badge(){
    viewModel.badge(yemekDetay: yemekDetay, tabBarItem: tabBarItem)
    toplamUcret()
  }
  
  func ucretLabelRadius(){
    ucretLabel.layer.cornerRadius = 8
    ucretLabel.clipsToBounds = true
  }
    
  func toplamUcret(){
    ucretLabel.text = " \(viewModel.toplamUcret(yemekDetay: yemekDetay)),00 ₺"
  }
  
  @objc func itemSilindi(notification: Notification){
    sepetiGuncelle()
  }
  deinit{
    NotificationCenter.default.removeObserver(self)
  }
    
  @IBAction func OnayPopup(_ sender: Any) {
    let alertController = UIAlertController(title: "Siparişiniz Alındı",message: "Siparişiniz hazırlanıyor",preferredStyle: .alert)
    alertController.addAction(UIAlertAction(title: "Kapat", style: .default, handler: nil))
    present(alertController, animated: true, completion: nil)
  }
}

extension SepetVC: UITableViewDelegate, UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    if yemekDetay.count == 0{
        bosView.isHidden = false
    }else{
        bosView.isHidden = true
    }
    
    return yemekDetay.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell  = tableView.dequeueReusableCell(withIdentifier: "SepetTableViewCell", for: indexPath) as! SepetTableViewCell
    if indexPath.isEmpty{
      bosView.isHidden = false
    }else{
      bosView.isHidden = true
    }
    let yemek = yemekDetay[indexPath.row]
    cell.yemekAdilabel.text  = yemek.yemek_adi
    if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(yemek.yemek_resim_adi!)")
    {
      DispatchQueue.main.async {
        cell.yemekImageview.kf.setImage(with : url)
      }
    }
    cell.ucretLabel.text = " \(yemek.yemek_fiyat!),00 ₺"
    cell.adetLabel.text  = " \(yemek.yemek_siparis_adet!) Adet"
    cell.silButtonOutlet.tag = indexPath.row
    cell.silButtonOutlet.addTarget(self, action: #selector(itemSil), for: .touchUpInside)
    cell.yemek = yemek
    cell.selectionStyle = .none
    return cell
  }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      let food = yemekDetay[indexPath.row]
      yemekDetay.remove(at: indexPath.row)
      tableView.deleteRows(at: [indexPath], with: .fade)
      viewModel.sepettenSil(sepet_yemek_id: Int(food.sepet_yemek_id!)!, kullanici_adi: "Aleyna")
      badge()
    }
  }
  
  @objc func itemSil(sender: UIButton) {
    let indexP = IndexPath(row: sender.tag, section: 0)
    let yemek = yemekDetay[indexP.row]
    if let intID = Int(yemek.sepet_yemek_id!) {
      viewModel.sepettenSil(sepet_yemek_id: intID, kullanici_adi: "Aleyna")
      yemekDetay.remove(at: indexP.row)
      tableView.deleteRows(at: [indexP], with: .fade)
      NotificationCenter.default.post(name: Notification.Name("itemSilindi"), object: nil)
    }
  }
}
