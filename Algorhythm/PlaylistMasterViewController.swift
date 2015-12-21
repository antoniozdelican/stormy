//
//  ViewController.swift
//  Algorhythm
//
//  Created by Antonio Zdelican on 03/12/15.
//  Copyright © 2015 Antonio Zdelican. All rights reserved.
//

import UIKit

class PlaylistMasterViewController: UIViewController {
    
    // MARK: Properties
    var playlistsArray: [UIImageView] = []
    
    // Image view is unwraped optional and may or may not be created at this point.
    // That's why we add playlistImageView0 to playlistsArray in viewDidLoad.
    @IBOutlet weak var playlistImageView0: UIImageView!
    @IBOutlet weak var playlistImageView1: UIImageView!
    @IBOutlet weak var playlistImageView2: UIImageView!
    @IBOutlet weak var playlistImageView3: UIImageView!
    @IBOutlet weak var playlistImageView4: UIImageView!
    @IBOutlet weak var playlistImageView5: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playlistsArray += [playlistImageView0, playlistImageView1, playlistImageView2, playlistImageView3, playlistImageView4, playlistImageView5]
        
        for index in 0..<playlistsArray.count {
            // Get the playlist from the struct.
            let playlist = Playlist(index: index)
            // Set the playlistImageView0,1,2... with the playlist.
            let playlistIMageView = playlistsArray[index]
            
            playlistIMageView.image = playlist.icon
            playlistIMageView.backgroundColor = playlist.backgroundColor
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showPlaylistDetailSegue" {
            
            // tap gesture recognizer
            // getting which playlist image view was tapped
            let playlistImageView = sender!.view as! UIImageView
            // optional binding
            if let index = playlistsArray.indexOf(playlistImageView) {
                let playlistDetailController = segue.destinationViewController as! PlaylistDetailViewController
                playlistDetailController.playlist = Playlist(index: index)
            }
            
        }
    }
    
    // All tap gesuture recognizers are connected with this method.
    @IBAction func showPlaylistDetail(sender: AnyObject) {
        performSegueWithIdentifier("showPlaylistDetailSegue", sender: sender)
    }
}

