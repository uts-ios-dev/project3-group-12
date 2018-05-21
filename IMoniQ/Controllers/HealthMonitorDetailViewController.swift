//
//  HealthMonitorDetailViewController.swift
//  IMoniQ
//
//  Created by Jane on 15/5/18.
//  Copyright © 2018 Hyojin Lee. All rights reserved.
//

import UIKit
import Charts

class HealthMonitorDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setInitChart()
        
        setDate()
        
        setPain()
        
        setChart(dataPoints: dates, values: painLvl)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setPain() {
        var k = userPainHistory.count - 5
        while k < userPainHistory.count {
            if k > -1 {
                painLvl.append(Double(userPainHistory[k].painLevel))
            }
            k += 1
        }
    }
    
    func setDate() {
        var i = userPainHistory.count - 5
        
        while i < userPainHistory.count {
            if i > -1 {
                let calendar = Calendar.current
                let day = calendar.component(.day, from: userPainHistory[i].date)
                let hour = calendar.component(.hour, from: userPainHistory[i].date)
                let minute = calendar.component(.minute, from: userPainHistory[i].date)
                let month = calendar.component(.month, from: userPainHistory[i].date)
            
                let str = "\(day)/\(month) \(hour):\(minute)"
                dates.append(str)
            }
            i += 1
        }
    }
    
    func setInitChart() {
        barChartView.noDataText = "No data is available"
        //barChartView.leftAxis.drawGridLinesEnabled = false
        barChartView.rightAxis.drawGridLinesEnabled = false
        barChartView.xAxis.drawGridLinesEnabled = false
        barChartView.xAxis.labelPosition = XAxis.LabelPosition.bottom
        barChartView.chartDescription?.enabled = false
        barChartView.legend.enabled = true
        barChartView.rightAxis.enabled = false
        barChartView.leftAxis.drawLabelsEnabled = true
        barChartView.leftAxis.axisMaximum = 6.5
        barChartView.leftAxis.axisMinimum = 1.0
        barChartView.leftAxis.labelCount = 5
    }
    
    func setChart(dataPoints: Array<String>, values: Array<Double>) {
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(x: Double(i), yValues: [values[i]])
            dataEntries.append(dataEntry)
        }
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "Pain Level")
        let chartData = BarChartData(dataSet: chartDataSet)
        barChartView.data = chartData
    }
    
    
    var dates: Array<String> = Array()
    var painLvl: Array<Double> = Array()
    
    @IBOutlet weak var barChartView: BarChartView!
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
