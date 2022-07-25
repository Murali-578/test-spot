//
//  MarketTableViewCell.swift
//  SpotOn
//
//  Created by Murali Gorantla (TCIN) on 24/07/22.
//

import UIKit

class MarketTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "MarketTableViewCellIdentifier"
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var hoursLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with item: MarketItemInterface) {
        self.nameLabel.text = item.marketName
        self.hoursLabel.text = String(format: "%.2f %%", (item.marketPercentage as NSString).doubleValue)
        self.priceLabel.text = String(format: "$ %.2f", (item.marketPrice as NSString).doubleValue)
    }
    
}
