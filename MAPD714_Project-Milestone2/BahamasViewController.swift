// BahamasViewController.swift
// MAPD714_Project-Milestone2
//
// Team number - 8
// Milestone number - 3
// Team members names- Calist Dsouza - 301359253, Ahmad Abbas - 301372338 , Jeet Panchal -
// Submission Date - 30 October 2023

// File: BahamasViewController.swift
// Description: Manages the UI and data display for the Bahamas cruise details. Allows users to navigate to the GuestViewController.

import UIKit

// MARK: - BahamasViewController

class BahamasViewController: UIViewController {
    
    // MARK: Properties
    
    var cruise: Cruise? // Declare a variable to hold the Cruise object
    
    // MARK: Outlets
    
    @IBOutlet weak var CruiseName: UILabel!
    @IBOutlet weak var placeLabel: UILabel! // Label to display the visiting place information
    @IBOutlet weak var priceLabel: UILabel! // Label to display the price information
    @IBOutlet weak var startDateLabel: UILabel! // Label to display the start date information
    @IBOutlet weak var numberOfNightsLabel: UILabel! // Label to display the duration information
    @IBOutlet weak var goToGuest: UIButton!
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI() // Set up the UI elements
        displayCruiseDetails() // Display the details of the selected cruise
    }
    
    // MARK: UI Setup
    
    func setupUI() {
        view.backgroundColor = .white
        // Add any additional UI setup here
    }
    
    // MARK: Data Display
    
    func displayCruiseDetails() {
        if let cruise = cruise { // Check if the cruise object is not nil
            // Display cruise details in the corresponding labels
            CruiseName.text = "Bahamas Cruise"
            placeLabel.text = "Visiting Place: Some common ports of call in the Bahamas include Nassau (the capital), Freeport, and private islands owned by cruise lines such as Royal Caribbean's CocoCay or Disney Cruise Line's Castaway Cay."
            priceLabel.text = "Price: $\(cruise.price)"
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            let startDateString = formatter.string(from: cruise.startDate) // Format the start date to a string
            startDateLabel.text = "Start Date: \(startDateString)"
            numberOfNightsLabel.text = "Duration: \(cruise.numberOfNights) nights"
        }
    }
    
    // MARK: Actions
    
    @IBAction func goToGuest(_ sender: Any) {
        performSegue(withIdentifier: "GuestSegue", sender: self)
    }
    
    // This method is called just before the segue is performed.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GuestSegue" {
            // Pass the cruise object to the next view controller if needed
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
