//
//  ContactAddViewController.swift
//  HomeWork2.8
//
//  Created by Admin on 20.02.2021.
//

import UIKit

class ContactAddViewController: UIViewController {
    
    @IBOutlet var newContactName: UITextField!
    @IBOutlet var newContactSurname: UITextField!
    @IBOutlet var newContactPhoneNumber: UITextField!
    @IBOutlet var newContactEmail: UITextField!
    
    @IBOutlet var saveNewContact: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func saveNewContactButtonPressed() {
        addNewContact()
    }
    
}


extension ContactAddViewController {
    private func addNewContact() -> Person {
        let newContact = Person(
            name: newContactName.text ?? "",
            surname: newContactSurname.text ?? "",
            email: newContactSurname.text ?? "",
            phoneNumber: newContactPhoneNumber.text ?? ""
        )
        return newContact
    }
}
