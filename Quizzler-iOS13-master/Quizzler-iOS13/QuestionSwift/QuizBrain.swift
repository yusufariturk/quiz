//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by yusuf ariturk on 1/10/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    let quiz = [
        Question(q: "2 + 2 = 1", a: "True"),
        Question(q: "2 + 2 = 4", a: "False"),
        Question(q: "3 + 2 = 5", a: "True"),
        Question(q: "There is Kurdistan country", a: "True"),
        Question(q: "3 / 3 = 44", a: "True")
    ]
    var questionNumber = 0
    var scoreNumber = 0
    mutating func checkAnswer(answer userAnswer: String) -> Bool{
        print(userAnswer)
        if userAnswer == quiz[questionNumber].answer {
            scoreNumber += 1
           return true
        } else {
            return false
        }
    }
    func getScore() -> Int {
            return scoreNumber
    }
    func getQuestionText() -> String {
        return  quiz[questionNumber].text
    }
    func getProgress() -> Float {
        let progress = Float(questionNumber) / Float(quiz.count)
        return progress
    }
    
    mutating func nextQuestion() {
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
           
            
        } else {
            questionNumber = 0
            scoreNumber = 0
        }
       
       
    }
}
