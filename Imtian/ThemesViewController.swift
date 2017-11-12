//
//  LevelViewController.swift
//  Imtian
//
//  Created by EY on 22.07.17.
//  Copyright © 2017 EY. All rights reserved.
//

import UIKit

class ThemesViewController: UIViewController, UIGestureRecognizerDelegate {
    override func viewDidLoad() {
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        let questionViewController = segue.destination as! QuestionViewController
        let theme = Theme()
        switch (segue.identifier) {
        case "RandomTheme"?:
            
            let currentIndex = Int(arc4random_uniform(UInt32(Int32(ThemeStructure.themes.count))))
            theme.Name = ThemeStructure.themes[currentIndex].Name
            theme.id = ThemeStructure.themes[currentIndex].id
            break
        case "literature"?:
            theme.Name = "Литература"
            theme.id = "literature"
            break
        case "history"?:
            theme.Name = "История"
            theme.id = "history"
            break
        case "toponimika"?:
            theme.Name = "Топонимика"
            theme.id = "toponimika"
            break
        case "islam"?:
            theme.Name = "Ислам"
            theme.id = "islam"
            break
        case "kitchen"?:
            theme.Name = "Кухня"
            theme.id = "kitchen"
            break
        case "language"?:
            theme.Name = "Язык"
            theme.id = "language"
            break
        case "music"?:
            theme.Name = "Музыка"
            theme.id = "music"
            break
        case "tradition"?:
            theme.Name = "Традиция"
            theme.id = "tradition"
            break
        case .none:
            theme.Name = "Случайные вопросы"
            theme.id = "AllQuestions"
        case .some(_):
            theme.Name = "Случайные вопросы"
            theme.id = "AllQuestions"
        }
        
        questionViewController.choisenTheme = theme
        questionViewController.title = theme.Name
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     var test = "test"
     }*/
    
    
}


