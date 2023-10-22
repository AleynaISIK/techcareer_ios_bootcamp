//
//  ViewController.swift
//  SiparisNoktasi
//
//  Created by Aleyna IŞIK on 17.10.2023.
//

import UIKit
import Kingfisher

class HomePage: UIViewController {
  
  var kategoriListesi = [Kategoriler]()
  var yemekler = [Yemekler]()
  var viewModel = HomePageViewModel()

  
  @IBOutlet weak var searchBar: UISearchBar!{
    didSet{
      searchBar.delegate = self
    }
  }
  
  @IBOutlet weak var kategoriler_collection_view: UICollectionView!{
    didSet{
      kategoriler_collection_view.delegate = self
      kategoriler_collection_view.dataSource = self
      kategoriler_collection_view.backgroundColor = .none
    }
  }
  
  @IBOutlet weak var icerik_collectionView: UICollectionView!{
    didSet{
      icerik_collectionView.delegate = self
      icerik_collectionView.dataSource = self
    }
  }

  
  
  
  @IBOutlet weak var header_view_outlet: UIView!{
    didSet{
      //      let bottomLine = CALayer()
      //      bottomLine.frame = CGRect(x: 0, y: header_view_outlet.frame.size.height - 1, width: header_view_outlet.frame.size.width, height: 2)
      //      bottomLine.backgroundColor = UIColor.init(named: "181C2D")?.cgColor
      //      header_view_outlet.layer.addSublayer(bottomLine)
    }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    viewModel.yemekleriYukle()
    
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    
    _ = viewModel.yemekListesi.subscribe(onNext: { liste in
      self.yemekler = liste
      DispatchQueue.main.async {
        self.icerik_collectionView.reloadData()
      }
    })
    
    _ = viewModel.yemekListesi.subscribe(onNext: { liste in
        self.yemekler = liste
        self.icerik_collectionView.reloadData()
    })
    
    let f1 = Kategoriler(id: 1, ad: "Tümü", resim: "tumu")
    let f2 = Kategoriler(id: 1, ad: "Yemekler", resim: "yemek")
    let f3 = Kategoriler(id: 1, ad: "Tatlılar", resim: "tatli")
    let f4 = Kategoriler(id: 1, ad: "İçecekler", resim: "icecek")
    
    kategoriListesi.append(f1)
    kategoriListesi.append(f2)
    kategoriListesi.append(f3)
    kategoriListesi.append(f4)
    
    
  }
}

extension HomePage : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    if collectionView == kategoriler_collection_view{
      return CGSize(width: 160 , height: 80)
    }else if collectionView == icerik_collectionView{
      return  CGSize(width: 160 , height: 380)
    } 
    return  CGSize(width: 380 , height: 380)

  }
  
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if collectionView == kategoriler_collection_view{
      return kategoriListesi.count
    }else{
      return yemekler.count
    }

  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if collectionView == kategoriler_collection_view{
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "KategorilerCollectionViewCell", for: indexPath) as! KategorilerCollectionViewCell
      
      let kategori = kategoriListesi[indexPath.row]
      cell.kategori_imageView.image = UIImage(named: kategori.resim!)
      cell.kategori_label_outlet.text = "\(kategori.ad!) "
      
      return cell
    }else if collectionView == icerik_collectionView{
        let cell = icerik_collectionView.dequeueReusableCell(withReuseIdentifier: "IcerikCollectionViewCell", for: indexPath) as! IcerikCollectionViewCell
        
        let yemekler = yemekler[indexPath.row]
        cell.yemek_adi.text = "\(yemekler.yemek_adi!) "
        cell.yemek_fiyat.text = "\(yemekler.yemek_fiyat!).00 ₺"
        
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(yemekler.yemek_resim_adi!)")
        {
          DispatchQueue.main.async {
            cell.yemek_image_view.kf.setImage(with : url)
          }
        }
        return cell
      
    }else{
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IcerikCollectionViewCell", for: indexPath) as! IcerikCollectionViewCell
      
      return cell
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    let kategori = kategoriListesi[indexPath.row]
    //    performSegue(withIdentifier: "toDetay", sender: film)
    
  }
  //  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
  //    if segue.identifier == "toDetay"{
  //      if let film = sender as? Filmler{
  //        let gidilecekVC = segue.destination as! DetaySayfa
  //        gidilecekVC.film = film
  //      }}
  //  }
  
  func sepeteEkleTikla(indexPath: IndexPath) {
    let kategori = kategoriListesi[indexPath.row]
    print("\(kategori.ad!) sepete eklendi") //sonrasında tekrar cell e git 2.
  }
}


extension HomePage : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            viewModel.yemekleriYukle()
        }else{
            viewModel.ara(aramaKelimesi: searchText)
        }
    }
}
