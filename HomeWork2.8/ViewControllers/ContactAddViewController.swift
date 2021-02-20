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
    
    @IBAction func saveNewContactButtonPressed() {
        addNewContact()
        dismiss(animated: true)
    }
    
    @IBAction func cancelButtonPressed() {
        dismiss(animated: true)
    }
    
}

//MARK: Extention
extension ContactAddViewController {
    private func addNewContact() {
        let dataManager = DataManager.shared
        dataManager.names.append(newContactName.text ?? "")
        dataManager.surnames.append(newContactSurname.text ?? "")
        dataManager.phones.append(newContactPhoneNumber.text ?? "")
        dataManager.emails.append(newContactEmail.text ?? "")
    }
}
