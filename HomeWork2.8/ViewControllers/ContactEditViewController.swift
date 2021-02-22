//
//  ContactEditViewController.swift
//  HomeWork2.8
//
//  Created by Admin on 20.02.2021.
//

import UIKit

class ContactEditViewController: UIViewController {
    
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
        contactPhoneTextFiled.keyboardType = .numberPad
        updateEditTextFields()
    }
    
    // MARK: - IBActions
    @IBAction func saveButtonPressed() {
        delegate.setNewContact(person: person)
        saveEditedData()
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
        
    
    func updateEditTextFields(){
        contactNameTextField.text = DataManager.shared.names[dataManagerID]
        contactSurnameTextFiled.text = DataManager.shared.surnames[dataManagerID]
        contactPhoneTextFiled.text = DataManager.shared.phones[dataManagerID]
        contactEmailTextFiled.text = DataManager.shared.emails[dataManagerID]
    }
}

// MARK: - Work with keyboard
extension ContactEditViewController{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}
    
// MARK: - Alert Controller
extension ContactEditViewController{
    private func showAllert(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertOkButton = UIAlertAction(title: "OK",style: .default)
        alert.addAction(alertOkButton)
        present(alert, animated: true)
    }
}

