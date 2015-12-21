//
//  Playlist.swift
//  Algorhythm
//
//  Created by Antonio Zdelican on 03/12/15.
//  Copyright © 2015 Antonio Zdelican. All rights reserved.
//

import Foundation
import UIKit

struct Playlist {
    
    var title: String?
    var description: String?
    var icon: UIImage?
    var largeIcon: UIImage?
    var artists: [String] = []
    var backgroundColor: UIColor = UIColor.clearColor()
    
    init(index: Int) {
        let musicLibrary = MusicLibrary().library
        let playlistDictionary = musicLibrary[index]
        title = playlistDictionary["title"] as! String?
        description = playlistDictionary["description"] as! String?
        
        let iconName = playlistDictionary["icon"] as! String?
        icon = UIImage(named: iconName!)
        
        let largeIconName = playlistDictionary["largeIcon"] as! String?
        largeIcon = UIImage(named: largeIconName!)
        
        artists += playlistDictionary["artists"] as! [String]
        
        let colorsDitionary = playlistDictionary["backgroundColor"] as! [String: CGFloat]
        backgroundColor = rgbColorFromDictionary(colorsDitionary)
        
    }
    
    func rgbColorFromDictionary(colorDictionary: [String: CGFloat]) -> UIColor {
        let red = colorDictionary["red"]!
        let green = colorDictionary["green"]!
        let blue = colorDictionary["blue"]!
        let alpha = colorDictionary["alpha"]!
        
        // alpha value in MusicLibrary is already in .0 notation
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    }
}