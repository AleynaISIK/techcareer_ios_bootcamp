//
//  Task.swift
//  Homework7
//
//  Created by Aleyna IŞIK on 3.10.2023.
//

import Foundation


class Task {
  var task_id : Int?
  var task_name: String?
  var task_title: String?
  
  init() {

  }
  
  init(task_id: Int, task_name: String, task_title: String) {
    self.task_id = task_id
    self.task_name = task_name
    self.task_title = task_title
  }
}
