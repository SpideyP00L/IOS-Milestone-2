//
//  PaymentViewController.swift
//  MAPD714_Project-Milestone2
//
// Team number - 8
// Milestone number - 3
// Team members names- Calist Dsouza - 301359253, Ahmad Abbas - 301372338, Jeet Panchal -
// Submission Date - 30 October 2023
// Description: Manages payment information and transitions to the Reservation screen after validating user input for payment details.

import UIKit

class PaymentViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var SelectPaymentType: UIPickerView!
    @IBOutlet weak var EnterCardNumber: UITextField!
    @IBOutlet weak var EnterName: UITextField!
    @IBOutlet weak var SelectExpiryDate: UIDatePicker!
    @IBOutlet weak var GotoReservationScreen: UIButton!

    var name: String?
    var place: String?
    var price: String?
    var startDate: String?
    var numberOfNights: String?
    var numberOfAdults: Int = 0
    var numberOfKids: Int = 0
    var isSeniorSelected: Bool = false
    var numberOfSeniors: Int = 0
    var selectedPaymentType: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set up text field delegate to enable validation
        EnterCardNumber.delegate = self
        EnterName.delegate = self

        // Set up the picker view
        SelectPaymentType.delegate = self
        SelectPaymentType.dataSource = self

        // Do any additional setup after loading the view.
        // Now you can use the data in the PaymentViewController

        print("Number of Adults: \(numberOfAdults)")
        print("Number of Kids: \(numberOfKids)")
        print("Is Senior Selected: \(isSeniorSelected)")
        print("Number of Seniors: \(numberOfSeniors)")

        // Set accessibility labels
        setAccessibilityLabels()
    }

    // MARK: - Validation

    func validateCardNumber() -> Bool {
        guard let cardNumber = EnterCardNumber.text else { return false }
        let cardNumberPredicate = NSPredicate(format: "SELF MATCHES %@", "^[0-9]+$")
        return cardNumberPredicate.evaluate(with: cardNumber)
    }

    func validateName() -> Bool {
        guard let name = EnterName.text else { return false }
        let namePredicate = NSPredicate(format: "SELF MATCHES %@", "^[a-zA-Z ]+$")
        return namePredicate.evaluate(with: name)
    }

    func validateExpiryDate() -> Bool {
        let currentDate = Date()
        let selectedDate = SelectExpiryDate.date
        let calendar = Calendar.current

        // Set the minimum date to 1/1/2023
        var components = DateComponents()
        components.year = 2023
        components.month = 1
        components.day = 1
        let minDate = calendar.date(from: components)!

        // Set the maximum date to 1/1/2033
        components.year = 2033
        let maxDate = calendar.date(from: components)!

        return selectedDate >= minDate && selectedDate <= maxDate && selectedDate >= currentDate
    }

    // MARK: - UITextFieldDelegate

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Allow backspace
        if string.isEmpty {
            return true
        }

        // Perform validation for only numbers in card number field
        if textField == EnterCardNumber {
            let validCharacters = CharacterSet(charactersIn: "0123456789")
            return (string.rangeOfCharacter(from: validCharacters) != nil)
        }

        return true
    }

    // MARK: - UIPickerViewDelegate & UIPickerViewDataSource

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2 // Assuming there are two payment types: Debit Card and Credit Card
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ["Select Card", "Debit Card", "Credit Card"][row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedPaymentType = ["Debit Card", "Credit Card"][row]
    }

    // MARK: - Actions

    @IBAction func proceedToReservation(_ sender: Any) {
        // Validate data before transitioning to ReservationViewController

        // Validate data before transitioning to ReservationViewController

            guard let paymentType = selectedPaymentType, !paymentType.isEmpty else {
                showErrorPopup(message: NSLocalizedString("Validation Error", comment: ""), detail: NSLocalizedString("Please select a payment type.", comment: ""))
                return
            }

            guard let cardNumber = EnterCardNumber.text, !cardNumber.isEmpty, validateCardNumber() else {
                showErrorPopup(message: NSLocalizedString("Validation Error", comment: ""), detail: NSLocalizedString("Please enter a valid card number.", comment: ""))
                return
            }

            guard let name = EnterName.text, !name.isEmpty, validateName() else {
                showErrorPopup(message: NSLocalizedString("Validation Error", comment: ""), detail: NSLocalizedString("Please enter a valid name.", comment: ""))
                return
            }

            // Additional validations
            if validateExpiryDate() {
                // Instantiate the ReservationViewController from the storyboard
                let storyboard = UIStoryboard(name: "Main", bundle: nil) // Replace "Main" with your actual storyboard name
                if let reservationViewController = storyboard.instantiateViewController(withIdentifier: "ReservationViewController") as? ReservationViewController {
                    // Pass data to the ReservationViewController
                    reservationViewController.name = name
                    reservationViewController.place = place
                    reservationViewController.price = price
                    reservationViewController.startDate = startDate
                    reservationViewController.numberOfNights = numberOfNights
                    reservationViewController.numberOfAdults = numberOfAdults
                    reservationViewController.numberOfKids = numberOfKids
                    reservationViewController.isSeniorSelected = isSeniorSelected
                    reservationViewController.numberOfSeniors = numberOfSeniors
                    reservationViewController.paymentType = selectedPaymentType
                    reservationViewController.cardNumber = EnterCardNumber.text
                    reservationViewController.cardHolderName = EnterName.text
                    reservationViewController.expiryDate = SelectExpiryDate.date

                    // Present the ReservationViewController
                    self.present(reservationViewController, animated: true, completion: nil)
                }
            } else {
                // Display error message if validation fails
                showErrorPopup(message: NSLocalizedString("Validation Error", comment: ""), detail: NSLocalizedString("Please check your entered data.", comment: ""))
            }
    }

    // MARK: - Popups

    func showErrorPopup(message: String, detail: String) {
        let alertController = UIAlertController(title: message, message: detail, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }

    // MARK: - Navigation

    // This method is called just before the segue is performed.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueIdentifiers.reservationSegue {
            // Pass the data to the ReservationViewController
            if let reservationViewController = segue.destination as? ReservationViewController {
                reservationViewController.name = name
                reservationViewController.place = place
                reservationViewController.price = price
                reservationViewController.startDate = startDate
                reservationViewController.numberOfNights = numberOfNights
                reservationViewController.numberOfAdults = numberOfAdults
                reservationViewController.numberOfKids = numberOfKids
                reservationViewController.isSeniorSelected = isSeniorSelected
                reservationViewController.numberOfSeniors = numberOfSeniors
                reservationViewController.paymentType = selectedPaymentType
                reservationViewController.cardNumber = EnterCardNumber.text
                reservationViewController.cardHolderName = EnterName.text
                reservationViewController.expiryDate = SelectExpiryDate.date
            }
        }
    }

    // MARK: - Constants

    private struct SegueIdentifiers {
        static let reservationSegue = "ReservationSegueIdentifier"
    }

    // MARK: - Accessibility

    private func setAccessibilityLabels() {
        SelectPaymentType.accessibilityLabel = NSLocalizedString("Payment Type", comment: "")
        EnterCardNumber.accessibilityLabel = NSLocalizedString("Card Number", comment: "")
        EnterName.accessibilityLabel = NSLocalizedString("Cardholder Name", comment: "")
        SelectExpiryDate.accessibilityLabel = NSLocalizedString("Expiry Date", comment: "")
        GotoReservationScreen.accessibilityLabel = NSLocalizedString("Proceed to Reservation", comment: "")
    }
}
