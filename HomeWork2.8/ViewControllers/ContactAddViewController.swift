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
        newContactName.delegate = self
        newContactSurname.delegate = self
        newContactPhoneNumber.delegate = self
        newContactEmail.delegate = self
    }
    
    @IBAction func saveNewContactButtonPressed() {
        addNewContact()
    }
    
    @IBAction func cancelButtonPressed() {
        dismiss(animated: true)
    }
}

//MARK: - Extentions
extension ContactAddViewController {
    private func addNewContact() {
        if newContactName.text == "" {
            showAllert(title: "Error", message: "Name is a required!")
            return
        }
        
        if newContactPhoneNumber.text == "" {
            showAllert(title: "Error", message: "Phone number is a required!")
            return
        }
        
        let dataManager = DataManager.shared
        
        dataManager.names.append(newContactName.text ?? "")
        dataManager.surnames.append(newContactSurname.text ?? "")
        dataManager.phones.append(newContactPhoneNumber.text ?? "")
        dataManager.emails.append(newContactEmail.text ?? "")
        
        dismiss(animated: true)
    }
}

//MARK: - Keyboard
extension ContactAddViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case newContactName:
            newContactSurname.becomeFirstResponder()
        case newContactSurname:
            newContactPhoneNumber.becomeFirstResponder()
        default:
            newContactName.becomeFirstResponder()
        }
        return true
    }
}

// MARK: - Alert Controller
extension ContactAddViewController {
    private func showAllert(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertOkButton = UIAlertAction(title: "OK",style: .default)
        alert.addAction(alertOkButton)
        present(alert, animated: true)
    }
}
