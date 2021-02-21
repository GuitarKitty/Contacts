//
//  ContactProfileViewController.swift
//  HomeWork2.8
//
//  Created by Admin on 20.02.2021.
//

import UIKit

class ContactProfileViewController: UIViewController {
    
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fullNameLabel.text = "\(person.fullName)"
        phoneNumberLabel.text = "\(person.email)"
        emailLabel.text = "\(person.email)"
    }
    
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editVC = segue.destination as! ContactEditViewController
        editVC.person = person
    }
}
