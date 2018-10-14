//
//  QuestionDetailViewController.swift
//  My Path Forward
//
//  Created by Petshack Dev on 10/14/18.
//  Copyright © 2018 Petshack Dev. All rights reserved.
//

import UIKit

class QuestionDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var noAnswersLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var commentsLabel: UILabel!
    @IBOutlet weak var commentTableView: UITableView!
    
    var comments = [Comment]()
    var question: Question?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        questionLabel.text = LanguageManager.getTranslation(wordsToTranslate: question!.title)
        tagLabel.text = LanguageManager.getTranslation(wordsToTranslate: question!.tags)
        noAnswersLabel.text = LanguageManager.getTranslation(wordsToTranslate: "No one has answered this question yet")
        commentsLabel.text = LanguageManager.getTranslation(wordsToTranslate: "Comments")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = commentTableView.dequeueReusableCell(withIdentifier: "commentCell") as? UnansweredQuestionTableViewCell else {
            return UITableViewCell.init()
        }
        
        let comment = comments[indexPath.row]
        
        cell.upvoteCountLabel.text = "\(comment.upvoteCount)"
        cell.nameLabel.text = comment.name
        cell.timeOfPost.text = LanguageManager.getTranslation(wordsToTranslate: comment.timeOfPost)
        cell.commentLabel.text = LanguageManager.getTranslation(wordsToTranslate: comment.comment)
        
        return cell
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
