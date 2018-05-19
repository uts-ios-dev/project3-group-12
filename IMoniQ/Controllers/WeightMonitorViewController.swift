//
//  WeightMonitorViewController.swift
//  IMoniQ
//
//  Created by Jane on 15/5/18.
//  Copyright © 2018 Hyojin Lee. All rights reserved.
//

import UIKit
import Charts


class WeightMonitorViewController: UIViewController, UITextFieldDelegate {
    

    @IBOutlet weak var weightInputBox: UITextField!
    @IBOutlet weak var weightChart: LineChartView!
    
    var weights : [Double] = [] //weight datas are stored here
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.weightInputBox.delegate = self

    }
    
    // allows digit input only.
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharaters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharaters.isSuperset(of: characterSet)
    }

    
    /// This is the button trigger
    @IBAction func enterButtonPressed(_ sender: Any) {
        let input  = Double(weightInputBox.text!) //gets input from the weightInputBox
        
        weights.append(input!) // add weights input
        
        updateGraph()
        weightInputBox.text = "" // after submitting reset the box
    }
    
    func updateGraph(){
        //the array that used in line graph
        var lineChartEntry  = [ChartDataEntry]()
        
        //here is the for loop
        for i in 0..<weights.count {
            let value = ChartDataEntry(x: Double(i), y: weights[i]) //set the X and Y status in a data chart entry
            lineChartEntry.append(value)
        }
        
        //convert lineChartEntry to a LineChartDataSet
        let line1 = LineChartDataSet(values: lineChartEntry, label: "Weight")
        line1.colors = [NSUIColor.blue]
        //the object that will be added to the chart
        let data = LineChartData()
        data.addDataSet(line1) //Adds the line to the dataSet
        weightChart.data = data
        weightChart.chartDescription?.text = "Weight Monitor"
    }
}

