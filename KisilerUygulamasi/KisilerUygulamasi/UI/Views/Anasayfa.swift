//
//  ViewController.swift
//  KisilerUygulamasi
//
//  Created by Aleyna IŞIK on 21.09.2023.
//

import UIKit

class Anasayfa: UIViewController {
  
  @IBOutlet weak var searchBar: UISearchBar!
  @IBOutlet weak var kisilerTableView: UITableView!
  
  var kisilerListesi = [Kisiler]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    searchBar.delegate = self //Anasayfa > UISearchBarDelegate
    kisilerTableView.delegate = self
    kisilerTableView.dataSource = self
    
    let k1 = Kisiler(kisi_id: 1, kisi_ad: "Aleyna", kisi_tel: "23456")
    let k2 = Kisiler(kisi_id: 2, kisi_ad: "Ali", kisi_tel: "1456")
    let k3 = Kisiler(kisi_id: 3, kisi_ad: "Kasım", kisi_tel: "33444")
    kisilerListesi.append(k1) //0.
    kisilerListesi.append(k2) //1.
    kisilerListesi.append(k3) //2.
    
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    print("Anasayfaya dönüldü")
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "Anasayfa_to_KisiDetay" {
      if let kisi = sender as? Kisiler{
        let gidilecekVC = segue.destination as! KisiDetay
        gidilecekVC.kisi = kisi
      }
    }
  }
}

extension Anasayfa : UISearchBarDelegate {
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) { //delegati ekle text did change yaz.
    print("Kişi Ara : \(searchText)")
  }
}

extension Anasayfa : UITableViewDelegate,UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return kisilerListesi.count //3
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // 0,1,2
    let cell = tableView.dequeueReusableCell(withIdentifier: "KisilerTableViewCell") as! KisilerTableViewCell
    
    let kisi = kisilerListesi[indexPath.row]
    
    cell.labelKisiAd.text = kisi.kisi_ad
    cell.labelKisiTel.text = kisi.kisi_tel
    
    return cell
    
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    let kisi = kisilerListesi[indexPath.row]
    print(kisi.kisi_ad!)
    performSegue(withIdentifier: "Anasayfa_to_KisiDetay", sender: kisi)
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
  func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? { //trailing yazınca çıkıyor.
    let silAction = UIContextualAction(style: .destructive, title: "Sil"){
      contextualAction,view,bool in
      let kisi = self.kisilerListesi[indexPath.row]
      
      let alert = UIAlertController(title: "Silme İşlemi", message: "\(kisi.kisi_ad!) silinsin mi?", preferredStyle: .alert)
      let iptalAction = UIAlertAction(title: "İptal", style: .cancel)
      alert.addAction(iptalAction)
      let evetAction = UIAlertAction(title: "Evet", style: .destructive){action in
        print("Kişi Sil  : \(kisi.kisi_id!)")

      }
      alert.addAction(evetAction)
      

      
      self.present(alert,animated: true)
    }
    return UISwipeActionsConfiguration(actions: [silAction])
  }
}
