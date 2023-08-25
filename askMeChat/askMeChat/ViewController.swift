//
//  ViewController.swift
//  askMeChat
//
//  Created by Nathalia Trazzi on 23/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad(){
        super.viewDidLoad()
        //InputUsuarioContainerView - Adicionando borda redonda
        inputUsuario.layer.cornerRadius = 10
        inputUsuario.clipsToBounds = true
        
        //RespostaAssistat - Adicionando borda redonda
        respostaAssistant.layer.cornerRadius = 10
        respostaAssistant.clipsToBounds = true
        
        //buscarResposta - Adicionando borda redonda
        buscarResposta.layer.cornerRadius = 10
        buscarResposta.clipsToBounds = true
    }

    @IBOutlet weak var digiteSuaPergunta: UITextField!
    
    @IBOutlet weak var respostaAssistant: UITextView!
    
    @IBOutlet weak var inputUsuario: UITextView!
    
    @IBOutlet weak var buscarResposta: UIButton!
    
    @IBAction func buscarResposta(_ sender: UIButton) {
        //let apiKey = processInfo.environment["apiKey"]
        let apiKey = ""
        inputUsuario.text = digiteSuaPergunta.text
        guard let question = digiteSuaPergunta.text else {
            return
    }
  

        respostaAssistant.isEditable = false
        respostaAssistant.isScrollEnabled = false

        let url = URL(string: "")!
        var request = URLRequest(url: url)
             request.httpMethod = "POST"
             request.setValue("application/json",
                    forHTTPHeaderField: "Content-Type")
             request.setValue(apiKey, forHTTPHeaderField: "apikey")
             
        let parameters: [String: Any] = [
            "question": question,
            "user_session": [
            "metadata": [
            "user_id": "string"
                     ],
            "system": [
                "session_id": "string"
                     ]
                 ]
             ]
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
             
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
        print("Error:", error.localizedDescription)
                return
                 }
                 
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    if let answer = json?["answer"] as? String {
                        print("Resposta:", answer)
                        DispatchQueue.main.sync {
                            self.respostaAssistant.text = answer
                             }
                         }
                     } catch {
                         print("Error parsing JSON:", error.localizedDescription)
                     }
                 }
             }.resume()
             
             
             digiteSuaPergunta.text = ""
        
         }
     }
