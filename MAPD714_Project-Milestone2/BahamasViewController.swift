// BahamasViewController.swift
// MAPD714_Project-Milestone2
//
// Created by Jeet Panchal on 2023-10-31.

import UIKit

class BahamasViewController: UIViewController {
    var cruise: Cruise?

    // MARK: - Outlets

    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var numberOfNightsLabel: UILabel!

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        displayCruiseDetails()
    }

    // MARK: - UI Setup

    func setupUI() {
        view.backgroundColor = .white
        // Add any additional UI setup here
    }

    // MARK: - Data Display

    func displayCruiseDetails() {
        if let cruise = cruise {
            // Display cruise details in the corresponding labels
            placeLabel.text = "Visiting Place: Some common ports of call in the Bahamas include Nassau (the capital), Freeport, and private islands owned by cruise lines such as Royal Caribbean's CocoCay or Disney Cruise Line's Castaway Cay."
            priceLabel.text = "Price: $\(cruise.price)"
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            let startDateString = formatter.string(from: cruise.startDate)
            startDateLabel.text = "Start Date: \(startDateString)"
            numberOfNightsLabel.text = "Duration: \(cruise.numberOfNights) nights"
        }
    }
}
