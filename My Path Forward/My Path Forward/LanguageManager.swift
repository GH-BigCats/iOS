//
//  LanguageManager.swift
//  My Path Forward
//
//  Created by Petshack Dev on 10/13/18.
//  Copyright © 2018 Petshack Dev. All rights reserved.
//

import Foundation

class LanguageManager {
    
    static var language = "en"
    static var codes : [String:String]?
    static var manager: LanguageManager?
    
    static func setLanguage(language: String) {
        var dict: [String:String] = [:]
        for code in Locale.isoLanguageCodes {
            if let languageName = Locale(identifier: "en_US").localizedString(forLanguageCode: code) {
                dict[languageName] = code
            }
        }
        if let language = dict[language] {
            LanguageManager.language = language
        }
    }
    
    static func getTranslation(wordsToTranslate: String) -> String {
        let translation = wordsToTranslate.replacingOccurrences(of: " ", with: "+")
        do {
            let url = URL(string: "https://a9cdae87.ngrok.io?string=\(translation)&language=\(LanguageManager.language)")
            let data = try Data(contentsOf: url!)
            let string = String(data: data, encoding: String.Encoding.utf8)
            return string!
        } catch {
            print(error)
        }
        return wordsToTranslate
    }
}
