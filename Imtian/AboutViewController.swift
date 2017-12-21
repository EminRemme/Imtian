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
        var fonSize = 14.0
        if UIDevice.current.userInterfaceIdiom == .phone && UIScreen.main.bounds.size.height == 568.0 {
            fonSize = 12
        }
        if UIDevice.current.userInterfaceIdiom == .phone && UIScreen.main.bounds.size.height < 568.0 {
            fonSize = 10
        }
        let htmlAboutStr = "<span style=\"font-size: " + String(fonSize) + "; color:black; font-family:Arial\"><strong>Imtian</strong> - игровое мобильное приложение-викторина, которое охватывает различные сферы жизни крымских татар</br></br>Вопросы в приложении разделены на такие темы:</br><strong>Ислам, литература, топонимика, язык, история, музыка, традиции, кухня</strong></br></br>Приложение выпущено медиапроектом</br><strong>ZeyTune Production</strong></br></br>Разработчик: <strong>Эмин Юнусов</strong></br></br>Проект-менеджер: <strong>Эмир Керимов</strong></br></br>Редакторы вопросов: <strong>Эдип Эмиров, Найле Абдухаирова, Хатидже Усманова, Севиль Юнусова, Адиле Керимова, Эмир Керимов, Нилюфер Черкес</strong></br></br>Использованы изображения <strong> Смаила Тантаны</strong></span>"
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

