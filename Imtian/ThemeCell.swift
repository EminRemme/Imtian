//
//  ThemeCell.swift
//  Imtian
//
//  Created by VUser on 11/8/17.
//  Copyright © 2017 MQ. All rights reserved.
//

import UIKit

/*class StationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var themeLabel: UILabel!
    @IBOutlet weak var themeResultLabel: UILabel!
    @IBOutlet weak var themeImageView: UIImageView!
    
    //var downloadTask: URLSessionDownloadTask?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // set table selection color
        let selectedView = UIView(frame: CGRect.zero)
        selectedView.backgroundColor = UIColor(red: 78/255, green: 82/255, blue: 93/255, alpha: 0.6)
        selectedBackgroundView  = selectedView
    }
    
    func configureStationCell() {
        
        // Configure the cell...
        stationNameLabel.text = station.stationName
        stationDescLabel.text = station.stationDesc
        
        let imageURL = station.stationImageURL as NSString
        
        if imageURL.contains("http") {
            
            if let url = URL(string: station.stationImageURL) {
                downloadTask = stationImageView.loadImageWithURL(url: url) { (image) in
                    // station image loaded
                }
            }
            
        } else if imageURL != "" {
            stationImageView.image = UIImage(named: imageURL as String)
            
        } else {
            stationImageView.image = UIImage(named: "stationImage")
        }
        
        //stationImageView.applyShadow()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        downloadTask?.cancel()
        downloadTask = nil
        stationNameLabel.text  = nil
        stationDescLabel.text  = nil
        stationImageView.image = nil
    }
}*/

