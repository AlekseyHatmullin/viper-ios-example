//
//  CountriesContract.swift
//  viper-ios-example
//
//  Created by Alexey Hatmullin on 8/7/17.
//  Copyright © 2017 Saritasa. All rights reserved.
//

import UIKit

protocol CountriesView: IndicatableView {
    var presenter: CountriesPresentation! { get set }
    
    func showNoContentScreen()
    func showCountries(_ countries: [Country])
}

protocol CountriesPresentation: class {
    weak var view: CountriesView? { get set }
    var interactor: CountriesUseCase! { get set }
    var router: CountriesWireframe! { get set }
    
    func viewDidLoad()
    func didSelectCountry(_ country: Country)
}

protocol CountriesUseCase: class {
    weak var output: CountriesInteractorOutput! { get set }
    
    func fetchCountries()
}

protocol CountriesInteractorOutput: class {
    func countriesFetched(_ countries: [Country])
    func countriesFetchFailed()
}

protocol CountriesWireframe: class {
    weak var viewController: UIViewController? { get set }
    
    func presentDetails(forCountry country: Country)
    
    static func assembleModule() -> UIViewController
}
