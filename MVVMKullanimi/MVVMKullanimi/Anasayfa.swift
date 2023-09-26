//
//  ViewController.swift
//  MVVMKullanimi
//
//  Created by Aleyna IŞIK on 26.09.2023.
//

import UIKit
import RxSwift

class Anasayfa: UIViewController {
  
  @IBOutlet weak var labelSonuc: UILabel!
  @IBOutlet weak var tfSayi1: UITextField!
  @IBOutlet weak var tfSayi2: UITextField!
  
  var viewModel = AnasayfaViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //        Dinleme veya Gözlemleme
    _ = viewModel.sonuc.subscribe(onNext: { s in
      self.labelSonuc.text = s
      
    })
  }
  
  
  @IBAction func buttonToplama(_ sender: Any) {
    if let alinanSayi1 = tfSayi1.text, let alinanSayi2 = tfSayi2.text{
      //      if let sayi1 = Int(alinanSayi1), let sayi2 = Int(alinanSayi2){
      //        let toplam = sayi1 + sayi2
      //        labelSonuc.text = String(toplam)
      viewModel.topla(alinansayi1: alinanSayi1, alinanSayi2: alinanSayi2)
    
    }
    
  }
  
  
  @IBAction func buttonCarpma(_ sender: Any) {
    if let alinanSayi1 = tfSayi1.text, let alinanSayi2 = tfSayi2.text{
      //      if let sayi1 = Int(alinanSayi1), let sayi2 = Int(alinanSayi2){
      //        let carpma = sayi1 * sayi2
      //        labelSonuc.text = String(carpma)
      viewModel.carp(alinansayi1: alinanSayi1, alinanSayi2: alinanSayi2)
    }
    
  }
}


