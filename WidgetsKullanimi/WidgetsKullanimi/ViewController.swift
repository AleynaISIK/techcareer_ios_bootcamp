//
//  ViewController.swift
//  WidgetsKullanimi
//
//  Created by Aleyna IŞIK on 17.09.2023.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var labelSonuc: UILabel!
  @IBOutlet weak var textFieldGirdi: UITextField!
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var mSwitch: UISwitch!
  @IBOutlet weak var labelSwitch: UILabel!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    if mSwitch.isOn{
      labelSwitch.text = "Açık"
    }else{
      labelSwitch.text = "Kapalı"

    }
  }
  
  @IBAction func buttonOku(_ sender: Any) {
    if let alinanVeri = textFieldGirdi.text {
      labelSonuc.text = alinanVeri
    }
    labelSonuc.text = "Veri girmediniz"
  }
  
  @IBAction func buttonMutlu(_ sender: Any) {
    imageView.image = UIImage(named: "mutlu_resim")
  }
  @IBAction func buttonUzgun(_ sender: Any) {
    imageView.image = UIImage(named: "uzgun_resim")

  }
  
  
  @IBAction func mSwitchAction(_ sender: UISwitch) {
    if sender.isOn{
      labelSwitch.text = "Açık"
    }else{
      labelSwitch.text = "Kapalı"

    }
  }
  
  @IBAction func buttonGoster(_ sender: Any) {
    print("Switch durumu : \(mSwitch.isOn)")
  }
  
  
}

