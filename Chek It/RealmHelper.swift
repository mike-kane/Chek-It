//
//  RealmHelper.swift
//  Chek It
//
//  Created by Mike Kane on 7/19/16.
//  Copyright © 2016 Mike Kane. All rights reserved.
//

import Foundation
import RealmSwift

class RealmHelper {
    
    static func objects<T: Object>(_ type: T.Type) -> Results<T>? {
        
        let realm = try? Realm()
        
        return realm?.objects(type)
    }
}

extension Object {
    
    func add() {
        let realm = try? Realm()
        try! realm?.write {
            realm?.add(self)
        }
    }
    
    func update(_ updateBlock: () -> ()) {
        let realm = try? Realm()
        try! realm?.write(updateBlock)
    }
    
    func delete() {
        let realm = try? Realm()
        try! realm?.write {
            realm?.delete(self)
        }
    }
    
}
