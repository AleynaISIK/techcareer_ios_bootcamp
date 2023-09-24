//
//  ViewController.swift
//  FilmlerApp
//
//  Created by Aleyna IŞIK on 24.09.2023.
//



import UIKit

protocol HucreProtocol{ //burayı tanımla çalışmasını istediğim yere git anasayfaya gittik
  func sepeteEkleTikla(indexPath : IndexPath)
}

class Anasayfa: UIViewController {
  
  @IBOutlet weak var filmlerCollectionView: UICollectionView!
  
  var filmlerListesi = [Filmler]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    filmlerCollectionView.delegate = self
    filmlerCollectionView.dataSource = self
    
    let tasarim = UICollectionViewFlowLayout()
    tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    tasarim.minimumLineSpacing = 10 //dikey boşluk
    tasarim.minimumInteritemSpacing = 10 //yataydaki boşluk
    
//    10 x 10 x 10 = 30
//    15 x 10 x 10 x 15 = 50 --> 3 itemlı yaparsak  --> tasarim.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15) ekran genislikten 50 yi çıkartıp 3 e böleceğiz.
    let ekranGenislik = UIScreen.main.bounds.width
    let itemGenislik = (ekranGenislik - 30) / 2
    
    tasarim.itemSize = CGSize(width: itemGenislik , height: itemGenislik*1.6)
    
    filmlerCollectionView.collectionViewLayout = tasarim

    let f1 = Filmler(id: 1, ad: "Django", resim: "django", fiyat: 24)
    let f2 = Filmler(id: 2, ad: "Interstellar", resim: "interstellar", fiyat: 32)
    let f3 = Filmler(id: 3, ad: "Inception", resim: "inception", fiyat: 16)
    let f4 = Filmler(id: 4, ad: "The Hateful Eight", resim: "thehatefuleight", fiyat: 28)
    let f5 = Filmler(id: 5, ad: "The Pianist", resim: "thepianist", fiyat: 18)
    let f6 = Filmler(id: 6, ad: "Anadoluda", resim: "anadoluda", fiyat: 10)
    filmlerListesi.append(f1)
    filmlerListesi.append(f2)
    filmlerListesi.append(f3)
    filmlerListesi.append(f4)
    filmlerListesi.append(f5)
    filmlerListesi.append(f6)
    
  }


}

extension Anasayfa : UICollectionViewDelegate, UICollectionViewDataSource ,HucreProtocol{ //buraya tanımladık
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return filmlerListesi.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilmlerCollectionViewCell", for: indexPath) as! FilmlerCollectionViewCell
    
    let film = filmlerListesi[indexPath.row]
    
    cell.imageViewFilm.image = UIImage(named: film.resim!)
    cell.labelFiyat.text = "\(film.fiyat!) ₺"
    
    cell.layer.borderColor = UIColor.lightGray.cgColor
    cell.layer.borderWidth = 0.3
    cell.layer.cornerRadius = 10
    
    cell.indexPath = indexPath
    cell.hucreProtocol = self //bunları da yazınca tamamdır 5.
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    let film = filmlerListesi[indexPath.row]
    performSegue(withIdentifier: "toDetay", sender: film)

  }
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "toDetay"{
      if let film = sender as? Filmler{
        let gidilecekVC = segue.destination as! DetaySayfa
        gidilecekVC.film = film
      }}
  }
  func sepeteEkleTikla(indexPath: IndexPath) {
    let film = filmlerListesi[indexPath.row]
    print("\(film.ad!) sepete eklendi") //sonrasında tekrar cell e git 2.
  }
}

