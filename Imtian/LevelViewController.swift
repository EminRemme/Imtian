//
//  LevelViewController.swift
//  Imtian
//
//  Created by MQ on 22.07.17.
//  Copyright © 2017 MQ. All rights reserved.
//

import UIKit

class LevelViewController: UIViewController, XMLParserDelegate {
    
    var themes: [Theme] = []
    var eName: String = String()
    var Name = String()
    var id = String()
    
    var parser : XMLParser = XMLParser()
    
    @IBOutlet weak var ChoiseThemeButton: UIButton!
    @IBOutlet weak var RandomThemeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let path = Bundle.main.url(forResource: "themes", withExtension: "xml") {
            if let parser = XMLParser(contentsOf: path) {
                parser.delegate = self
                parser.parse()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if(segue.identifier == "showRandomQuestions") {
            let indexPath = Int(arc4random_uniform(UInt32(Int32(themes.count))))
            let questionViewController = segue.destination as! QuestionViewController
            questionViewController.choisenTheme = themes[indexPath]
            questionViewController.title = themes[indexPath].Name
            
            
        }
        if(segue.identifier == "showTheme") {
            _ = segue.destination as! ThemesTableViewController
        }
    }
    
    //for XML
    // 1
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        eName = elementName
        if elementName == "theme" {
            Name = String()
            id = String()
        }
    }
    
    // 2
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "theme" {
            
            let theme = Theme()
            theme.Name = Name
            theme.id = id
            
            themes.append(theme)
        }
    }
    
    // 3
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        let data = string.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        
        if (!data.isEmpty) {
            if eName == "name" {
                Name += data
            } else if eName == "id" {
                id += data
            }
        }
    }
    
    //____________________

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
