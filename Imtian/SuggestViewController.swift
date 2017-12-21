//
//  SuggestViewController.swift
//  Imtian
//
//  Created by Emin on 12/4/17.
//  Copyright © 2017 MQ. All rights reserved.
//

import UIKit

class SuggestViewController: UIViewController {

    @IBOutlet weak var questionTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        questionTextView.resignFirstResponder()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*func offSwitch(number: Int) {
        switch number {
        case 1:
            Variant2Switch.setOn(false, animated: true)
            Variant3Switch.setOn(false, animated: true)
            Variant4Switch.setOn(false, animated: true)
            break;
        case 2:
            Variant1Switch.setOn(false, animated: true)
            Variant3Switch.setOn(false, animated: true)
            Variant4Switch.setOn(false, animated: true)
            break;
        case 3:
            Variant1Switch.setOn(false, animated: true)
            Variant2Switch.setOn(false, animated: true)
            Variant4Switch.setOn(false, animated: true)
            break;
        case 4:
            Variant1Switch.setOn(false, animated: true)
            Variant2Switch.setOn(false, animated: true)
            Variant3Switch.setOn(false, animated: true)
            break;
        default:
            Variant1Switch.setOn(false, animated: true)
            Variant2Switch.setOn(false, animated: true)
            Variant3Switch.setOn(false, animated: true)
            Variant4Switch.setOn(false, animated: true)
        }
    }*/
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        questionTextView.endEditing(true)
        //this.endEditing(true)
    }
}
