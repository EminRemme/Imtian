//
//  AppDelegate.swift
//  Imtian
//
//  Created by EY on 22.07.17.
//  Copyright © 2017 EY. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, XMLParserDelegate {
    
    var window: UIWindow?
    var eName: String = String()
    var Name = String()
    var questionName = String()
    var id = String()
    var themeId = String()
    var currentTheme = String()
    
    var answers: [Answer] = []
    var correctAnswer = String()
    var isImage = String()
    var answer = Answer()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let userDefaults = UserDefaults.standard
        let isLaunched = userDefaults.bool(forKey: "IsLaunched")
        IsLaunchedBefore.isWasLaunched = isLaunched
        if !IsLaunchedBefore.isWasLaunched {
            userDefaults.set(true, forKey: "IsLaunched")
            IsLaunchedBefore.isWasLaunched = true
            userDefaults.set(0, forKey: "LastExam")
            userDefaults.set(0, forKey: "BestExam")
        }
        //load allQuestions
        var parser : XMLParser = XMLParser()
        
        if let path = Bundle.main.url(forResource: "themes", withExtension: "xml") {
            if let parser = XMLParser(contentsOf: path) {
                parser.delegate = self
                parser.parse()
            }
        }
        for theme in ThemeStructure.themes {
            self.currentTheme = theme.id
            if let path = Bundle.main.url(forResource: theme.id, withExtension: "xml") {
                if let parser = XMLParser(contentsOf: path) {
                    parser.delegate = self
                    parser.parse()
                }
            }
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        //self.saveContext()
    }
    // MARK: - Core Data stack

    // MARK: - Core Data Saving support
    //for XML
    // 1
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        eName = elementName
        if elementName == "theme" {
            Name = String()
            themeId = String()
            
        }
        if elementName == "question" {
            questionName = String()
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
        if elementName == "theme" {
            let theme = Theme()
            theme.Name = Name
            theme.id = themeId
            ThemeStructure.themes.append(theme)
        }
        if elementName == "question" {
            
            let question = Question()
            question.Name = questionName
            question.id = id
            isImage = (isImage as NSString).replacingOccurrences(of: "'", with: "")
            isImage = (isImage as NSString).replacingOccurrences(of: " ", with: "")
            question.IsImage = isImage
            question.AnswersChoice = answers
            question.CorrectAnswer = correctAnswer
            question.Theme = self.currentTheme
            if QuestionsStructure.questionDict[self.currentTheme] == nil {
                QuestionsStructure.questionDict[self.currentTheme] = [Question]()
            }
            QuestionsStructure.questionDict[self.currentTheme]?.append(question)
        }
        if elementName == "item" {
            answers.append(answer)
        }
    }
    
    // 3
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        let data = string.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        
        if (!data.isEmpty) {
            if eName == "id" {
                id += data
            }else if eName == "name" {
                Name += data
            } else if eName == "themeId" {
                themeId += data
            }else if eName == "questionName" {
                questionName += data
            }else if eName == "image" {
                isImage += " " + data
            }else if eName == "item" {
                //answer.Item += " " + data
                answer.Item += data
            } else if eName == "correctAnswer" {
                //correctAnswer += " " + data
                correctAnswer += data
            }
        }
    }
}

