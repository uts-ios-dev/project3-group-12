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
    
    var weights : [Double] = [] //This is where we are going to store all the numbers. This can be a set of numbers that come from a Realm database, Core data, External API's or where ever else
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.weightInputBox.delegate = self

    }
    
    // allows digit input only.
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharaters = CharacterSet.decimalDigits //digits only
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharaters.isSuperset(of: characterSet)
    }

    
    /// This is the button trigger
    @IBAction func enterButtonPressed(_ sender: Any) {
        let input  = Double(weightInputBox.text!) //gets input from the textbox - expects input as double/int
        
        weights.append(input!) //here we add the data to the array.
        
        updateGraph()
        weightInputBox.text = ""
    }
    
    func updateGraph(){
        var lineChartEntry  = [ChartDataEntry]() //this is the Array that will eventually be displayed on the graph.
        
        //here is the for loop
        for i in 0..<weights.count {
            let value = ChartDataEntry(x: Double(i), y: weights[i]) //set the X and Y status in a data chart entry
            lineChartEntry.append(value)
        }
        
        let line1 = LineChartDataSet(values: lineChartEntry, label: "Weight") //convert lineChartEntry to a LineChartDataSet
        line1.colors = [NSUIColor.blue] //Sets the colour to blue
        let data = LineChartData() //This is the object that will be added to the chart
        data.addDataSet(line1) //Adds the line to the dataSet
        weightChart.data = data
        weightChart.chartDescription?.text = "Weight Monitor"
    }
    
    
    
}

