//
//  SectionHeaderView.swift
//  SpotOn
//
//  Created by Murali Gorantla (TCIN) on 24/07/22.
//

import UIKit

final class SectionHeaderView: UITableViewHeaderFooterView {

    static let reuseIdentifier: String = String(describing: SectionHeaderView.self)

    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
}
