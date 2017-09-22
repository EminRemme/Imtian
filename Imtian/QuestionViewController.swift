//
//  QuestionViewController.swift
//  Imtian
//
//  Created by Alet on 22.07.17.
//  Copyright © 2017 MQ. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController, XMLParserDelegate {
    
    var questions: [Question] = []
    var eName: String = String()
    var Name = String()
    var id = String()
    
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
    
    @IBOutlet weak var nameAnswer1: UILabel!
    
    @IBOutlet weak var nameAnswer2: UILabel!
    
    @IBOutlet weak var nameAnswer3: UILabel!
    
    @IBOutlet weak var nameAnswer4: UILabel!
    
    @IBOutlet weak var imageQuestion: UIImageView!
    @IBOutlet weak var buttonAnswer1: UIButton!
    @IBOutlet weak var buttonAnswer2: UIButton!
    @IBOutlet weak var buttonAnswer3: UIButton!
    @IBOutlet weak var buttonAnswer4: UIButton!
    @IBAction func buttonAnswer1Taped(_ sender: Any) {
        checkAnswer(variant: nameAnswer1.text!)
    }
    
    @IBAction func buttonAnswer2Taped(_ sender: Any) {
        checkAnswer(variant: nameAnswer2.text!)
    }
    
    @IBAction func buttonAnswer3Taped(_ sender: Any) {
        checkAnswer(variant: nameAnswer3.text!)
    }
    
    @IBAction func buttonAnswer4Taped(_ sender: Any) {
        checkAnswer(variant: nameAnswer4.text!)
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
        nameAnswer1.layer.masksToBounds = true
        nameAnswer1.layer.cornerRadius = nameAnswer1.bounds.height / 4
        nameAnswer2.layer.masksToBounds = true
        nameAnswer2.layer.cornerRadius = nameAnswer2.bounds.height / 4
        nameAnswer3.layer.masksToBounds = true
        nameAnswer3.layer.cornerRadius = nameAnswer3.bounds.height / 4
        nameAnswer4.layer.masksToBounds = true
        nameAnswer4.layer.cornerRadius = nameAnswer4.bounds.height / 4
        
        buttonAnswer1.showsTouchWhenHighlighted = true
        buttonAnswer2.showsTouchWhenHighlighted = true
        buttonAnswer3.showsTouchWhenHighlighted = true
        buttonAnswer4.showsTouchWhenHighlighted = true
        
        imageQuestion.layer.masksToBounds = true
        imageQuestion.layer.cornerRadius = nameAnswer1.bounds.height / 4
        nextQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func nextQuestion() {
        if(questions.count != 0 && number <= 10) {
            currentIndex = Int(arc4random_uniform(UInt32(Int32(questions.count))))
            if questions[currentIndex].Name.characters.count > 90 {
                isLongQuestion = true
                
            } else {
                isLongQuestion = false
                
            }
            nameQuestion.text = questions[currentIndex].Name.replacingOccurrences(of: "'", with: "")
            nameAnswer1.text = questions[currentIndex].AnswersChoice[0].Item.replacingOccurrences(of: "'", with: "")
            nameAnswer2.text = questions[currentIndex].AnswersChoice[1].Item.replacingOccurrences(of: "'", with: "")
            nameAnswer3.text = questions[currentIndex].AnswersChoice[2].Item.replacingOccurrences(of: "'", with: "")
            nameAnswer4.text = questions[currentIndex].AnswersChoice[3].Item.replacingOccurrences(of: "'", with: "")
            if(questions[currentIndex].IsImage == "1") {
                let index = choisenTheme.id.index(choisenTheme.id.startIndex, offsetBy: 5)
                imageQuestion.isHidden = false
                imageQuestion.image = UIImage(named: choisenTheme.id.substring(to: index) + questions[currentIndex].id)
            }else {
                imageQuestion.isHidden = true
            }
            number = number + 1
        }else {
            showActiveMessage(title: "Результат", message: "Правильно: " + String(mark) + " из 10", isNext: false)
        }
    }
    
    func checkAnswer(variant: String) {
        let correctAnswer = questions[currentIndex].CorrectAnswer.replacingOccurrences(of: "'", with: "")
        questions.remove(at: currentIndex)
        if variant == correctAnswer {
            mark = mark + 1
            nextQuestion()
        }else {
            showActiveMessage(title: "", message: "Неверно", isNext: true)
        }
    }
    func showActiveMessage(title: String, message: String, isNext: Bool) {
        let alert = UIAlertController(title: "",
                                      message: message,
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK",
                                       style: .default) { (action: UIAlertAction!) -> Void in
                                        if isNext == true {
                                            self.nextQuestion()
                                        }else {
                                            let viewControllerYouWantToPresent = self.storyboard!.instantiateViewController(withIdentifier: "LevelViewId")
                                            self.show(viewControllerYouWantToPresent, sender: self)
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
