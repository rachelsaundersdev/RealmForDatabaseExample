//
//  Model.swift
//  RealmForDatabase
//
//  Created by Rachel Saunders on 21/10/2019.
//  Copyright © 2019 Rachel Saunders. All rights reserved.
//

import Foundation
import RealmSwift

class Note: Object {
    @objc dynamic var title = ""
    @objc dynamic var content = ""
    
    let notebook = LinkingObjects(fromType: Notebook.self, property: "notes")
}

class Notebook: Object {
    @objc dynamic var title = ""
       @objc dynamic var creactionDate = Date()
    
    let notes = List<Note>()
}
