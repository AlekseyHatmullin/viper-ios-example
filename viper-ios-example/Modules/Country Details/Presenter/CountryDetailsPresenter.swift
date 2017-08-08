//
//  CountryDetailsPresenter.swift
//  viper-ios-example
//
//  Created by Alexey Hatmullin on 8/7/17.
//  Copyright © 2017 Saritasa. All rights reserved.
//

import Foundation


class CountryDetailsPresenter: CountryDetailsPresentation {
    
    // MARK: - Properties
    
    weak var view: CountryDetailsView?
    var wireframe: CountryDetailsWireframe!
    var country: Country!
    
    
    // MARK: - Functions
    
    func viewDidLoad() {
        view?.showDetails(forCountry: country)
    }
    
}
