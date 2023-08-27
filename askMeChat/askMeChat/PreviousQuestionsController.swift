//
//  PreviousQuestionsController.swift
//  askMeChat
//
//  Created by Nathalia Trazzi on 25/08/23.
//

import Foundation
import UIKit

class PreviousQuestionsController : UIViewController {
    override func viewDidLoad(){
        setUpTextView()
        super.viewDidLoad()

        questionsLabel.text = previousQuestions.joined(separator: "\n")
    }
    
    @IBOutlet weak var questionsLabel: UITextView!
    
    var previousQuestions: [String] = []
    
    func setUpTextView(){
        questionsLabel.layer.cornerRadius = 10
        questionsLabel.clipsToBounds = true
        
    }
    

}
