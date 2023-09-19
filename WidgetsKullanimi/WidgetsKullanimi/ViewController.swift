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
  
  @IBOutlet weak var segmentedControl: UISegmentedControl!
  @IBOutlet weak var labelSegmented: UILabel!
  
  
  @IBOutlet weak var slider: UISlider!
  @IBOutlet weak var labelSlider: UILabel!
  
  
  @IBOutlet weak var stepper: UIStepper!
  @IBOutlet weak var labelStepper: UILabel!
  
  @IBOutlet weak var indicator: UIActivityIndicatorView!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    if mSwitch.isOn{
      labelSwitch.text = "Açık"
    }else{
      labelSwitch.text = "Kapalı"

    }
    
    let secilenIndeks = segmentedControl.selectedSegmentIndex
    let secilenKategori = segmentedControl.titleForSegment(at: secilenIndeks)
    labelSegmented.text = "Seçim: \(secilenKategori!)"
    
    labelSlider.text = String(Int(slider.value))
        
    labelStepper.text = String(Int(stepper.value))
    
    indicator.isHidden = true

  }
  
  @IBAction func buttonOku(_ sender: Any) {
    if let alinanVeri = textFieldGirdi.text {
      labelSonuc.text = alinanVeri
    }
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
  @IBAction func segmentedDegisimAction(_ sender: UISegmentedControl) {
    let secilenIndeks = sender.selectedSegmentIndex
    let secilenKategori = sender.titleForSegment(at: secilenIndeks)
    labelSegmented.text = "Seçim: \(secilenKategori!)"

  

  }
  
  @IBAction func sliderDegisimAction(_ sender: UISlider) {
    labelSlider.text = String(Int(sender.value))
    
    
  }
  
  @IBAction func stepperDegisimAction(_ sender: UIStepper) {
    
    labelStepper.text = String(Int(sender.value))
    
  }
  
  @IBAction func buttonBasla(_ sender: Any) {
    indicator.isHidden = false
    indicator.startAnimating()
  }
  
  @IBAction func buttonDur(_ sender: Any) {
    indicator.isHidden = true
    indicator.stopAnimating()
  }
  
  
  @IBAction func buttonGoster(_ sender: Any) {
    print("Switch durumu : \(mSwitch.isOn)")
    let secilenIndeks = segmentedControl.selectedSegmentIndex
    let secilenKategori = segmentedControl.titleForSegment(at: secilenIndeks)
    print("Seçilen : \(secilenKategori!)")
    print("Slider  :  \(slider.value)")
    print("Stepper  :  \(stepper.value)")

  }
  
  
}

