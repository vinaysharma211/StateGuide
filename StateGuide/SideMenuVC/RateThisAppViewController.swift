//
//  RateThisAppViewController.swift
//  StateGuide
//
//  Created by APPLE on 25/02/24.
//

import UIKit
import StoreKit

class RateThisAppViewController: UIViewController {

    override func viewDidLoad() {
            super.viewDidLoad()
            
            // Call this function where you want to prompt the user to rate the app
            askForReview()
        }
        
        func askForReview() {
            if #available(iOS 10.3, *) {
                SKStoreReviewController.requestReview()
            } else {
                // Fallback for earlier iOS versions
                // You might want to redirect the user to the App Store link here
            }
        }

}
