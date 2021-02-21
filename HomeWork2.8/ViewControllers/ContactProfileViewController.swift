//
//  ContactProfileViewController.swift
//  HomeWork2.8
//
//  Created by Admin on 20.02.2021.
//

import UIKit

//MARK: - Protocols
protocol EditViewControllerDelegate {
    func setNewContact(person: Person)
}

class ContactProfileViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    // MARK: - Public property
    var person: Person!
    var dataManagerID: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fullNameLabel.text = person.fullName
        phoneNumberLabel.text = person.phoneNumber
        emailLabel.text = person.email
    }
    
    // MARK: - Navigation
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let editVC = segue.destination as! ContactEditViewController
            editVC.person = person
            editVC.dataManagerID = dataManagerID
            editVC.delegate = self
        }
    }

//MARK: - Delegate init
extension ContactProfileViewController: EditViewControllerDelegate {
    func setNewContact(person: Person) {
        fullNameLabel.text = person.fullName
        phoneNumberLabel.text = person.phoneNumber
        emailLabel.text = person.email
    }
}
