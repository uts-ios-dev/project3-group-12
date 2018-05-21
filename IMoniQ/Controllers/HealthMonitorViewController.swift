//
//  HealthMonitorViewController.swift
//  IMoniQ
//
//  Created by Jane on 15/5/18.
//  Copyright © 2018 Hyojin Lee. All rights reserved.
//

import UIKit

class HealthMonitorViewController: UIViewController {

    @IBOutlet weak var verticalSlider: UISlider! {
        didSet{
            verticalSlider.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi / 2))
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func verticalSliderChanged(_ sender: UISlider) {
        if(sender.value > 5.5) {
            superSad.transform = CGAffineTransform(scaleX: CGFloat(1.5 - abs(6.0 - sender.value)), y: CGFloat(1.5 - abs(6.0 - sender.value)))
        }
        if(sender.value > 4.5 && sender.value < 5.5) {
            sad.transform = CGAffineTransform(scaleX: CGFloat(1.5 - abs(5.0 - sender.value)), y: CGFloat(1.5 - abs(5.0 - sender.value)))
        }
        if(sender.value > 3.5 && sender.value < 4.5) {
            littleSad.transform = CGAffineTransform(scaleX: CGFloat(1.5 - abs(4.0 - sender.value)), y: CGFloat(1.5 - abs(4.0 - sender.value)))
        }

        if(sender.value > 2.5 && sender.value < 3.5) {
            littleHappy.transform = CGAffineTransform(scaleX: CGFloat(1.5 - abs(3.0 - sender.value)), y: CGFloat(1.5 - abs(3.0 - sender.value)))
        }
        if(sender.value > 1.5 && sender.value < 2.5) {
            happy.transform = CGAffineTransform(scaleX: CGFloat(1.5 - abs(2.0 - sender.value)), y: CGFloat(1.5 - abs(2.0 - sender.value)))
        }

        if(sender.value > 0.5 && sender.value < 1.5) {
            superHappy.transform = CGAffineTransform(scaleX: CGFloat(1.5 - abs(1.0 - sender.value)), y: CGFloat(1.5 - abs(1.0 - sender.value)))
        }

    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        let user = userPain()
        user.updateUserPainHistory(currentPain: verticalSlider.value)
    }
    
    
    @IBOutlet weak var superHappy: UIImageView!
    @IBOutlet weak var superSad: UIImageView!
    @IBOutlet weak var happy: UIImageView!
    @IBOutlet weak var littleHappy: UIImageView!
    @IBOutlet weak var littleSad: UIImageView!
    @IBOutlet weak var sad: UIImageView!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
