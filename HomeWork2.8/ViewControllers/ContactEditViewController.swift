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
    
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        
//        contactNameTextField.text = person.name
//        contactSurnameTextFiled.text = person.surname
//        contactPhoneTextFiled.text = person.phoneNumber
//        contactEmailTextFiled.text = person.email
    }
    
    // MARK: - IBActions
    @IBAction func saveButtonPressed() {
        if contactNameTextField.text != nil || contactPhoneTextFiled.text != nil {
            showAllert(title: "Error!", message: "Phone or name not entered, try again!")
        }
        saveEditedData()
    }
    
    // MARK: - Alert Controller
    private func showAllert(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertOkButton = UIAlertAction(title: "OK",style: .default)
        alert.addAction(alertOkButton)
        present(alert, animated: true)
    }
    
    // MARK: - Work with keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == contactNameTextField{
            contactSurnameTextFiled.becomeFirstResponder()
        } else if textField == contactSurnameTextFiled{
            contactPhoneTextFiled.becomeFirstResponder()
        } else if textField == contactEmailTextFiled{
            contactEmailTextFiled.becomeFirstResponder()
        }
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
        }
    }
    
//MARK: - Extensions
extension ContactEditViewController {
    func saveEditedData() {
        person.name = contactNameTextField.text ?? ""
        person.surname = contactSurnameTextFiled.text ?? ""
        person.phoneNumber = contactPhoneTextFiled.text ?? ""
        person.email = contactEmailTextFiled.text ?? ""
    }
}
