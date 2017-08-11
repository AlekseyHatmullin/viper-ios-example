//
//  CountryDetailsContract.swift
//  viper-ios-example
//
//  Created by Alexey Hatmullin on 8/7/17.
//  Copyright © 2017 Saritasa. All rights reserved.
//

import UIKit


protocol CountryDetailsView: class {
    
    var presenter: CountryDetailsPresentation! { get set }
    
    func showDetails(forCountry country: Country)
    
}

protocol CountryDetailsPresentation: class {
    
    weak var view: CountryDetailsView? { get set }
    
    func viewDidLoad()
    
}

protocol CountryDetailsWireframe: class {
    
    static func assembleModule(_ country: Country) -> CountryDetailsViewController
    
}
