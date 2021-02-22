//
//  ContactListViewController.swift
//  HomeWork2.8
//
//  Created by Admin on 20.02.2021.
//

import UIKit

class ContactListViewController: UITableViewController {
    
    var persons: [Person] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        persons = Person.getContactList()
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persons.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contact", for: indexPath)
        let person = persons[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = person.fullName
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            persons.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            DataManager.shared.names.remove(at: indexPath.row)
            DataManager.shared.surnames.remove(at: indexPath.row)
            DataManager.shared.phones.remove(at: indexPath.row)
            DataManager.shared.emails.remove(at: indexPath.row)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            let detailVC = segue.destination as! ContactProfileViewController
            detailVC.person = persons[indexPath.row]
            detailVC.dataManagerID = indexPath.row
        }
    }
    
}
