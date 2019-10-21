//
//  AppDelegate.swift
//  RealmForDatabase
//
//  Created by Rachel Saunders on 21/10/2019.
//  Copyright © 2019 Rachel Saunders. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let realm = try! Realm()
        
//        let myFirstNote = Note()
//        myFirstNote.title = "My First Note"
//        myFirstNote.content = "This is my first note."
//
//        do {
//            try realm.write {
//                       realm.add(myFirstNote)
//                   }
//        }catch{
//            print(error.localizedDescription)
//        }
        
        let lastTwoNotes = realm.objects(Note.self).filter("title CONTAINS '1.'")
        
        try! realm.write {
            realm.delete(lastTwoNotes)
        }
        
        print(realm.objects(Note.self))

        let allMyNotes = realm.objects(Note.self)
        
        let filteredNotes = allMyNotes.filter("title CONTAINS '1.'")
        
        let moreComplexFilter = NSPredicate(format: "title CONTAINS %@ AND content CONTAINS %@", "My", "note")

        let results = allMyNotes.filter(moreComplexFilter)


        print(filteredNotes)
        
//        if let firstNote = allMyNotes.first {
//            try! realm.write {
//                firstNote.title = "My 1.Note"
//            }
//        }
//
//        for note in allMyNotes {
//            print("Note title: \(note.title)" + "\n")
//        }
//
        return true
        
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

