//
//  AddTaskVC.swift
//  Homework7
//
//  Created by Aleyna IŞIK on 3.10.2023.
//

import UIKit

class AddTaskVC: UIViewController {
  

  @IBOutlet weak var tfTask: UITextView!
  var viewModel = AddTaskViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

   
    }
  
  @IBAction func buttonSave(_ sender: Any) {
    
    if let task = tfTask.text{
      viewModel.save(task_name: task)
      print("ekleme butonuna tıklandı")
    }
  }
}
