//
//  InternetMasterViewController.swift
//  NetworkApp
//
//  Created by Denna, Zachary on 1/2/19.
//  Copyright © 2019 Denna, Zachary. All rights reserved.
//

import Foundation
import UIKit

public class InternetMasterViewController: UITableViewController
{
    private weak var internetDetail : InternetDetailViewController? = nil
    private lazy var internetTopics : [String] = [String]()
    private lazy var addresses : [String] = [String]()
    
    private func setupDetailContents() -> Void
    {
        internetTopics = [
            "Internet Definitions 👓",
            "Standard Search Engine 🌿",
            "AP CSP 🍄",
            "Canyons District 🌤",
            "CTEC ☎️",
            "Social Media 🌞"
        ]
        
        addresses = [
            "https://docs.google.com/document/d/1Zs9wIvTgTVdi_sHOhIbYaVUsFixNSBiG826CS5HqC4I/edit",
            "https://www.google.com",
            "https://apcentral.collegeboard.org/courses/ap-computer-science-principles/course",
            "http://www.canyonsdistrict.org/",
            "https://ctec.canyonsdistrict.org/",
            "https://www.instagram.com/?hl=en"
            
        ]
        if let splitView = splitViewController
        {
            let currentControllers = splitView.viewControllers
            internetDetail = currentControllers[0] as? InternetDetailViewController
        }
    }
    
    //This method only happens with the split view
    public override func viewDidLoad() -> Void
    {
        super.viewDidLoad()
        setupDetailContents()
        self.clearsSelectionOnViewWillAppear = false
        
        if let split = splitViewController
        {
            let controllers = split.viewControllers
            internetDetail = (controllers[controllers.count - 1] as! UINavigationController).topViewController as? InternetDetailViewController
        }
        
        // Do any additional setup after loading the view.
    }
    
    //this method will execute every time the master is displayed
    public override func viewWillAppear(_ animated: Bool) -> Void
    {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }
    
    // MARK: - Table View
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return addresses.count
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for:  indexPath)
        
        let rowText = internetTopics[indexPath.row]
        cell.textLabel!.text = rowText
        return cell
    }
    
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        internetDetail?.detailAddress = addresses[indexPath.row]
        internetDetail?.detailTitle = internetTopics[indexPath.row]
        if (internetDetail != nil)
        {
            splitViewController?.showDetailViewController(internetDetail!, sender: nil)
        }
        
}

}
