//
//  ViewController.swift
//  My Path Forward
//
//  Created by Petshack Dev on 10/13/18.
//  Copyright © 2018 Petshack Dev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var languagePicker: UIPickerView!
    
    var languages = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for code in Locale.isoLanguageCodes {
            if let language = Locale(identifier: "en_us").localizedString(forLanguageCode: code) {
                languages.append(language)
            }
        }
        languages = languages.sorted()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return languages.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return languages[row]
    }
    
    @IBAction func confirmLanguage(_ sender: Any) {
        let language = languages[languagePicker.selectedRow(inComponent: 0)]
        LanguageManager.setLanguage(language: language)
    }
}

