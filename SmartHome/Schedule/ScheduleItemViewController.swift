//
//  ScheduleItemViewController.swift
//  SmartHome
//
//  Created by jeff on 2020/06/05.
//  Copyright © 2020 TakHyun Jung. All rights reserved.
//

import UIKit

protocol SendDataDelegate {
    func sendData(data: ScheduleItem)
}

class ScheduleItemViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet var weekButton: [UIButton]!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var week = [String]()
    var time = String()
    var deviceNvalue = String()
    var delegate: SendDataDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.dataSource = self
        pickerView.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneButton(_ sender: UIButton) {
        // 이전 화면으로 데이터 전달
        let scheduleItem = ScheduleItem(time: time, deviceNvalue: deviceNvalue, week: week)
        delegate?.sendData(data: scheduleItem)
        
        // 이전 화면으로 돌아가기
        _ = navigationController?.popViewController(animated: true)
    }
    
    // WeekToggleButton
    var day = ["월요일","화요일", "수요일", "목요일", "금요일", "토요일", "일요일"]
    @IBAction func touchWeek(_ sender: UIButton) {
        let idx = weekButton.firstIndex(of: sender)!
        sender.isSelected.toggle()
        if sender.isSelected {
            week.append(day[idx])
        } else {
            week = week.filter({$0 != day[idx]})
        }
    }
    
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        // Date 형식 오후 4:09
        let dateformatter = DateFormatter()
        dateformatter.dateStyle = .none
        dateformatter.timeStyle = .short
        time = dateformatter.string(from: datePickerView.date)
    }
    
    var values = ["냉방 On", "냉방 Off", "거실 스위치 On", "거실 스위치 Off", "침실 스위치 On", "침실 스위치 Off"]
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return values.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return values[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        deviceNvalue = values[row]
    }
    
}
