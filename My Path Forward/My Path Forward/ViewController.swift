//
//  ViewController.swift
//  My Path Forward
//
//  Created by Petshack Dev on 10/13/18.
//  Copyright © 2018 Petshack Dev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var navigationControl: UISegmentedControl!
    
    @IBOutlet weak var pathTableView: UITableView!
    var paths = [Path]()
    var pathsInProgress = [Path]()
    var pathsDone = [Path]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        do {
            let pathJSON = """
            {
                "title": "Example Path",
                "description": "Example Path Description",
                "steps": [
                    {
                        "title": "Example Step 1",
                        "description": "Example Step Description 1",
                        "pointsOfContact": [
                            {
                                "name": "Example Contact",
                                "phoneNumber": "333-333-3333",
                                "whatsApp": "Example WA Link"
                            }
                        ]
                    }
                ],
                "done": true
            }
            """
            let pathJSON2 = """
            {
                "title": "Example Path 2",
                "description": "Example Path 2 Description",
                "steps": [
                    {
                        "title": "Example Step 1",
                        "description": "Example Step Description 1",
                        "pointsOfContact": [
                            {
                                "name": "Example Contact",
                                "phoneNumber": "333-333-3333",
                                "whatsApp": "Example WA Link"
                            }
                        ]
                    }
                ],
                "done": false
            }
            """
            
            let data = pathJSON.data(using: .utf8)
            let pathValue = try JSONDecoder().decode(Path.self, from: data!)
            let data2 = pathJSON2.data(using: .utf8)
            let pathValue2 = try JSONDecoder().decode(Path.self, from: data2!)
            
            paths = [pathValue, pathValue2]
            
            pathsInProgress = paths.filter({ $0.done! })
            pathsDone = paths.filter({ !$0.done! })
        } catch {
            print(error)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        if navigationControl.selectedSegmentIndex == 0 {
            count = pathsInProgress.count
        } else {
            count = pathsDone.count
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = pathTableView.dequeueReusableCell(withIdentifier: "pathCell") as? PathTableViewCell else {
            return UITableViewCell.init()
        }
        
        let viewablePaths = navigationControl.selectedSegmentIndex == 0 ? pathsInProgress : pathsDone
        
        cell.titleLabel.text = viewablePaths[indexPath.row].title
        cell.descriptionLabel.text = viewablePaths[indexPath.row].description
        
        return cell
    }
    
    @IBAction func changeViewablePaths(_ sender: Any) {
        pathTableView.reloadData()
    }
}

