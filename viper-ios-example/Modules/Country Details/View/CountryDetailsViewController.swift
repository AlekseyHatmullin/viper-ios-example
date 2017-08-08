//
//  CountryDetailsViewController.swift
//  viper-ios-example
//
//  Created by Alexey Hatmullin on 8/7/17.
//  Copyright © 2017 Saritasa. All rights reserved.
//

import UIKit
import Kingfisher


class CountryDetailsViewController: UIViewController {
    
    
    // MARK: - UI Elements
    
    @IBOutlet fileprivate var countryNameLabel: UILabel!
    @IBOutlet fileprivate var flagImageView: UIImageView!
    
    
    // MARK: - Properties
    
    var presenter: CountryDetailsPresentation!

    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }

}


// MARK: - View's protocols

extension CountryDetailsViewController: CountryDetailsView {
    
    func showDetails(forCountry country: Country) {
        countryNameLabel.text = country.name
    }
    
}
