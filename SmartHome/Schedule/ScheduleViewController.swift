//
//  ScheduleViewController.swift
//  SmartHome
//
//  Created by jeff on 2020/06/04.
//  Copyright © 2020 TakHyun Jung. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var itemstore = [ScheduleItem]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // NavigationBar make border and background clear
        let navigationBar = navigationController?.navigationBar
        navigationBar?.barTintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        navigationBar?.isTranslucent = false
        navigationBar?.setBackgroundImage(UIImage(), for: .default)
        navigationBar?.shadowImage = UIImage()
        tableView.delegate = self
        tableView.dataSource = self
        registerXib()
    }
    
    // Xib register
    private func registerXib() {
        // nib는 tableviewcell.swift file name
        let nibName = UINib(nibName: "ScheduleTableViewCell", bundle: nil)
        // forCellReuseIdentifier xib에서 지정한 cell identifier
        tableView.register(nibName, forCellReuseIdentifier: "scheduleCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemstore.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scheduleCell") as! ScheduleTableViewCell
        let item = itemstore[indexPath.row]
        
        cell.timeLabel?.text = item.time
        cell.weekLabel?.text = item.week.joined(separator: ",")
        cell.deviceInfoLabel?.text = item.deviceNvalue
        cell.scheduleSwitch.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let scheduleItemViewController = segue.destination as! ScheduleItemViewController
        
        scheduleItemViewController.delegate = self
    }
    
    
}

extension ScheduleViewController: SendDataDelegate {
    func sendData(data: ScheduleItem) {
        itemstore.append(data)
        tableView.reloadData()
    }
}
