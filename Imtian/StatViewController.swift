//
//  StatViewController.swift
//  Imtian
//
//  Created by EY on 11/11/17.
//  Copyright © 2017 EY. All rights reserved.
//

import UIKit

class StatViewController: UIViewController {
    @IBOutlet weak var lastMarkLabel: UILabel!
    @IBOutlet weak var bestMarkLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let userDefaults = UserDefaults.standard
        let lastExam = userDefaults.integer(forKey: "LastExam")
        
        // Do any additional setup after loading the view.
        lastMarkLabel.isHidden = true
        super.viewDidLoad()
        lastMarkLabel.text = String(lastExam) + " из " + "40"
        let progressLast = KDCircularProgress(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        progressLast.trackColor = UIColor.white
        progressLast.startAngle = -90
        progressLast.progressThickness = 0.4
        progressLast.trackThickness = 0.6
        progressLast.clockwise = true
        progressLast.gradientRotateSpeed = 2
        progressLast.roundedCorners = false
        progressLast.glowMode = .forward
        progressLast.glowAmount = 0.9
        progressLast.set(colors: UIColorFromRGB(rgbValue: 0x1589FF))
        progressLast.center = CGPoint(x: lastMarkLabel.center.x, y: lastMarkLabel.center.y)
        view.addSubview(progressLast)
        progressLast.animate(fromAngle: 0, toAngle: Double(360 / 40 * lastExam), duration: Double(lastExam) * 0.08) { completed in
            if completed {
                self.lastMarkLabel.isHidden = false
            } else {
                print("animation stopped, was interrupted")
            }
        }
        
        let bestExam = userDefaults.integer(forKey: "BestExam")
        bestMarkLabel.text = String(bestExam) + " из " + "40"
        let progressBest = KDCircularProgress(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        progressBest.trackColor = UIColor.white
        progressBest.startAngle = -90
        progressBest.progressThickness = 0.4
        progressBest.trackThickness = 0.6
        progressBest.clockwise = true
        progressBest.gradientRotateSpeed = 2
        progressBest.roundedCorners = false
        progressBest.glowMode = .forward
        progressBest.glowAmount = 0.9
        progressBest.set(colors: UIColorFromRGB(rgbValue: 0x1589FF))
        progressBest.center = CGPoint(x: bestMarkLabel.center.x, y: bestMarkLabel.center.y)
        view.addSubview(progressBest)
        progressBest.animate(fromAngle: 0, toAngle: Double(360 / 40 * bestExam), duration: Double(bestExam) * 0.08) { completed in
            if completed {
                self.bestMarkLabel.isHidden = false
            } else {
                print("animation stopped, was interrupted")
            }
        }
    }

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
