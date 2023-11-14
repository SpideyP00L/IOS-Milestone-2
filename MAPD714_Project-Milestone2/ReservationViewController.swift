//
//  ReservationViewController.swift
//  MAPD714_Project-Milestone2
//
// Team number - 8
// Milestone number - 3
// Team members names- Calist Dsouza - 301359253, Ahmad Abbas - 301372338 , Jeet Panchal -
// Submission Date -
// Description: Displays accepted data from previous screens, including cruise details and payment information.


import UIKit

class ReservationViewController: UIViewController {
    
    @IBOutlet weak var DisplayData: UILabel!
    
    // Properties to hold the data
    var name: String?
    var place: String?
    var price: String?
    var startDate: String?
    var numberOfNights: String?
    var numberOfAdults: Int = 0
    var numberOfKids: Int = 0
    var isSeniorSelected: Bool = false
    var numberOfSeniors: Int = 0
    var paymentType: String?
    var cardNumber: String?
    var cardHolderName: String?
    var expiryDate: Date?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Display all the accepted data in the DisplayData label
        let displayText = """
            Accepted Data:
            Cruise Name: \(name ?? "No cruise name")
            
            Visiting Places: \(place ?? "No Visiting Place")
            
            Start Date: \(startDate ?? "No start date")
            
            Price: \(price ?? "0")
            
            Number of Nights: \(numberOfNights ?? "No number of nights")
            
            Number of Adults: \(numberOfAdults)
            
            Number of Kids: \(numberOfKids)
            
            Is Senior Selected: \(isSeniorSelected)
            Number of Seniors: \(numberOfSeniors)
            
            Payment Type: \(paymentType ?? "No payment type")
            Card Number: \(cardNumber ?? "No card number")
            Card Holder Name: \(cardHolderName ?? "No card holder name")
            Expiry Date: \(formatDate(expiryDate) ?? "No expiry date")
            """
        DisplayData.text = displayText
    }
    
    // Helper function to format dates
    private func formatDate(_ date: Date?) -> String? {
        guard let date = date else { return nil }

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date)
    }
}
