// CaribbeanViewController.swift
// MAPD714_Project-Milestone2
//
// Team number - 8
// Milestone number - 3
// Team members names- Calist Dsouza - 301359253, Ahmad Abbas - 301372338 , Jeet Panchal -
// Submission Date - 30 October 2023
// File: CaribbeanViewController.swift
// Description: Manages the UI and data display for the Caribbean cruise details. Allows users to navigate to the GuestViewController.

import UIKit

// MARK: - CaribbeanViewController

class CaribbeanViewController: UIViewController {
    
    // MARK: Properties
    
    var cruise: Cruise?
    
    // MARK: Outlets
    
    @IBOutlet weak var CruiseName: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var numberOfNightsLabel: UILabel!
    @IBOutlet weak var goToGuest: UIButton!
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        displayCruiseDetails()
    }

    // MARK: UI Setup
    
    func setupUI() {
        view.backgroundColor = .white
        // Add any additional UI setup here
    }

    // MARK: Data Display
    
    func displayCruiseDetails() {
        if let cruise = cruise {
            // Update labels with cruise details
            CruiseName.text = "Caribbean Cruise"
            placeLabel.text = "Destinations in the Caribbean can vary, but popular ports include Jamaica, the Dominican Republic, the Bahamas, and the Virgin Islands."
            priceLabel.text = "Price: $\(cruise.price)"
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            let startDateString = formatter.string(from: cruise.startDate)
            startDateLabel.text = "Start Date: \(startDateString)"
            numberOfNightsLabel.text = "Duration: \(cruise.numberOfNights) nights"
        }
    }

    // MARK: Segue to Guest View Controller
    
    @IBAction func goToGuest(_ sender: Any) {
        performSegue(withIdentifier: "GuestSegueIdentifier", sender: self)
    }

    // This method is called just before the segue is performed.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GuestSegueIdentifier" {
            // Pass cruise details to the next view controller if needed
            if let guestViewController = segue.destination as? GuestViewController {
                guestViewController.name = CruiseName.text
                guestViewController.place = placeLabel.text
                guestViewController.price = priceLabel.text
                guestViewController.startDate = startDateLabel.text
                guestViewController.numberOfNights = numberOfNightsLabel.text
            }
        }
    }
}
