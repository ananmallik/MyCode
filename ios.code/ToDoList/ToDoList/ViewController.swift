//
//  ViewController.swift
//  ToDoList
//
//  Created by A. Mallik on 11/07/2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self,
                       forCellReuseIdentifier: "cell")
        
        return table
    }()
    
    private var models = [ToDoListItem]()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = "CoreData To Do List"
        view.addSubview(tableView)
        
        getAllItems()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds

        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(didTapAdd))
    }
    
    @objc private func didTapAdd() {
        
        let alert = UIAlertController(title: "New Item",
                                      message: "Enter new Item",
                                      preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Submit", style: .cancel, handler: { [weak self] _ in
            guard let field = alert.textFields?.first, let text = field.text, !text.isEmpty else {
                return
            }
            
            self?.createItem(name: text)
            
        }))
        
        present(alert, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = model.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = models[indexPath.row]
        
        let sheet = UIAlertController(title: "Edit",
                                      message: nil,
                                      preferredStyle: .actionSheet)
        sheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        sheet.addAction(UIAlertAction(title: "Edit", style: .default, handler: { _ in
            
            let alert = UIAlertController(title: "Edit Item",
                                          message: "Edit yourItem",
                                          preferredStyle: .alert)
            alert.textFields?.first?.text = item.name
            alert.addTextField(configurationHandler: nil)
            
            alert.addAction(UIAlertAction(title: "Submit", style: .cancel, handler: { [weak self] _ in
                guard let field = alert.textFields?.first, let newName = field.text, !newName.isEmpty else {
                    return
                }
                
                self?.updateItem(item: item, newName: newName)
                
            }))
            
            self.present(sheet, animated: true)
            
        }))
        
        sheet.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { _ in
            self.deleteItem(item: item)
        }))
            
       present(sheet, animated: true)
        
    }
    
    
    // Core Data
    func getAllItems() {
        
        do {
            models = try context.fetch(ToDoListItem.fetchRequest())

            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        catch {
            // error
        }
        
    }
    
    func createItem(name: String) {
        
        let newItem = ToDoListItem(context: context)
        newItem.name = name
        newItem.createdAt = Date()
        
        do {
            try context.save()
            getAllItems()
        }
        catch {
            // error
        }
        
    }

    func deleteItem(item: ToDoListItem) {
        
        context.delete(item)
        
        do {
            try context.save()
            getAllItems()
        }
        catch {
            // error
        }
        
    }
    
    func updateItem(item: ToDoListItem, newName: String) {
        
        item.name = newName
        
        do {
            try context.save()
            getAllItems()
        }
        catch {
            // error
        }
    }
}

