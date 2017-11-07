//
//  ResultViewController.swift
//  Imtian
//
//  Created by VUser on 11/7/17.
//  Copyright © 2017 MQ. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var resultMarkLabel: UILabel!
    var mark:Int = 0
    
    @IBAction func resultOkTapped(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let levelViewController = storyBoard.instantiateViewController(withIdentifier: "LevelViewId") as! LevelViewController
        
        self.navigationController?.pushViewController(levelViewController, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        resultMarkLabel.text = String(mark) + "/10"
        // Do any additional setup after loading the view.
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
