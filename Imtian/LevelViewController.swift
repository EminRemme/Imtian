//
//  LevelViewController.swift
//  Imtian
//
//  Created by EY on 22.07.17.
//  Copyright © 2017 EY. All rights reserved.
//

import UIKit

class LevelViewController: UIViewController {
    
    @IBAction func trainingButtonTapped(_ sender: UIButton) {
        showMessage(title: "Тренировка", message: "Выбирайте одну из восьми тем для тренировки. Вам предстоит ответить на десять вопросов.")
    }
    @IBAction func blitzButtonTapped(_ sender: UIButton) {
        showMessage(title: "Блиц-игра", message: "Быстрая игра. Всего шестнадцать вопросов из всех восьми тем. Правильные и неправильные ответы подсвечиваются")
    }
    
    @IBAction func gameButtonTapped(_ sender: Any) {
        showMessage(title: "Игра", message: "Обычная игра. Сорок вопросов из всех восьми тем. Подсветка правильных и неправильных ответов работает")
    }
    @IBAction func hardButtonTapped(_ sender: UIButton) {
        showMessage(title: "Готов ко всему", message: "Это настоящий экзамен! Нет подсветки правильности ответа. Сорок вопросов из всех тем. Результаты только этого режима сохраняются в статистику. Удачи!")
    }
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
    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "OK",
                                         style: .default) { (action: UIAlertAction!) -> Void in
        }
        
        alert.addAction(cancelAction)
        
        present(alert,
                animated: true,
                completion: nil)
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
