// StarViewController.swift
// MAPD714_Project-Milestone2
//
// Team number - 8
// Milestone number - 3
// Team members names- Calist Dsouza - 301359253, Ahmad Abbas - 301372338 , Jeet Panchal -
// Submission Date -
// File: StarViewController.swift
// Description: Manages the UI and data display for the Star cruise details. Allows users to navigate to the GuestViewController.

import UIKit

// MARK: - StarViewController

class StarViewController: UIViewController {
    
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
            CruiseName.text = "Star Cruise"
            placeLabel.text = "The Star Cruise is known for its luxury and premium amenities, offering a high-end travel experience. Destinations often include exotic locations worldwide."
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
            // Pass individual pieces of data to GuestViewController
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
