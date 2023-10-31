//
//  CaribbeanViewController.swift
//  MAPD714_Project-Milestone2
//
//  Created by Jeet Panchal on 2023-10-31.
//

import UIKit

class CaribbeanViewController: UIViewController {
    var cruise: Cruise?

    // Connect these outlets to the corresponding labels in the storyboard
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var numberOfNightsLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        if let cruise = cruise {
            placeLabel.text = ""
            priceLabel.text = "Price: $\(cruise.price)"
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            let startDateString = formatter.string(from: cruise.startDate)
            startDateLabel.text = "Start Date: \(startDateString)"
            numberOfNightsLabel.text = "Duration: \(cruise.numberOfNights) nights"
        }
    }
}
