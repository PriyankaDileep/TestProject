//
//  MQHomeTableViewController.swift
//  MobileQuake
//
//  Created by Priyanka Dileep on 17/02/2017.
//  Copyright © 2017 Priyanka. All rights reserved.
//

import UIKit

class MQHomeTableViewController: UITableViewController {
    private let mqServiceManager = MQServiceManager(baseURL: API.AuthenticatedBaseURL)
    private var earthQuakeList : [EarthQuake] = []
    var activityIndicatorView: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTable()
        fetchData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Private Methods
    
    func configureTable() -> Void {
        // Activity Indiator Configuration    
        activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
        tableView.backgroundView = activityIndicatorView
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 60
        self.tableView.contentInset = UIEdgeInsetsMake(40, 0, 0, 0)
    }
    
    func fetchData() -> Void {
        self.activityIndicatorView.startAnimating()
        mqServiceManager.fetchEarthQuakeData { (response, error) in
            if error == nil {
                DispatchQueue.main.async {
                    self.earthQuakeList = response!
                    self.activityIndicatorView.stopAnimating()
                    self.tableView.reloadData()
                }
                
            }
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return earthQuakeList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : MQCustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "MQCustomCell", for: indexPath) as! MQCustomTableViewCell
        
        let earthQuakeDetails = earthQuakeList[indexPath.row]
        
        cell.locationLabel.text  =  earthQuakeDetails.location
        cell.magnitudeLabel.text = String(earthQuakeDetails.magnitude)
        
        return cell
    }


   
}
