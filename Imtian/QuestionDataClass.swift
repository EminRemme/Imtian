//
//  QuestionDataClass.swift
//  Imtian
//
//  Created by EY on 12.08.17.
//  Copyright © 2017 EY. All rights reserved.
//

import Foundation

class Question {
    var Theme: String = String()
    var id: String = String()
    var Name: String = String()
    var AnswersChoice: [Answer] = []
    var CorrectAnswer: String = String()
    var IsImage: String = String()
}

class Answer {
    var Item: String = String()
}
class Theme {
    var id: String = String()
    var Name: String = String()
}

class ThemeStructure {
    static var themes: [Theme] = []
}
class QuestionsStructure {
    static var questionDict: [String: [Question]] = [String: [Question]]()
}
class IsLaunchedBefore {
    static var isWasLaunched: Bool = Bool()
}
