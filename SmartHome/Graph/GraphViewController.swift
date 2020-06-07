//
//  GraphViewController.swift
//  SmartHome
//
//  Created by jeff on 2020/06/07.
//  Copyright © 2020 TakHyun Jung. All rights reserved.
//

import UIKit
import Charts
import TinyConstraints

class GraphViewController: UIViewController, ChartViewDelegate {

    var week: [String]! = ["Mon","Tue","Wen","Thur","Fri","Sat","Sun"]
    lazy var lineChartView: LineChartView = {
        let chartView = LineChartView()
        chartView.backgroundColor = .clear
        
        chartView.rightAxis.enabled = false
        
        
        let xAxis = chartView.xAxis
        let yAxis = chartView.leftAxis
        yAxis.labelFont = .boldSystemFont(ofSize: 12)
        yAxis.setLabelCount(6, force: false)
        yAxis.labelTextColor = .black
        yAxis.axisLineColor = .white
        yAxis.labelPosition = .outsideChart
        
        
        xAxis.valueFormatter = IndexAxisValueFormatter(values: week)
        xAxis.labelPosition = .bottom
        xAxis.labelFont = .boldSystemFont(ofSize: 12)
        xAxis.setLabelCount(6, force: false)
        xAxis.axisLineColor = .systemBlue
        xAxis.labelTextColor = .black
        
        // Animate
        chartView.animate(xAxisDuration: 1)
        
        
        return chartView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        view.addSubview(lineChartView)
        lineChartView.centerInSuperview()
        lineChartView.width(to: view)
        lineChartView.heightToWidth(of: view)
        
        setData()
        
    }

    
    func setData() {
        let set1 = LineChartDataSet(entries: yValues, label: "최저기온")
        set1.drawCirclesEnabled = false
        set1.mode = .cubicBezier
        set1.lineWidth = 3
        set1.setColor(.blue)
        
       
        set1.drawHorizontalHighlightIndicatorEnabled = false
        set1.highlightColor = .systemRed
        
        let set2 = LineChartDataSet(entries: yValues2, label: "최고기온")
        set2.drawCirclesEnabled = false
        set2.mode = .cubicBezier
        set2.lineWidth = 3
        set2.setColor(.red)
        
        
        let set :[LineChartDataSet] = [set1,set2]
        
        
        let data = LineChartData(dataSets: set)
        data.setDrawValues(false)

        lineChartView.data = data
    }
    
    
    let yValues: [ChartDataEntry] = [
        ChartDataEntry(x: 0.0, y: 24.0),
        ChartDataEntry(x: 1.0, y: 23.5),
        ChartDataEntry(x: 2.0, y: 24.8),
        ChartDataEntry(x: 3.0, y: 22.2),
        ChartDataEntry(x: 4.0, y: 22.7),
        ChartDataEntry(x: 5.0, y: 25.6),
        ChartDataEntry(x: 6.0, y: 26.2)]
   
    let yValues2: [ChartDataEntry] = [
    ChartDataEntry(x: 0.0, y: 29.0),
    ChartDataEntry(x: 1.0, y: 28.4),
    ChartDataEntry(x: 2.0, y: 28.4),
    ChartDataEntry(x: 3.0, y: 26.2),
    ChartDataEntry(x: 4.0, y: 26.8),
    ChartDataEntry(x: 5.0, y: 30.5),
    ChartDataEntry(x: 6.0, y: 31.0)]
    
}
