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

//MARK: Extention
extension ContactAddViewController {
    private func addNewContact() {
        DataManager.shared.names.append(newContactName.text ?? "")
        DataManager.shared.names.append(newContactSurname.text ?? "")
        DataManager.shared.names.append(newContactPhoneNumber.text ?? "")
        DataManager.shared.names.append(newContactEmail.text ?? "")
    }
}
