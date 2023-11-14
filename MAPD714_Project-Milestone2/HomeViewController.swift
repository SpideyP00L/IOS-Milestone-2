//
//  ViewController.swift
//  MAPD714_Project-Milestone2
//
// Team number - 8
// Milestone number - 3
// Team members names- Calist Dsouza - 301359253, Ahmad Abbas - 301372338 , Jeet Panchal -
// Submission Date - 30 October 2023
//

// File: MainViewController.swift
// Description: Demonstrates the passing of user data from HomeViewController to RegistrationViewController without navigation.

import UIKit

// MARK: - HomeViewController

class HomeViewController: UIViewController {
    // MARK: Properties

    var userData: [String: String]?

    // MARK: Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        // Pass user data to RegistrationViewController without navigating to it
        let registrationViewController = RegistrationViewController()
        registrationViewController.userData = userData
    }
}

// MARK: - RegistrationViewController

class RegistrationViewController: UIViewController {
    // MARK: Properties

    var userData: [String: String]?

    // MARK: Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        // Now you can use userData in RegistrationViewController
        if let userData = userData {
            // Do something with userData
            print("User Data in RegistrationViewController: \(userData)")
        }
    }
}

// MARK: - Main Execution

let navigationController = UINavigationController()
let homeViewController = HomeViewController()

// navigationController.pushViewController(homeViewController, animated: false)
