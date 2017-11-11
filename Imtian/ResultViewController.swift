//
//  ResultViewController.swift
//  Imtian
//
//  Created by EY on 11/7/17.
//  Copyright © 2017 EY. All rights reserved.
//
////
import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var resultMarkLabel: UILabel!
    var mark:Int = 0
    var questionCount:Int = 0
    
    override func viewDidLoad() {
        self.navigationItem.setHidesBackButton(true, animated:true);
        resultMarkLabel.isHidden = true
        super.viewDidLoad()
        resultMarkLabel.text = String(mark) + " из " + String(questionCount)
        let progress = KDCircularProgress(frame: CGRect(x: 0, y: 0, width: 250, height: 250))
        progress.trackColor = UIColor.white
        progress.startAngle = -90
        progress.progressThickness = 0.4
        progress.trackThickness = 0.6
        progress.clockwise = true
        progress.gradientRotateSpeed = 2
        progress.roundedCorners = false
        progress.glowMode = .forward
        progress.glowAmount = 0.9
        progress.set(colors: UIColorFromRGB(rgbValue: 0x1589FF))
        progress.center = CGPoint(x: view.center.x, y: view.center.y + 25)
        view.addSubview(progress)
        progress.animate(fromAngle: 0, toAngle: Double(360 / questionCount * mark), duration: Double(mark) * 0.08) { completed in
            if completed {
                self.resultMarkLabel.isHidden = false
            } else {
                print("animation stopped, was interrupted")
            }
        }
        // Do any additional setup after loading the view.
    }
 //
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
