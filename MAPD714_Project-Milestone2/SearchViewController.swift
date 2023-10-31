//
//  SearchViewController.swift
//  MAPD714_Project-Milestone2
//
// Team number - 8
// Milestone number - 2
// Team members names- Calist Dsouza - 301359253, Ahmad Abbas - 301372338 , Jeet Panchal -
// Submission Date - 30 October 2023
//

import UIKit

struct Cruise {
    let name: String
    let price: Double
    let startDate: Date
    let numberOfNights: Int
}

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var cruises: [Cruise] = [
        Cruise(name: "Bahamas Cruise", price: 500, startDate: Date(), numberOfNights: 7),
        Cruise(name: "Caribbean Cruise", price: 700, startDate: Date(), numberOfNights: 10),
        Cruise(name: "Cuba Cruise", price: 600, startDate: Date(), numberOfNights: 8),
        Cruise(name: "Sampler Cruise", price: 400, startDate: Date(), numberOfNights: 5),
        Cruise(name: "Star Cruise", price: 800, startDate: Date(), numberOfNights: 12)
    ]
    
    var filteredCruises: [Cruise] = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Assign the delegate and data source
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        
        // Set filtered cruises to all cruises initially
        filteredCruises = cruises
        
        // Register the cell identifier
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    // Function to filter cruises based on search text, price, start date, and number of nights
    func filterCruises(for searchText: String) {
        filteredCruises = cruises.filter { cruise in
            let searchTextMatches = cruise.name.lowercased().contains(searchText.lowercased())
            let priceMatches = "\(cruise.price)".contains(searchText)
            let startDateMatches = formatDate(date: cruise.startDate).contains(searchText)
            let numberOfNightsMatches = "\(cruise.numberOfNights)".contains(searchText)
            
            return searchTextMatches || priceMatches || startDateMatches || numberOfNightsMatches
        }
        
        tableView.reloadData()
    }

    // Helper method to format date
    func formatDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date)
    }
}

// MARK: - UISearchBarDelegate

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredCruises = cruises
        } else {
            filterCruises(for: searchText)
        }
        tableView.reloadData()
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension SearchViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCruises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let cruise = filteredCruises[indexPath.row]

        // Customize the cell to display the required information
        cell.textLabel?.text = "\(cruise.name)"
        cell.detailTextLabel?.text = "Price: $\(cruise.price) | Start Date: \(formatDate(date: cruise.startDate)) | Number of Nights: \(cruise.numberOfNights)"

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100 // Adjust this value as per your requirement
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let selectedCruise = filteredCruises[indexPath.row]
            
            switch selectedCruise.name {
            case "Bahamas Cruise":
                performSegue(withIdentifier: "ShowBahamas", sender: selectedCruise)
            case "Caribbean Cruise":
                performSegue(withIdentifier: "ShowCaribbean", sender: selectedCruise)
            case "Cuba Cruise":
                performSegue(withIdentifier: "ShowCuba", sender: selectedCruise)
            case "Sampler Cruise":
                performSegue(withIdentifier: "ShowSampler", sender: selectedCruise)
            case "Star Cruise":
                performSegue(withIdentifier: "ShowStar", sender: selectedCruise)
            default:
                break
            }
        }
}
