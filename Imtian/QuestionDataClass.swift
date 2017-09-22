//
//  QuestionDataClass.swift
//  Imtian
//
//  Created by Alet on 12.08.17.
//  Copyright © 2017 MQ. All rights reserved.
//

import Foundation

class Question {
    var id: String = String()
    var Name: String = String()
    var AnswersChoice: [Answer] = []
    var CorrectAnswer: String = String()
    var IsImage: String = String()
}

class Answer {
    var Item: String = String()
}
