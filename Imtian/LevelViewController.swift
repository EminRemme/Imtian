//
//  LevelViewController.swift
//  Imtian
//
//  Created by EY on 22.07.17.
//  Copyright © 2017 EY. All rights reserved.
//

import UIKit

class LevelViewController: UIViewController {
    
    @IBOutlet weak var ChoiseThemeButton: UIButton!
    @IBOutlet weak var RandomThemeButton: UIButton!
    @IBAction func unwindToLevel(segue:UIStoryboardSegue) { }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if(segue.identifier == "showRandomQuestions") {
            let questionViewController = segue.destination as! QuestionViewController
            let theme = Theme()
            theme.Name = "Тренировка"
            theme.id = "AllQuestions"
            questionViewController.choisenTheme = theme
            questionViewController.title = theme.Name
            questionViewController.questionsNumber = 40
            
        }
        if(segue.identifier == "showRandomQuestionsMini") {
            let questionViewController = segue.destination as! QuestionViewController
            let theme = Theme()
            theme.Name = "Тренировка"
            theme.id = "AllQuestions"
            questionViewController.choisenTheme = theme
            questionViewController.title = theme.Name
            questionViewController.questionsNumber = 16
            
        }
        if(segue.identifier == "showTheme") {
            _ = segue.destination as! ThemesViewController
        }
        if(segue.identifier == "showExamQuestions") {
            let questionViewController = segue.destination as! QuestionViewController
            let theme = Theme()
            theme.Name = "Экзамен"
            theme.id = "AllQuestions"
            questionViewController.choisenTheme = theme
            questionViewController.title = theme.Name
            questionViewController.questionsNumber = 40
            questionViewController.isExam = true;
            
        }
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
