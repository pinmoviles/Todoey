//
//  ViewController.swift
//  Todoey
//
//  Created by CEX  on 6/22/19.
//  Copyright © 2019 PIN. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let newItem = Item()
        newItem.title = "Finde Mike"
        itemArray.append(newItem)

        let newItem2 = Item()
        newItem2.title = "Finde Mike 2"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Finde Mike"
        itemArray.append(newItem3)
        
        itemArray.append(newItem3)
        itemArray.append(newItem3)
        itemArray.append(newItem3)
        itemArray.append(newItem3)
        itemArray.append(newItem3)
        itemArray.append(newItem3)
        itemArray.append(newItem3)
        itemArray.append(newItem3)
        itemArray.append(newItem3)
        itemArray.append(newItem3)
        itemArray.append(newItem3)
        itemArray.append(newItem3)
        itemArray.append(newItem3)
        itemArray.append(newItem3)
        itemArray.append(newItem3)
        itemArray.append(newItem3)
        itemArray.append(newItem3)
        
        if let items = defaults.array(forKey: "TodoListArray") as? [Item] {
            itemArray = items
        }
    }

    //MARK - TableView Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("CellForRowAtIndexPath Call")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row].title
        cell.accessoryType = (itemArray[indexPath.row].done) ? .checkmark : .none
        return cell
    }
    
    //MARK - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
print("didSelectRowAt")
        itemArray[indexPath.row].done = !(itemArray[indexPath.row].done)
        
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }

    
    //MARK - ADD NEW ITEM
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            let newItem = Item()
            newItem.title = textField.text!
            self.itemArray.append(newItem)
            
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
}

