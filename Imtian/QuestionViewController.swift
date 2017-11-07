//
//  QuestionViewController.swift
//  Imtian
//
//  Created by MQ on 22.07.17.
//  Copyright © 2017 MQ. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController, XMLParserDelegate {
    
    var questionsNumber: Int = 10
    var questions: [Question] = []
    var eName: String = String()
    var Name = String()
    var id = String()
    var correctAnswerNumber = Int()
    var choisenAnswerNumber = Int()
    
    var answers: [Answer] = []
    var correctAnswer = String()
    var isImage = String()
    var answer = Answer()
    
    var parser : XMLParser = XMLParser()
    var currentIndex = 0
    
    var choisenTheme = Theme()
    var number:Int = 0
    var mark:Int = 0
    
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
        checkAnswer(variant: nameAnswer1.text!, variantNumber: 1)
    }
    
    @IBAction func buttonAnswer2Taped(_ sender: Any) {
        checkAnswer(variant: nameAnswer2.text!, variantNumber: 2)
    }
    
    @IBAction func buttonAnswer3Taped(_ sender: Any) {
        checkAnswer(variant: nameAnswer3.text!, variantNumber: 3)
    }
    
    @IBAction func buttonAnswer4Taped(_ sender: Any) {
        checkAnswer(variant: nameAnswer4.text!, variantNumber: 4)
    }
    
    @IBAction func buttonQuestionTaped(_ sender: Any) {
        if isLongQuestion == true {
            showMessage(title: "", message: questions[currentIndex].Name.replacingOccurrences(of: "'", with: ""))
        }
    }
    override func viewDidLoad() {
        self.title = choisenTheme.Name
        if let path = Bundle.main.url(forResource: choisenTheme.id, withExtension: "xml") {
            if let parser = XMLParser(contentsOf: path) {
                parser.delegate = self
                parser.parse()
            }
        }
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nameQuestion.layer.masksToBounds = true
        nameQuestion.layer.cornerRadius = nameAnswer1.bounds.height / 4
        
        buttonAnswer1.showsTouchWhenHighlighted = true
        buttonAnswer2.showsTouchWhenHighlighted = true
        buttonAnswer3.showsTouchWhenHighlighted = true
        buttonAnswer4.showsTouchWhenHighlighted = true
        
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
        if(correctAnswerNumber == choisenAnswerNumber) {
            switch (correctAnswerNumber) {
            case 1:
                nameAnswer1.backgroundColor = .green
                break
            case 2:
                nameAnswer2.backgroundColor = .green
                break
            case 3:
                nameAnswer3.backgroundColor = .green
                break
            case 4:
                nameAnswer4.backgroundColor = .green
                break
            default:
                break
            }
        } else {
            switch (choisenAnswerNumber) {
            case 1:
                nameAnswer1.backgroundColor = .red
                break
            case 2:
                nameAnswer2.backgroundColor = .red
                break
            case 3:
                nameAnswer3.backgroundColor = .red
                break
            case 4:
                nameAnswer4.backgroundColor = .red
                break
            default:
                break
            }
            switch (correctAnswerNumber) {
            case 0:
                nameAnswer1.backgroundColor = .green
                break
            case 1:
                nameAnswer2.backgroundColor = .green
                break
            case 2:
                nameAnswer3.backgroundColor = .green
                break
            case 3:
                nameAnswer4.backgroundColor = .green
                break
            default:
                break
            }
        }
        
        /*UIView.animate(withDuration: 0.5) {
            self.nameQuestion.center.x -= self.view.bounds.width
        }
        UIView.animate(withDuration: 0.5) {
            self.imageQuestion.center.x += self.view.bounds.width
        }*/
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
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.7, execute: {
            self.nameAnswer1.backgroundColor = UIColorFromRGB(rgbValue: 0x1589FF)
            self.nameAnswer2.backgroundColor = UIColorFromRGB(rgbValue: 0x1589FF)
            self.nameAnswer3.backgroundColor = UIColorFromRGB(rgbValue: 0x1589FF)
            self.nameAnswer4.backgroundColor = UIColorFromRGB(rgbValue: 0x1589FF)
            self.nextQuestion()
        })
        
    }
    func nextQuestion() {
        if(questions.count != 0 && number < questionsNumber) {
            currentIndex = Int(arc4random_uniform(UInt32(Int32(questions.count))))
            if questions[currentIndex].Name.characters.count > 90 {
                isLongQuestion = true
            } else {
                isLongQuestion = false
            }
            nameQuestion.text = String(number + 1) + ". " + questions[currentIndex].Name.replacingOccurrences(of: "'", with: "")
            nameAnswer1.text = questions[currentIndex].AnswersChoice[0].Item.replacingOccurrences(of: "'", with: "")
            
            nameAnswer2.text = questions[currentIndex].AnswersChoice[1].Item.replacingOccurrences(of: "'", with: "")
            nameAnswer3.text = questions[currentIndex].AnswersChoice[2].Item.replacingOccurrences(of: "'", with: "")
            nameAnswer4.text = questions[currentIndex].AnswersChoice[3].Item.replacingOccurrences(of: "'", with: "")
            setCorrectAnswerNumber(index: currentIndex)
            if(questions[currentIndex].IsImage == "1") {
                let index = choisenTheme.id.index(choisenTheme.id.startIndex, offsetBy: 5)
                imageQuestion.isHidden = false
                imageQuestion.image = UIImage(named: choisenTheme.id.substring(to: index) + questions[currentIndex].id)
            }else {
                imageQuestion.isHidden = true
            }
            number = number + 1
        }else {
            /*showActiveMessage(title: "Результат", message: "Правильно: " + String(mark) + " из " + String(questionsNumber), isNext: false)*/
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let resultViewController = storyBoard.instantiateViewController(withIdentifier: "ResultViewId") as! ResultViewController
            resultViewController.mark = mark
            self.navigationController?.pushViewController(resultViewController, animated: true)
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
    func checkAnswer(variant: String, variantNumber: Int) {
        choisenAnswerNumber = variantNumber
        let correctAnswer = questions[currentIndex].CorrectAnswer.replacingOccurrences(of: "'", with: "")
        questions.remove(at: currentIndex)
        if (variant == correctAnswer) {
            mark = mark + 1
            animationOut()
            if(number + 1 < questionsNumber) {
                animationIn()
            }else {
                //showActiveMessage(title: "Результат", message: "Правильно: " + String(mark) + " из " + String(questionsNumber), isNext: false)
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let resultViewController = storyBoard.instantiateViewController(withIdentifier: "ResultViewId") as! ResultViewController
                resultViewController.mark = mark
                self.navigationController?.pushViewController(resultViewController, animated: true)
                //self.present(resultViewController, animated: true, completion: nil)
            }
        }else {
            animationOut()
            animationIn()
            //showActiveMessage(title: "", message: "Неверно", isNext: true)
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
    func animateAnswerLabel(choisenNumber: Int) {
        // songLabel animate
        //songLabel.animation = "flash"
        //songLabel.repeatCount = 3
        //songLabel.animate()
        
    }
    //for XML
    // 1
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        eName = elementName
        if elementName == "question" {
            Name = String()
            id = String()
            isImage = String()
            answers.removeAll()
            
            correctAnswer = String()
        }
        if elementName == "item" {
            answer = Answer()
        }
    }
    
    // 2
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "question" {
            
            let question = Question()
            question.Name = Name
            question.id = id
            isImage = (isImage as NSString).replacingOccurrences(of: "'", with: "")
            isImage = (isImage as NSString).replacingOccurrences(of: " ", with: "")
            //isImage = (isImage as NSString).replacingOccurrences(of: "\\", with: "")
            question.IsImage = isImage
            question.AnswersChoice = answers
            question.CorrectAnswer = correctAnswer
            
            questions.append(question)
        }
        if elementName == "item" {
            answers.append(answer)
        }
    }
    
    // 3
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        var data = String()
        if string.contains("'") {
            data = string
        }
        else {
            data = string.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        }
        if (!data.isEmpty) {
            if eName == "name" {
                Name += data
            } else if eName == "id" {
                id += data
            }else if eName == "image" {
                isImage += " " + data
            }else if eName == "item" {
                answer.Item += " " + data
            } else if eName == "correctAnswer" {
                correctAnswer += " " + data
            }
        }
    }
    //____________________

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
