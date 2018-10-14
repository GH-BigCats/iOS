//
//  ResourceViewController.swift
//  My Path Forward
//
//  Created by Petshack Dev on 10/13/18.
//  Copyright © 2018 Petshack Dev. All rights reserved.
//

import UIKit
import WebKit

class ResourceViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var videoTitle = "How to fill out a W2"
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var embeddedWebView: WKWebView!
    @IBOutlet weak var videoTitleLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    @IBOutlet weak var replyButton: UIButton!
    @IBOutlet weak var relatedVideosLabel: UILabel!
    @IBOutlet weak var commentTableView: UITableView!
    @IBOutlet weak var backButton: UIButton!
    
    var comments = ["Example Comment 1", "Very, Very Long Comment ........."]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let configuration = WKWebViewConfiguration()
        configuration.allowsInlineMediaPlayback = true
        embeddedWebView = WKWebView(frame: embeddedWebView.frame, configuration: configuration)
        view.addSubview(embeddedWebView)
        embeddedWebView.scrollView.isScrollEnabled = false
        embeddedWebView.scrollView.bounces = false
        embeddedWebView.load(URLRequest(url: URL(string: "https://www.youtube.com/watch?v=c_1DifHtUWA?playsinline=1")!))
        replyButton.setTitle(LanguageManager.getTranslation(wordsToTranslate: "Reply"), for: .normal)
        videoTitleLabel.text = LanguageManager.getTranslation(wordsToTranslate: videoTitle)
        commentsLabel.text = LanguageManager.getTranslation(wordsToTranslate: "Comments")
        relatedVideosLabel.text = LanguageManager.getTranslation(wordsToTranslate: "Related Videos")
        backButton.setTitle(LanguageManager.getTranslation(wordsToTranslate: "Back"), for: .normal)
    }
    
    @IBAction func addComment(_ sender: Any) {
        let comment = commentTextField.text
        comments.append(comment!)
        commentTextField.text = ""
        commentTableView.reloadData()
    }
    @IBAction func backToSearch(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = commentTableView.dequeueReusableCell(withIdentifier: "commentCell") as? CommentTableViewCell else {
            return UITableViewCell.init()
        }
        
        cell.commentLabel.text = comments[indexPath.row]
        
        return cell
    }
    
    @IBAction func back(_ sender: Any) {
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
