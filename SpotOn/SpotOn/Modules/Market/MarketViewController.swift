//
//  MarketViewController.swift
//  SpotOn
//
//  Created by Murali Gorantla (TCIN) on 24/07/22.
//

import UIKit
import Foundation
class MarketViewController: UIViewController {
    
    @IBOutlet weak var marketTableView: UITableView!
    
    
    var presenter: MarketPresenterInterface!
    
    // MARK: - Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
        presenter.loadMarkets()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.startRefresh()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presenter.stopRefresh()
    }
    
    //MARK: - Common
    
    func registerNib() {
        self.marketTableView.register(UINib(nibName: "MarketTableViewCell", bundle: nil), forCellReuseIdentifier: MarketTableViewCell.reuseIdentifier)
        self.marketTableView.register(
            SectionHeaderView.nib,
            forHeaderFooterViewReuseIdentifier:
                SectionHeaderView.reuseIdentifier
        )
    }
    
}

//MARK :-  TableView Datasource Methods

extension MarketViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MarketTableViewCell.reuseIdentifier, for: indexPath) as? MarketTableViewCell
        cell?.configure(with: presenter.item(at: indexPath))
        return cell ?? UITableViewCell()
    }
    
}

//MARK :-  TableView Delegate Methods

extension MarketViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.marketCellHeight
    }
    
    func tableView(_ tableView: UITableView,
                   heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView,
                   estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return Constants.marketCellHeaderHeight
    }
    
    func tableView(_ tableView: UITableView,
                   viewForHeaderInSection section: Int) -> UIView? {
        guard let view = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: SectionHeaderView.reuseIdentifier)
                as? SectionHeaderView
        else {
            return nil
        }
        
        return view
    }
}


extension MarketViewController: MarketViewInterface {
    
    func reloadData() {
        DispatchQueue.main.async {
            self.marketTableView.reloadData()
        }
    }
    
}
