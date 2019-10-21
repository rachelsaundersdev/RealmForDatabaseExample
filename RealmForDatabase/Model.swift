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
}
