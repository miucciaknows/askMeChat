//
//  ViewController.swift
//  askMeChat
//
//  Created by Nathalia Trazzi on 23/08/23.
//

import UIKit
import Foundation

class ViewController: UIViewController, UITextFieldDelegate {
    
    var userQuestions: [String] = []
    
    private func setupUI() {
        inputUsuario.layer.cornerRadius = 10
        inputUsuario.clipsToBounds = true
        respostaAssistant.layer.cornerRadius = 10
        respostaAssistant.clipsToBounds = true
        buscarResposta.layer.cornerRadius = 10
        buscarResposta.clipsToBounds = true
        respostaAssistant.isHidden = true
        inputUsuario.isHidden = true
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        digiteSuaPergunta.delegate = self
        
        setupUI()
        setupKeyboardNotifications()
        
        
    }
    
    private func setupKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
            return
        }
        let adjustedContainerFrame = containerView.frame.offsetBy(dx: 0, dy: -keyboardFrame.height + 0.15 * keyboardFrame.height)
        containerView.frame = adjustedContainerFrame
    }
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var previousQuestionsButton: UIButton!
    
    @IBOutlet weak var digiteSuaPergunta: UITextField!
    
    @IBOutlet weak var respostaAssistant: UITextView!
    
    @IBOutlet weak var inputUsuario: UITextView!
    
    @IBOutlet weak var buscarResposta: UIButton!
    
    @IBAction func buscarResposta(_ sender: UIButton) {
        //let apiKey = processInfo.environment["apiKey"]
        guard let question = digiteSuaPergunta.text, !question.isEmpty else {
            return
        }
        
        inputUsuario.text = question
        inputUsuario.isHidden = false
        respostaAssistant.isHidden = false
        respostaAssistant.text = ""
        
        userQuestions.append(question)
        digiteSuaPergunta.text = ""
        
        performRequest(for: question)
    }
    
    
    private func performRequest(for question: String) {
        guard let url = URL(string: "") else {
            print("URL inválida")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("ApiKey aqui", forHTTPHeaderField: "apikey")
        
        let parameters: [String: Any] = [
            "question": question,
            "user_session": [
                "metadata": ["user_id": "string"],
                "system": ["session_id": "string"]
            ]
        ]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
        } catch {
            print("Erro ao serializar JSON:", error)
            return
        }
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Erro na chamada de rede:", error.localizedDescription)
                return
            }
            
            if let data = data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        if let answer = json["answer"] as? String {
                            DispatchQueue.main.async {
                                self.respostaAssistant.text = answer
                            }
                        }
                    }
                } catch {
                    print("Erro no parsing do JSON:", error.localizedDescription)
                }
            }
        }.resume()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PreviousQuestionsSegue", let destination = segue.destination as? PreviousQuestionsController {
            destination.previousQuestions = userQuestions
        }
    }
}
