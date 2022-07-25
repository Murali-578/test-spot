//
//  MarketPresenter.swift
//  SpotOn
//
//  Created by Murali Gorantla (TCIN) on 24/07/22.
//

import Foundation

final class MarketPresenter {
    // MARK: - Private properties -

    private unowned let view: MarketViewInterface
    private let interactor: MarketInteractorInterface
    private let wireframe: MarketWireframeInterface
    
    private var items: [Market] = [] {
        didSet {
            view.reloadData()
        }
    }
    
    var timer: Timer?
    // MARK: - Lifecycle -

    init(
        view: MarketViewInterface,
        interactor: MarketInteractorInterface,
        wireframe: MarketWireframeInterface
    ) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

extension MarketPresenter: MarketPresenterInterface {
    
    @objc func loadMarkets() {
        interactor.requestMarketData(pageSize: Constants.pageSize, offset: Constants.offset) {[weak self] result in
            guard let self = `self` else { return }
            switch result {
            case .success(let response):
                self.items = response.data
            case .failure(let error):
                self.showValidationError(error)
            }
        }
    }
    
    var numberOfItems: Int {
        items.count
    }
    
    func item(at indexPath: IndexPath) -> MarketItemInterface {
        items[indexPath.row]
    }
    
    func itemSelected(at indexPath: IndexPath) {
        let _ = items[indexPath.row]
    }
    
    func startRefresh() {
        
        timer = Timer.scheduledTimer(timeInterval: 10.0,
                                             target: self,
                                             selector: #selector(loadMarkets),
                                             userInfo: nil,
                                             repeats: true)
        timer?.tolerance = 0.2 // To save battery energey
    }
    
    func stopRefresh() {
        timer?.invalidate()
    }
}

private extension MarketPresenter {
    func showValidationError(_ error: Error) {
        DispatchQueue.main.async {
            self.wireframe.showAlert(with: Constants.alertErrorTitle, message: error.localizedDescription)
        }
    }
}
