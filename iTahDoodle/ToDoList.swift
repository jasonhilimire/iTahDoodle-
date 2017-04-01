//
//  ToDoList.swift
//  iTahDoodle
//
//  Created by Jason Hilimire on 3/31/17.
//  Copyright © 2017 Peanut Apps. All rights reserved.
//

import UIKit

class ToDoList: NSObject {
    
    private let fileURL: URL = {
        let documentDirectoryURLs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        var documentDirectoryURL = documentDirectoryURLs.first!
        
        return documentDirectoryURL.appendPathComponent("todolist.items")
    }()
    
    fileprivate var items: [String] = []
    
    func add(_ item: String) {
        items.append(item)
    }
}


extension ToDoList: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        let item = items[indexPath.row]
        cell?.textLabel!.text = item
        
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
}
