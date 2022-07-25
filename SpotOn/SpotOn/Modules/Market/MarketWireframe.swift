//
//  MarketWireframe.swift
//  SpotOn
//
//  Created by Murali Gorantla (TCIN) on 24/07/22.
//

import Foundation
import UIKit

final class MarketWireframe: BaseWireframe<MarketViewController> {

    // MARK: - Private properties -

    private let storyboard = UIStoryboard(name: "Main", bundle: nil)

    // MARK: - Module setup -

    init() {
        let moduleViewController = storyboard.instantiateViewController(ofType: MarketViewController.self)
        super.init(viewController: moduleViewController)

        let interactor = MarketInteractor(marketService: MarketServerManager())
        let presenter = MarketPresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension MarketWireframe: MarketWireframeInterface {
    func navigateToMarketDetails(id: String) {
        // Navigation Logic comes here
    }

}
