//
//  FavouriteViewController.swift
//  StateGuide
//
//  Created by APPLE on 03/03/24.
//

import UIKit

class FavouriteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        if(favStates.isEmpty) {
            tableView.isHidden = true
            let label = UILabel(frame: CGRect(x: (self.view.frame.width - 200) / 2, y: (self.view.frame.height - 50) / 2, width: 200, height: 100))
            label.numberOfLines = 0
            label.font = .systemFont(ofSize: 25)
            label.textAlignment = .center
            label.text = "No favorite state selected. Please choose one!"
            self.view.addSubview(label)
        } else {
            tableView.isHidden = false
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favStates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FavouriteTableViewCell", for: indexPath) as? FavouriteTableViewCell else {
                return UITableViewCell()
            }
        cell.stateName.text = favStates[indexPath.row].name
        cell.capitalName.text = favStates[indexPath.row].capital
        cell.emblemImg.image = UIImage(named: favStates[indexPath.row].imageName)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
