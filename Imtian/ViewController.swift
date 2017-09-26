//
//  ViewController.swift
//  Imtian
//
//  Created by Alet on 22.07.17.
//  Copyright © 2017 MQ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    
    @IBOutlet weak var StartButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        //self.StartButton.layer.masksToBounds = true
        //self.StartButton.layer.cornerRadius = self.StartButton.bounds.height / 4
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if(segue.identifier == "showLevel") {
            let detailViewController = segue.destination as! LevelViewController
            
        }
    }*/

}

