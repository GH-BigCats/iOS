//
//  QuestionDetailViewController.swift
//  My Path Forward
//
//  Created by Petshack Dev on 10/14/18.
//  Copyright © 2018 Petshack Dev. All rights reserved.
//

import UIKit

class QuestionDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var noAnswersLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var commentsLabel: UILabel!
    @IBOutlet weak var commentTableView: UITableView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var tagHeaderLabel: UILabel!
    
    var comments = [Comment]()
    var question: Question?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let comment1 = Comment(upvoteCount: 10, name: "Nelson", timeOfPost: "8-13-18", comment: "You might try to connect with the International Institute")
        let comment2 = Comment(upvoteCount: 4, name: "Hope", timeOfPost: "8-12-18", comment: "Check out the Mosaic Project")
        
        comments.append(comment1)
        comments.append(comment2)
        commentTableView.reloadData()
        
        // Do any additional setup after loading the view.
        questionLabel.text = LanguageManager.getTranslation(wordsToTranslate: question!.title)
        tagHeaderLabel.text = LanguageManager.getTranslation(wordsToTranslate: "Tags")
        tagLabel.text = LanguageManager.getTranslation(wordsToTranslate: question!.tags)
        noAnswersLabel.text = LanguageManager.getTranslation(wordsToTranslate: "No one has answered this question yet")
        commentsLabel.text = LanguageManager.getTranslation(wordsToTranslate: "Comments")
        backButton.setTitle(LanguageManager.getTranslation(wordsToTranslate: "Back"), for: .normal)
        commentButton.setTitle(LanguageManager.getTranslation(wordsToTranslate: "Comment"), for: .normal)
        recordButton.setTitle(LanguageManager.getTranslation(wordsToTranslate: "Record your response"), for: .normal)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = commentTableView.dequeueReusableCell(withIdentifier: "unansweredQuestionCommentCell") as? UnansweredQuestionTableViewCell else {
            return UITableViewCell.init()
        }
        
        let comment = comments[indexPath.row]
        
        cell.upvoteCountLabel.text = "\(comment.upvoteCount)"
        cell.nameLabel.text = comment.name
        cell.timeOfPost.text = LanguageManager.getTranslation(wordsToTranslate: comment.timeOfPost)
        cell.commentLabel.text = LanguageManager.getTranslation(wordsToTranslate: comment.comment)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    @IBAction func backToQuestionList(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addComment(_ sender: Any) {
        let comment = Comment(upvoteCount: 1, name: "Anon", timeOfPost: "08-14-2018", comment: commentTextField.text!)
        commentTextField.text = ""
        comments.append(comment)
        commentTableView.reloadData()
    }
    
    @IBAction func record(_ sender: Any) {
        debugPrint("blah")
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .camera
            self.present(imagePicker, animated: true, completion: nil)
        }
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
