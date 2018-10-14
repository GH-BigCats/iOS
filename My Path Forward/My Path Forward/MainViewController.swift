//
//  MainViewController.swift
//  My Path Forward
//
//  Created by Petshack Dev on 10/13/18.
//  Copyright © 2018 Petshack Dev. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    let searchText = "Search"
    let goText = "Ask"
    let seeText = "See what questions people need answered"
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var globalHackImageView: UIImageView!
    @IBOutlet weak var askButton: UIButton!
    @IBOutlet weak var questionsButton: UIButton!
    @IBOutlet weak var askMeLabel: UILabel!
    
    var searchResults = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        globalHackImageView.layer.cornerRadius = globalHackImageView.frame.height / 2
        searchTextField.placeholder = LanguageManager.getTranslation(wordsToTranslate: searchText)
        askButton.setTitle(LanguageManager.getTranslation(wordsToTranslate: goText), for: .normal)
        questionsButton.setTitle(LanguageManager.getTranslation(wordsToTranslate: seeText), for: .normal)
        askMeLabel.text = LanguageManager.getTranslation(wordsToTranslate: "Ask Me A Question")
    }
    
    @IBAction func backToLanding(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
