//
//  ViewController.swift
//  GetFolderAccessMacOS
//
//  Created by Siddhesh Mhatre on 21/12/17.
//  Copyright © 2017 Siddhesh Mhatre. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var pathLabel: NSTextField!
    var bookmarks = [URL: Data]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialize()
    }
    
    func initialize() {
        loadBookmarks()
        let path = getBookmarkPath()
        bookmarks = NSKeyedUnarchiver.unarchiveObject(withFile: path) as! [URL: Data]
        
        var paths : String = ""
        
        for bookmark in bookmarks
        {
            paths = "\(bookmark.key)\n"
        }
        self.pathLabel.stringValue = paths

    }

    @IBAction func selectFolderBtnAction(_ sender: Any) {
        
        let selectedURL = openFolderSelection()
        saveBookmarksData()
       
    }
    
}

