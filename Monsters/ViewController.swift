//
//  ViewController.swift
//  Monsters
//
//  Created by mitchell hudson on 4/12/16.
//  Copyright © 2016 mitchell hudson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    
    
    
    // MARK: TableView methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")!
        cell.textLabel?.text = "Hello"
        
        return cell
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        MonsterStore.sharedInstance.testJSON()
        // MonsterStore.sharedInstance.getJSON()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

