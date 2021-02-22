//
//  ContactEditViewController.swift
//  HomeWork2.8
//
//  Created by Admin on 20.02.2021.
//

import UIKit

class ContactEditViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - IBOutlets
    @IBOutlet var contactNameTextField: UITextField!
    @IBOutlet var contactSurnameTextFiled: UITextField!
    @IBOutlet var contactPhoneTextFiled: UITextField!
    @IBOutlet var contactEmailTextFiled: UITextField!
    
    //MARK: - Public property
    var delegate: EditViewControllerDelegate!
    var person: Person!
    var dataManagerID: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldDelegate()
        keyboardProperty()
        updateEditTextFields()
    }
    
    // MARK: - IBActions
    @IBAction func saveButtonPressed() {
        saveEditedData()
        delegate.setNewContact(person: person)
    }
    
    @IBAction func cancelButtonPressed() {
        dismiss(animated: true)
    }
}

//MARK: - Extensions
extension ContactEditViewController {
    func saveEditedData() {
        if contactNameTextField.text == "" || contactPhoneTextFiled.text == "" {
            showAllert(title: "Error!", message: "Phone or name not entered, try again!")
            return
        } else {
            DataManager.shared.names[dataManagerID] = contactNameTextField.text ?? ""
            DataManager.shared.surnames[dataManagerID] = contactSurnameTextFiled.text ?? ""
            DataManager.shared.phones[dataManagerID] = contactPhoneTextFiled.text ?? ""
            DataManager.shared.emails[dataManagerID] = contactEmailTextFiled.text ?? ""
            
            person.name = contactNameTextField.text ?? ""
            person.surname = contactSurnameTextFiled.text ?? ""
            person.phoneNumber = contactPhoneTextFiled.text ?? ""
            person.email = contactEmailTextFiled.text ?? ""
            
            dismiss(animated: true)
        }
    }
}

//MARK: - Work with textFileds
extension ContactEditViewController {
    func updateEditTextFields() {
        contactNameTextField.text = DataManager.shared.names[dataManagerID]
        contactSurnameTextFiled.text = DataManager.shared.surnames[dataManagerID]
        contactPhoneTextFiled.text = DataManager.shared.phones[dataManagerID]
        contactEmailTextFiled.text = DataManager.shared.emails[dataManagerID]
    }
    
    func textFieldDelegate() {
        contactNameTextField.delegate = self
        contactSurnameTextFiled.delegate = self
        contactPhoneTextFiled.delegate = self
        contactEmailTextFiled.delegate = self
    }
}

// MARK: - Work with keyboard
extension ContactEditViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case contactNameTextField:
            contactSurnameTextFiled.becomeFirstResponder()
        case contactSurnameTextFiled:
            contactPhoneTextFiled.becomeFirstResponder()
        case contactEmailTextFiled:
            contactNameTextField.becomeFirstResponder()
        default:
            contactNameTextField.becomeFirstResponder()
        }
        return true
    }
    
    func keyboardProperty() {
        contactNameTextField.returnKeyType = .default
        contactSurnameTextFiled.returnKeyType = .default
        contactEmailTextFiled.returnKeyType = .default
        contactPhoneTextFiled.keyboardType = .phonePad
    }
}

// MARK: - Alert Controller
extension ContactEditViewController {
    private func showAllert(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertOkButton = UIAlertAction(title: "OK",style: .default)
        alert.addAction(alertOkButton)
        present(alert, animated: true)
    }
}

