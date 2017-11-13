//
//  LevelViewController.swift
//  Imtian
//
//  Created by EY on 22.07.17.
//  Copyright © 2017 EY. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var aboutLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let htmlAboutStr = "<span style=\"font-size: 14; color:black; font-family:Arial\"><strong>Imtian</strong> - игровое мобильное приложение-викторина, которое охватывает различные сферы жизни крымских татар</br></br>Вопросы в приложении разделены на такие темы:</br><strong>Литература, топонимика, язык, история, музыка, ислам, традиции, кухня</strong></br></br>Приложение выпущено медиапроектом</br><strong>ZeyTune Production</strong></br></br>Разработчик: <strong>Эмин Юнусов</strong></br></br>Проект-менеджер: <strong>Эмир Керимов</strong></br></br>Редакторы вопросов: <strong>Эдип Эмиров, Найле Адбухаирова, Хатидже Усманова, Севиль Юнусова, Адиле Керимова, Эмир Керимов</strong></br></br>Использованы изображения <strong> Смаила Тантаны</strong></span>"
        let attrStr = try! NSAttributedString(
            data: htmlAboutStr.data(using: String.Encoding.unicode, allowLossyConversion: true)!,
            options: [ .documentType: NSAttributedString.DocumentType.html],
            documentAttributes: nil)
        aboutLabel.attributedText = attrStr
        // Do any additional setup after loading the view.
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

