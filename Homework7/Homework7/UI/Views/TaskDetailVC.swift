//
//  TaskDetailVC.swift
//  Homework7
//
//  Created by Aleyna IŞIK on 3.10.2023.
//

import UIKit

class TaskDetailVC: UIViewController {

  var viewModel = TaskDetailViewModel()
  @IBOutlet weak var tfTaskTitle: UITextField!
  var task: Task?
  
  @IBOutlet weak var tfTask: UITextView!

  
    override func viewDidLoad() {
        super.viewDidLoad()

      if let t = task {
        tfTask.text = t.task_name
        tfTaskTitle.text = t.task_title
      }
        // Do any additional setup after loading the view.
    }
  
  @IBAction func buttonUpdate(_ sender: Any) {
    
    if let name = tfTask.text , let title = tfTaskTitle.text , let t = task{
      viewModel.update(task_id: t.task_id!, task_name: name , task_title: title)
      
      print(name)
    }
  }
    
}
