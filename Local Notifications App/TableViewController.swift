//
//  TableViewController.swift
//  Local Notifications App
//
//  Created by administrator on 11/01/2022.
//

import UIKit

class TableViewController: UITableViewController {

    var allNotifications: [LocalNotification]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
        tableView.separatorColor = .systemGray
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows and zero if we dont have rows
        return allNotifications?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell..
               
        guard let allNotifications = allNotifications else {
            return cell
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm a"
        let timeStarted = formatter.string(from: allNotifications[indexPath.row].dateItStarted)
        let timeEnded = formatter.string(from: allNotifications[indexPath.row].dateItEnds)
        
        cell.textLabel?.text = "\(timeStarted) - \(timeEnded) ... \(allNotifications[indexPath.row].length) minute timer"
        
        return cell
    }
}
