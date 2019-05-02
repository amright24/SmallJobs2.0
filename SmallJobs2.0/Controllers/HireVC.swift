//
//  SecondViewController.swift
//  SmallJobs2.0
//
//  Created by Austin Rightnowar on 4/11/19.
//  Copyright © 2019 Austin Rightnowar. All rights reserved.
//

import UIKit

class HireVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var jobsArray = [Job]()


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DataService.instance.getAllFeedJobs { (returnedJobsArray) in
            self.jobsArray = returnedJobsArray.reversed()
            self.tableView.reloadData()
        }
    }


}

extension HireVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobsArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "jobCell") as? JobCell else { return UITableViewCell() }
        let image = UIImage(named: "cleaningHome.png")
        let job = jobsArray[indexPath.row]
        DataService.instance.getUsername(forUID: job.senderId) { (returnedUsername) in
            cell.configureCell(jobImage: image!, jobTitle: job.title, jobDate: job.date)
        }
        return cell
    }
}

