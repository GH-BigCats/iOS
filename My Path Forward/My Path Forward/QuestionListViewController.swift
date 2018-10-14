//
//  QuestionListViewController.swift
//  My Path Forward
//
//  Created by Petshack Dev on 10/13/18.
//  Copyright © 2018 Petshack Dev. All rights reserved.
//

import UIKit

class QuestionListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var questionTableView: UITableView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var searchField: UITextField! {
        didSet {
            searchField.layer.cornerRadius =  5
            searchField.layer.borderColor = UIColor.black.cgColor
            searchField.layer.borderWidth = 1
            let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 22.0, height: 2.0))
            searchField.leftView = leftView
            searchField.leftViewMode = .always
        }
    }
    @IBOutlet weak var questionsLabel: UILabel!
    @IBOutlet weak var sortedByLabel: UILabel!
    @IBOutlet weak var goButton: UIButton!
    
    var questions = [Question]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
        goButton.setTitle(LanguageManager.getTranslation(wordsToTranslate: "Ask"), for: .normal)
        backButton.setTitle(LanguageManager.getTranslation(wordsToTranslate: "Back"), for: .normal)
        searchField.placeholder = LanguageManager.getTranslation(wordsToTranslate: "Ask a question...")
        questionsLabel.text = LanguageManager.getTranslation(wordsToTranslate: "Questions")
        sortedByLabel.text = LanguageManager.getTranslation(wordsToTranslate: "Sorted By")
        
        let q1 = Question(title: "How do I fill out a W2?", numVotes: 3, numAnswers: 0, daysSincePosted: "Posted 2 days ago", tags: "St. Louis, Finance, Government")
        let q2 = Question(title: "Where can I go to find cultural festivals", numVotes: 7, numAnswers: 0, daysSincePosted: "Posted 1 day ago", tags: "St. Louis, Festivals")
        questions.append(q1)
        questions.append(q2)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 145
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = questionTableView.dequeueReusableCell(withIdentifier: "questionCell") as? QuestionTableViewCell else {
            return UITableViewCell.init()
        }
        let question = questions[indexPath.row]
        cell.upvoteCountLabel.text = "\(question.numVotes)"
        cell.answersCountLabel.text = "\(question.numAnswers)"
        cell.postedDaysAgoLabel.text = LanguageManager.getTranslation(wordsToTranslate: question.daysSincePosted)
        cell.questionLabel.text = LanguageManager.getTranslation(wordsToTranslate: question.title)
        cell.tagsHeaderLabel.text = LanguageManager.getTranslation(wordsToTranslate: "Tags")
        cell.tagsLabel.text = LanguageManager.getTranslation(wordsToTranslate: question.tags)
        
        return cell
    }
    
    @IBAction func backToSearch(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let destinationVC = segue.destination as? QuestionDetailViewController {
            let questionIndex = questionTableView.indexPathForSelectedRow!
            let question = questions[questionIndex.row]
            destinationVC.question = question
        }
    }
    

}
