//
//  ViewController.swift
//  iTahDoodle
//
//  Created by Jason Hilimire on 3/31/17.
//  Copyright © 2017 Peanut Apps. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!

    
    let todoList = ToDoList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.itemTextField.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = todoList
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addButtonPressed(_ sender: UIButton) {
        if itemTextField.text == "" {
        } else {
        
        guard let todo = itemTextField.text else {
            return
        }
        todoList.add(todo)
        tableView.reloadData()
        itemTextField.text = ""
        }
    }
    

    // dismisses keyboard when you tap outside the textbox
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    
    // dismisses keyboard when you press return on the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // shut down keyboard associated with textfield being edited
        
        textField.resignFirstResponder()
        
        return true
    }
}

