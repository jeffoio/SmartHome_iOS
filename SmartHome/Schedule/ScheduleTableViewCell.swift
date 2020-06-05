//
//  ScheduleTableViewCell.swift
//  SmartHome
//
//  Created by jeff on 2020/06/05.
//  Copyright © 2020 TakHyun Jung. All rights reserved.
//

import UIKit

class ScheduleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var deviceInfoLabel: UILabel!
    @IBOutlet weak var weekLabel: UILabel!
    @IBOutlet weak var scheduleSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
