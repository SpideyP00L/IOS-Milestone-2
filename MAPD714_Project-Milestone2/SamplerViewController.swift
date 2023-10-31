// SamplerViewController.swift
// MAPD714_Project-Milestone2
//
// Created by Jeet Panchal on 2023-10-31.

import UIKit

class SamplerViewController: UIViewController {
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
            placeLabel.text = "The sampler cruise offers a taste of different destinations, often with shorter itineraries. It's a great option for first-time cruisers or those looking to explore multiple locations in a shorter time frame."
            priceLabel.text = "Price: $\(cruise.price)"
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            let startDateString = formatter.string(from: cruise.startDate)
            startDateLabel.text = "Start Date: \(startDateString)"
            numberOfNightsLabel.text = "Duration: \(cruise.numberOfNights) nights"
        }
    }
}
