//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//    TANIMLILAR
    @IBOutlet weak var labelQuestion: UILabel!
    @IBOutlet weak var barPrograsses: UIProgressView!
    @IBOutlet weak var buttonTrue: UIButton!
    @IBOutlet weak var buttonFalse: UIButton!
    @IBOutlet weak var labelScore: UILabel!
    
 
    var quizBrain = QuizBrain()
    
//    AÇILIŞ EKRANI
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        updateUI()
    }

// BUTTON İŞLEMLERİ
    @IBAction func answerButtonCorrect(_ sender: UIButton) {
        let userAnswer = sender.currentTitle! // true, false
       let userGotitRight =  quizBrain.checkAnswer(answer: userAnswer)
        
        if userGotitRight  {
            // buttona bastığında rengi yeşil yapıyor ama yeşil kalıyor.
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
       
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI() {
        labelQuestion.text = quizBrain.getQuestionText()// bakılacak
        barPrograsses.progress = quizBrain.getProgress()
        labelScore.text = "Score : \(quizBrain.getScore())"
        // burada renkleri siliyoruz ve yeni soruda yeniden işleme geçiyoruz.
        buttonTrue.backgroundColor = UIColor.clear
        buttonFalse.backgroundColor = UIColor.clear
        // PrograssBar

    }
    
}

