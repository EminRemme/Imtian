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
        let htmlAboutStr = "<span style=\"font-size: 10.5; color:white\"><strong>Imtian</strong> - игровое мобильное приложение-викторина, которое охватывает все сферы жизни крымских татар. Вы сможете проверить свои знания по следующим темам:</br><ul><li>литература</li><li>топонимика</li><li>язык</li><li>история</li><li>музыка</li><li>ислам</li><li>традиции</li><li>кухня</li></ul></br>Будут предложены режимы:</br>        <strong>Тренировка</strong> - Вы выбираете тему и отвечаете на 10 вопросов.</br><strong>Блиц-игра</strong> - Отвечаете на 16 вопросов по 8 темам.</br><strong>Игра</strong> - Отвечаете на 40 вопросов по всем темам.</br><strong>Готов на все</strong> - Отвечаете на 40 вопросов по всем темам. Без подсветки ошибок. Только результаты этого режима сохраняются в статистику.</br>Приложение выпущено медиапроектом ZeyTune Production.</br>Разработчик: Эмин Юнусов.</br>Редакторы: Эдип Эмиров, Найле Адбухаирова, Хатидже Усманова, Севиль Юнусова, Эмир Керимов."
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

