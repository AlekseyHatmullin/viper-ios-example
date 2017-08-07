//
//  CountriesPresenter.swift
//  viper-ios-example
//
//  Created by Alexey Hatmullin on 8/7/17.
//  Copyright © 2017 Saritasa. All rights reserved.
//

import Foundation


class CountriesPresenter: CountriesPresentation {
    
    // MARK: - Properties
    
    weak var view: CountriesView?
    var interactor: CountriesUseCase!
    var router: CountriesWireframe!
    
    var countries: [Country] = [] {
        didSet {
            if countries.count > 0 {
                view?.showCountries(countries)
            } else {
                view?.showNoContentScreen()
            }
        }
    }
    
    func viewDidLoad() {
        interactor.fetchCountries()
        view?.showHUD()
    }
    
    func didSelectCountry(_ country: Country) {
        router.presentDetails(forCountry: country)
    }
    
}


extension CountriesPresenter: CountriesInteractorOutput {
    
    func countriesFetched(_ countries: [Country]) {
        self.countries = countries
        view?.hideHUD()
    }
    
    func countriesFetchFailed() {
        view?.showNoContentScreen()
        view?.hideHUD()
    }
    
}
