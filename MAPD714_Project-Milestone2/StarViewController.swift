// StarViewController.swift
// MAPD714_Project-Milestone2
//
// Created by Jeet Panchal on 2023-10-31.

import UIKit

class StarViewController: UIViewController {
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
            // Update labels with cruise details
            placeLabel.text = "The Star Cruise is known for its luxury and premium amenities, offering a high-end travel experience. Destinations often include exotic locations worldwide."
            priceLabel.text = "Price: $\(cruise.price)"
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            let startDateString = formatter.string(from: cruise.startDate)
            startDateLabel.text = "Start Date: \(startDateString)"
            numberOfNightsLabel.text = "Duration: \(cruise.numberOfNights) nights"
        }
    }
}
