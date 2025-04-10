//
//  MenuViewController.swift
//  StateGuide
//
//  Created by APPLE on 24/02/24.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var sideMenuList = ["Home", "India Map", "Favourite", "Feedback", "Rate this app"]

    @IBOutlet weak var menuTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        menuTableView.delegate = self
        menuTableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sideMenuList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuViewController", for: indexPath)
        cell.textLabel?.text = sideMenuList[indexPath.row]
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
            // Handle menu item selection
            switch indexPath.row {
            case 0: // Home
                navigateToMainPage()
            case 1: // India Map
                navigateToIndiaMap()
            case 2:
                navigateToFavorite()
            // Add cases for other menu items as needed
            default:
                break
            }
        }
    
    func navigateToMainPage() {
        // Dismiss the menu if you want
        dismiss(animated: true, completion: nil)
    }
    
    func navigateToIndiaMap() {
        

        // Instantiate and present the India Map view controller
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let indiaMapViewController = storyboard.instantiateViewController(withIdentifier: "IndiaMapViewController")
        self.present(indiaMapViewController, animated: true)
     }
    
    func navigateToFavorite() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let indiaMapViewController = storyboard.instantiateViewController(withIdentifier: "FavouriteViewController")
        self.present(indiaMapViewController, animated: true)
    }
    
}
