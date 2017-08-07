//
//  CountryTableViewCell.swift
//  viper-ios-example
//
//  Created by Alexey Hatmullin on 8/7/17.
//  Copyright © 2017 Saritasa. All rights reserved.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    @IBOutlet weak var countryNameLabel: UILabel!
    
    var country: Country! {
        didSet {
            countryNameLabel.text = country.name
        }
    }

}
