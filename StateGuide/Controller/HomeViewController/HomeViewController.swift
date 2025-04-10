//
//  ViewController.swift
//  StateGuide
//
//  Created by APPLE on 24/02/24.
//

import UIKit
import SideMenu

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    var menu: SideMenuNavigationController?
    
    // Create a property for MenuViewController
    var menuViewController: MenuViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        // Initialize the menuViewController from the storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil) // Replace "Main" with your actual storyboard name
        menuViewController = storyboard.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController
        
        // Make sure menuViewController is not nil
        guard let menuVC = menuViewController else {
            fatalError("Unable to instantiate MenuViewController")
        }
        
        menu = SideMenuNavigationController(rootViewController: menuVC)
        menu?.leftSide = true
        
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
    }
    
    @IBAction func menuButtonTapped(_ sender: UIBarButtonItem) {
        present(menu!, animated: true)
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(section == 0) {
            return statesAndCapitals.count
        } else {
            return unionTerritoriesAndCapitals.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as? HomeTableViewCell else {
            return UITableViewCell()
        }
        
        if indexPath.section == 0 {
            cell.stateName.text = statesAndCapitals[indexPath.row].name
            cell.capitalName.text = statesAndCapitals[indexPath.row].capital
            cell.emblemImg.image = UIImage(named: statesAndCapitals[indexPath.row].imageName)
            //cell.favButton.imageView?.image = UIImage(systemName: "heart.fill")
        } else {
            cell.stateName.text = unionTerritoriesAndCapitals[indexPath.row].name
            cell.capitalName.text = unionTerritoriesAndCapitals[indexPath.row].capital
            //cell.favButton.imageView?.image = UIImage(systemName: "heart")
        }
        
        let isFavorited = favStates.contains { $0.name == cell.stateName.text }
        cell.favButton.setImage(UIImage(systemName: isFavorited ? "heart.fill" : "heart"), for: .normal)
        cell.favButton.tag = indexPath.row
        cell.favButton.addTarget(self, action: #selector(favButtonTapped(_:)), for: .touchUpInside)
        
        return cell
    }
    
    @objc func favButtonTapped(_ sender: UIButton) {
        print(sender.tag)
        if sender.currentImage == UIImage(systemName: "heart") {
            sender.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            favStates.append(statesAndCapitals[sender.tag])
        } else {
            sender.setImage(UIImage(systemName: "heart"), for: .normal)
            favStates.removeAll { $0.name == statesAndCapitals[sender.tag].name}
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "States and Capitals"
        } else {
            return "Union Territories and Capitals"
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let width = view.frame.size.width
        let height = 60.0
        
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        footerView.backgroundColor = .systemTeal
        
        let footerLabel = UILabel(frame: CGRect(x: 10, y: 10, width: width - 20, height: height - 20))
        footerLabel.font = .boldSystemFont(ofSize: 30)
        footerLabel.textColor = .white
        
        if section == 0 {
            footerLabel.text =  "States and Capitals"
        } else {
            footerLabel.text = "Union Territories and Capitals"
        }
        
        footerView.addSubview(footerLabel)
        
        return footerView
    }
    
}

