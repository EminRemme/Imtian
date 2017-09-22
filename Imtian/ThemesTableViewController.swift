//
//  ThemesTableViewController.swift
//  Imtian
//
//  Created by Alet on 22.07.17.
//  Copyright © 2017 MQ. All rights reserved.
//

import UIKit
class Theme {
    var id: String = String()
    var Name: String = String()
}
class ThemesTableViewController: UITableViewController, XMLParserDelegate {
    
    var themes: [Theme] = []
    var eName: String = String()
    var Name = String()
    var id = String()
    
    var parser : XMLParser = XMLParser()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
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

    // MARK: - Table view data source
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        //return themes.count
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return themes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "themeCell", for: indexPath as IndexPath)
        
        let theme = themes[indexPath.row]
        cell.textLabel?.text = theme.Name
        return cell
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
    
    override func prepare(for segue: UIStoryboardSegue, sender:Any!) {
        if segue.identifier == "showThemeQuestions" {
            var indexPath = tableView.indexPathForSelectedRow
            let destViewController:QuestionViewController! = segue.destination as! QuestionViewController
            destViewController.choisenTheme = themes[(indexPath?.row)!]
            destViewController.title = themes[indexPath!.row].Name
            
        }
    }
 
    

}
