//
//  QuestionViewController.swift
//  Imtian
//
//  Created by EY on 22.07.17.
//  Copyright © 2017 EY. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController, UIGestureRecognizerDelegate {
    
    var questionsNumber: Int = 10
    var isExam: Bool = false
    var questions: [Question] = []
    var eName: String = String()
    var Name = String()
    var id = String()
    var correctAnswerNumber = Int()
    var choisenAnswerNumber = Int()
    
    var isTapped = Bool()
    var answers: [Answer] = []
    var correctAnswer = String()
    var isImage = String()
    var answer = Answer()
    
    var currentIndex = 0
    
    var choisenTheme = Theme()
    var number:Int = 0
    var mark:Int = 0
    
    var isImageAnimate: Bool = false
    var isLongQuestion = false
    var test = 1
    @IBOutlet weak var nameQuestion: UILabel!
    
    @IBOutlet weak var nameAnswer1: SpringLabel!
    
    @IBOutlet weak var nameAnswer2: SpringLabel!
    
    @IBOutlet weak var nameAnswer3: SpringLabel!
    
    @IBOutlet weak var nameAnswer4: SpringLabel!
    
    @IBOutlet weak var imageQuestion: UIImageView!
    @IBOutlet weak var buttonAnswer1: UIButton!
    @IBOutlet weak var buttonAnswer2: UIButton!
    @IBOutlet weak var buttonAnswer3: UIButton!
    @IBOutlet weak var buttonAnswer4: UIButton!
    @IBAction func buttonAnswer1Taped(_ sender: Any) {
        if isTapped == false {
            checkAnswer(variant: nameAnswer1.text!, variantNumber: 1)
        }
        isTapped = true
    }
    
    @IBAction func buttonAnswer2Taped(_ sender: Any) {
        if isTapped == false {
            checkAnswer(variant: nameAnswer2.text!, variantNumber: 2)
        }
        isTapped = true
    }
    
    @IBAction func buttonAnswer3Taped(_ sender: Any) {
        if isTapped == false {
            checkAnswer(variant: nameAnswer3.text!, variantNumber: 3)
        }
        isTapped = true
    }
    
    @IBAction func buttonAnswer4Taped(_ sender: Any) {
        if isTapped == false {
            checkAnswer(variant: nameAnswer4.text!, variantNumber: 4)
        }
        isTapped = true
    }
    
    @IBAction func buttonQuestionTaped(_ sender: Any) {
        if isLongQuestion == true {
            showMessage(title: "", message: questions[currentIndex].Name.replacingOccurrences(of: "'", with: ""))
        }
    }
    override func viewDidLoad() {
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        isTapped = false
        self.title = choisenTheme.Name
        if choisenTheme.id == "AllQuestions" {
            //Планирование вопросов для Тренировки или Экзамена
            prepareExamQuestions()
        } else {
            for questionsTemp in QuestionsStructure.questionDict[choisenTheme.id]! {
                questions.append(questionsTemp)
            }
        }
        self.nameAnswer1.backgroundColor = UIColorFromRGB(rgbValue: 0x2d4059)
        self.nameAnswer2.backgroundColor = UIColorFromRGB(rgbValue: 0x2d4059)
        self.nameAnswer3.backgroundColor = UIColorFromRGB(rgbValue: 0x2d4059)
        self.nameAnswer4.backgroundColor = UIColorFromRGB(rgbValue: 0x2d4059)
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nameQuestion.layer.masksToBounds = true
        nameQuestion.layer.cornerRadius = nameAnswer1.bounds.height / 4
        
        imageQuestion.layer.masksToBounds = true
        imageQuestion.layer.cornerRadius = nameAnswer1.bounds.height / 4
        nextQuestion()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nameQuestion.center.x  -= view.bounds.width
        
        nameAnswer1.center.x  += view.bounds.width
        nameAnswer2.center.x  += view.bounds.width
        nameAnswer3.center.x  += view.bounds.width
        nameAnswer4.center.x  += view.bounds.width
        
        imageQuestion.center.x  += view.bounds.width
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.5) {
            self.nameQuestion.center.x += self.view.bounds.width
        }
        UIView.animate(withDuration: 0.5) {
            self.imageQuestion.center.x -= self.view.bounds.width
        }
        UIView.animate(withDuration: 0.5, delay: 0.3, options: [],
                       animations: {
                        self.nameAnswer1.center.x -= self.view.bounds.width
        },
                       completion: nil
        )
        UIView.animate(withDuration: 0.5, delay: 0.4, options: [],
                       animations: {
                        self.nameAnswer2.center.x -= self.view.bounds.width
        },
                       completion: nil
        )
        UIView.animate(withDuration: 0.5, delay: 0.5, options: [],
                       animations: {
                        self.nameAnswer3.center.x -= self.view.bounds.width
        },
                       completion: nil
        )
        UIView.animate(withDuration: 0.5, delay: 0.6, options: [],
                       animations: {
                        self.nameAnswer4.center.x -= self.view.bounds.width
        },
                       completion: nil
        )
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func animationOut() {
        if !self.isExam {
            if correctAnswerNumber == choisenAnswerNumber {
                self.lightButtons(color: .green, lightButtonNum: correctAnswerNumber)
            } else {
                self.lightButtons(color: .red, lightButtonNum: choisenAnswerNumber)
                self.lightButtons(color: .green, lightButtonNum: correctAnswerNumber)
            }
        } else {
            self.lightButtons(color: .lightGray, lightButtonNum: choisenAnswerNumber)
        }
        
        UIView.animate(withDuration: 0.5, delay: 1, options: [],
                       animations: {
                        self.imageQuestion.center.x += self.view.bounds.width
        },
                       completion: nil
        )
        UIView.animate(withDuration: 0.5, delay: 1, options: [],
                       animations: {
                        self.nameQuestion.center.x -= self.view.bounds.width
        },
                       completion: nil
        )
        
        UIView.animate(withDuration: 0.5, delay: 1.3, options: [],
                       animations: {
                        self.nameAnswer1.center.x += self.view.bounds.width
        },
                       completion: nil
        )
        UIView.animate(withDuration: 0.5, delay: 1.4, options: [],
                       animations: {
                        self.nameAnswer2.center.x += self.view.bounds.width
        },
                       completion: nil
        )
        UIView.animate(withDuration: 0.5, delay: 1.5, options: [],
            animations: {
                self.nameAnswer3.center.x += self.view.bounds.width
            },
            completion: nil
        )
        UIView.animate(withDuration: 0.5, delay: 1.6, options: [],
                       animations: {
                        self.nameAnswer4.center.x += self.view.bounds.width
        },
                       completion: nil
        )
    }
    func animationIn() {
        
        UIView.animate(withDuration: 0.5, delay: 2, options: [],
                       animations: {
                        self.nameQuestion.center.x += self.view.bounds.width
        },
                       completion: nil
        )
        UIView.animate(withDuration: 0.5, delay: 2, options: [],
                       animations: {
                        
                        self.imageQuestion.center.x -= self.view.bounds.width
        },
                       completion: nil
        )
        UIView.animate(withDuration: 0.5, delay: 2.1, options: [],
                       animations: {
                        self.nameAnswer1.center.x -= self.view.bounds.width
        },
                       completion: nil
        )
        UIView.animate(withDuration: 0.5, delay: 2.2, options: [],
                       animations: {
                        self.nameAnswer2.center.x -= self.view.bounds.width
        },
                       completion: nil
        )
        UIView.animate(withDuration: 0.5, delay: 2.3, options: [],
                       animations: {
                        self.nameAnswer3.center.x -= self.view.bounds.width
        },
                       completion: nil
        )
        UIView.animate(withDuration: 0.5, delay: 2.4, options: [],
                       animations: {
                        self.nameAnswer4.center.x -= self.view.bounds.width
        },
                       completion: nil
        )
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.8, execute: {
            self.nameAnswer1.backgroundColor = UIColorFromRGB(rgbValue: 0x2d4059)
            self.nameAnswer2.backgroundColor = UIColorFromRGB(rgbValue: 0x2d4059)
            self.nameAnswer3.backgroundColor = UIColorFromRGB(rgbValue: 0x2d4059)
            self.nameAnswer4.backgroundColor = UIColorFromRGB(rgbValue: 0x2d4059)
            self.nextQuestion()
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.8, execute: {
            self.isTapped = false
        })
        
    }
    func nextQuestion() {
        number = number + 1
        if(questions.count != 0 && number <= questionsNumber) {
            currentIndex = Int(arc4random_uniform(UInt32(Int32(questions.count))))
            var questionText: String = questions[currentIndex].Name.replacingOccurrences(of: "'", with: "")
            if questionText.length > 90 {
                isLongQuestion = true
                questionText = questionText.prefix(90) + "...ЕЩЕ..."
            } else {
                isLongQuestion = false
            }
            self.title = self.choisenTheme.Name + ": " + String(number)  + " из " + String(self.questionsNumber)
            nameQuestion.text = questionText
            questions[currentIndex].AnswersChoice[0].Item = questions[currentIndex].AnswersChoice[0].Item.replacingOccurrences(of: "'", with: "")
            nameAnswer1.text = questions[currentIndex].AnswersChoice[0].Item.replacingOccurrences(of: "'", with: "")
            questions[currentIndex].AnswersChoice[1].Item = questions[currentIndex].AnswersChoice[1].Item.replacingOccurrences(of: "'", with: "")
            nameAnswer2.text = questions[currentIndex].AnswersChoice[1].Item.replacingOccurrences(of: "'", with: "")
            questions[currentIndex].AnswersChoice[2].Item = questions[currentIndex].AnswersChoice[2].Item.replacingOccurrences(of: "'", with: "")
            nameAnswer3.text = questions[currentIndex].AnswersChoice[2].Item.replacingOccurrences(of: "'", with: "")
            questions[currentIndex].AnswersChoice[3].Item = questions[currentIndex].AnswersChoice[3].Item.replacingOccurrences(of: "'", with: "")
            nameAnswer4.text = questions[currentIndex].AnswersChoice[3].Item.replacingOccurrences(of: "'", with: "")
            questions[currentIndex].CorrectAnswer = questions[currentIndex].CorrectAnswer.replacingOccurrences(of: "'", with: "")
           
            setCorrectAnswerNumber(index: currentIndex)
            if(questions[currentIndex].IsImage == "1") {
                imageQuestion.isHidden = false
                imageQuestion.image = UIImage(named: questions[currentIndex].Theme.prefix(5) + questions[currentIndex].id)
            }else {
                imageQuestion.isHidden = false
                imageQuestion.image = UIImage(named: String(questions[currentIndex].Theme.prefix(5)))
            }
            
        }
    }
    func setCorrectAnswerNumber(index: Int) {
        for i in 0 ... 3 {
            if(questions[currentIndex].CorrectAnswer == questions[currentIndex].AnswersChoice[i].Item) {
                correctAnswerNumber = i + 1
                break
            }
        }
    }
    // 
    func checkAnswer(variant: String, variantNumber: Int) {
        choisenAnswerNumber = variantNumber
        let correctAnswer = questions[currentIndex].CorrectAnswer.replacingOccurrences(of: "'", with: "")
        questions.remove(at: currentIndex)
        animationOut()
        if (variant == correctAnswer) {
            mark = mark + 1
        }
        if(number < questionsNumber) {
            animationIn()
        }else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.8, execute: {
                let userDefaults = UserDefaults.standard
                let bestExam = userDefaults.integer(forKey: "BestExam")
                userDefaults.set(self.mark, forKey: "LastExam")
                if self.mark > bestExam {
                    userDefaults.set(self.mark, forKey: "BestExam")
                }
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let resultViewController = storyBoard.instantiateViewController(withIdentifier: "ResultViewId") as! ResultViewController
                resultViewController.mark = self.mark
                resultViewController.questionCount = self.questionsNumber
                self.navigationController?.pushViewController(resultViewController, animated: true)
            })
        }
    }
    func showActiveMessage(title: String, message: String, isNext: Bool) {
        let alert = UIAlertController(title: "",
                                      message: message,
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK",
                                       style: .default) { (action: UIAlertAction!) -> Void in
                                        if isNext == true {
                                            self.animationOut()
                                            self.animationIn()
                                            
                                        }else {
                                            _ = self.navigationController?.popViewController(animated: false)
                                        }
        }
        
        alert.addAction(okAction)
        present(alert,
                animated: true,
                completion: nil)
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
    func lightButtons(color: UIColor, lightButtonNum: Int) {
        switch (lightButtonNum) {
        case 1:
            nameAnswer1.backgroundColor = color
            break
        case 2:
            nameAnswer2.backgroundColor = color
            break
        case 3:
            nameAnswer3.backgroundColor = color
            break
        case 4:
            nameAnswer4.backgroundColor = color
            break
        default:
            break
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
    func prepareExamQuestions() {
        var tempQuestions: [Question] = [Question]()
        var tempTheme: [String] = [String]()
        for theme in ThemeStructure.themes {
            tempTheme.append(theme.id)
        }
        
        while questions.count < questionsNumber {
            let currentThemeIndex = Int(arc4random_uniform(UInt32(Int32(tempTheme.count))))
            tempQuestions = QuestionsStructure.questionDict[tempTheme[currentThemeIndex]]!
            var questCircle: Int = 2
            if questionsNumber == 40 {
                questCircle = 5
            }
            for _ in 1 ... questCircle {
                let currentIndex = Int(arc4random_uniform(UInt32(Int32(tempQuestions.count))))
                questions.append(tempQuestions[currentIndex])
                tempQuestions.remove(at: currentIndex)
            }
            
            tempTheme.remove(at: currentThemeIndex)
            
        }
        
    }
}
