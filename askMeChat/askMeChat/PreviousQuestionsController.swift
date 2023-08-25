//
//  PreviousQuestionsController.swift
//  askMeChat
//
//  Created by Nathalia Trazzi on 25/08/23.
//

import Foundation
import UIKit

class PreviousQuestionsController : UIViewController {
    
 
    @IBOutlet weak var questionsLabel: UITextView!
    
    var previousQuestions: [String] = []
    
    override func viewDidLoad(){
        super.viewDidLoad()
        questionsLabel.layer.cornerRadius = 10
        questionsLabel.clipsToBounds = true
        
        questionsLabel.text = previousQuestions.joined(separator: "\n")
    
    }
}
