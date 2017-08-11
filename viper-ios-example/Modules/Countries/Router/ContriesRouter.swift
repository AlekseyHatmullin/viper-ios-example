//
//  ContriesRouter.swift
//  viper-ios-example
//
//  Created by Alexey Hatmullin on 8/7/17.
//  Copyright © 2017 Saritasa. All rights reserved.
//

import UIKit
import Hero


class CountriesRouter: CountriesWireframe {
    
    weak var viewController: UIViewController?
    
    static func assembleModule() -> UIViewController {
        let view = UIStoryboard(name: "Countries", bundle: nil).instantiateViewController(withIdentifier: "CountriesViewController") as! CountriesViewController
        let presenter = CountriesPresenter()
        let interactor = CountriesInteractor()
        let router = CountriesRouter()
        
        let navigation = UINavigationController(rootViewController: view)
        navigation.isHeroEnabled = true
        
        view.presenter = presenter
        
        presenter.view  = view as? CountriesView
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.viewController = view
        
        return navigation
    }
    
    func presentDetails(forCountry country: Country) {
        let countryDetailsVC = CountryDetailsRouter.assembleModule(country)
        viewController?.navigationController?.heroNavigationAnimationType = .zoom
        viewController?.navigationController?.pushViewController(countryDetailsVC, animated: true)
    }
    
}
