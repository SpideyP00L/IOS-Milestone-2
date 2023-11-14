//
//  RegisterNewUserViewController.swift
//  MAPD714_Project-Milestone2
//
// Team number - 8
// Milestone number - 3
// Team members names- Calist Dsouza - 301359253, Ahmad Abbas - 301372338 , Jeet Panchal -
// Submission Date -
// Description: Displays accepted data from previous screens, including cruise details and payment information.

import UIKit

class RegisterNewUserViewController: UIViewController {

    @IBOutlet weak var EnterUserEmail: UITextField!
    @IBOutlet weak var EnterUserName: UITextField!
    @IBOutlet weak var EnterUserAddress: UITextField!
    @IBOutlet weak var EnterUserCity: UITextField!
    @IBOutlet weak var EnterUserCountry: UITextField!
    @IBOutlet weak var EnterUserPhno: UITextField!
    @IBOutlet weak var RegisterButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func registerButtonTapped(_ sender: UIButton) {
        var errorMessages = [String]()

        // Validate user input
        if EnterUserEmail.text?.isEmpty ?? true {
            errorMessages.append("Email Address is Empty")
        }

        if EnterUserName.text?.isEmpty ?? true {
            errorMessages.append("Name is Empty")
        } else {
            // Validate if name contains only letters
            let nameCharacterSet = CharacterSet.letters
            if let userName = EnterUserName.text, userName.rangeOfCharacter(from: nameCharacterSet.inverted) != nil {
                errorMessages.append("Numbers and Special characters are not accepted in Name")
            }
        }

        if EnterUserAddress.text?.isEmpty ?? true {
            errorMessages.append("Address not Provided")
        }

        if EnterUserCity.text?.isEmpty ?? true {
            errorMessages.append("City is not provided")
        }

        if EnterUserCountry.text?.isEmpty ?? true {
            errorMessages.append("Country is not Provided")
        }

        if EnterUserPhno.text?.isEmpty ?? true {
            errorMessages.append("Phone number is empty")
        } else {
            // Validate if phone number contains only numbers
            let phoneNumberCharacterSet = CharacterSet.decimalDigits
            if let userPhoneNumber = EnterUserPhno.text, userPhoneNumber.rangeOfCharacter(from: phoneNumberCharacterSet.inverted) != nil {
                errorMessages.append("Phone number should only contain numbers")
            }
        }

        // Check if there are any error messages
        if !errorMessages.isEmpty {
            // Display all error messages in a single alert
            let alert = UIAlertController(title: "Error", message: errorMessages.joined(separator: "\n"), preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            return
        }

        // All data is provided and valid
        // Perform the segue to HomeViewController
        performSegue(withIdentifier: "segueToHome", sender: self)
    }

    // This method is called before the segue is performed
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToHome" {
            // Pass the user data to HomeViewController
            let destinationVC = segue.destination as! HomeViewController
            destinationVC.userData = [
                "email": EnterUserEmail.text!,
                "name": EnterUserName.text!,
                "address": EnterUserAddress.text!,
                "city": EnterUserCity.text!,
                "country": EnterUserCountry.text!,
                "phone": EnterUserPhno.text!
            ]
        }
    }
}
