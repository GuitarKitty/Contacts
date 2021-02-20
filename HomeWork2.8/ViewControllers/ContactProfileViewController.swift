//
//  ContactProfileViewController.swift
//  HomeWork2.8
//
//  Created by Admin on 20.02.2021.
//

import UIKit

class ContactProfileViewController: UIViewController {
    
//    Аутлеты для лейблов для отображения информации:
//    email
//    phoneNumber
    
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = person?.fullName
//        emailLabel.text = "Email: \(person.email)"
//        phoneNumberLabel.text = "Phone: \(person.phoneNumber)"
    }
    
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editVC = segue.destination as! ContactEditViewController
        editVC.person = person
    }
}
