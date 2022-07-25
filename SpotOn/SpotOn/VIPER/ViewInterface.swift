import UIKit

protocol ViewInterface: AnyObject {
    func showProgressHUD()
    func hideProgressHUD()
}

extension ViewInterface {
    
    func showProgressHUD() {
        // Start Progress Indicator
    }

    func hideProgressHUD() {
        // Stop Progess Indicator
    }
}
