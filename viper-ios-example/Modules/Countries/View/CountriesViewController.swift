//
//  CountriesViewController.swift
//  viper-ios-example
//
//  Created by Alexey Hatmullin on 8/7/17.
//  Copyright © 2017 Saritasa. All rights reserved.
//

import UIKit

class CountriesViewController: UIViewController {
    
    // MARK: - Properties
    
    var presenter: CountriesPresentation!
    var countries: [Country] = [] {
        didSet {
            tableView.reloadData()
            tableView.isHidden = false
            messageLabel.isHidden = true
        }
    }
    
    
    // MARK: - UI Elements
    
    @IBOutlet fileprivate var tableView: UITableView!
    @IBOutlet fileprivate var messageLabel: UILabel!
    
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }

}

extension CountriesViewController: CountriesView {
    
    func showNoContentScreen() {
        tableView.isHidden = true
        messageLabel.isHidden = false
    }
    
    func showCountries(_ countries: [Country]) {
        self.countries = countries
    }
    
}


// MARK: - UITableView Data Source & Delegate

extension CountriesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryTableViewCell", for: indexPath) as! CountryTableViewCell
        cell.country = countries[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectCountry(countries[indexPath.row])
    }
    
}
