//
//  CoreDataHelper.swift
//  MakeSchoolNotes
//
//  Created by Fiona Carty on 10/14/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataHelper {
    
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static let persistentContainer = appDelegate.persistentContainer
    static let managedContext = persistentContainer.viewContext    // add note
    
    // the first two functions: addNote & saveNote -- are pretty much identical
    
    // addNote
    static func addNote(note: Note) {
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save \(error)")
        }
        print("Saved!");
    }
    
    // saveNote
    static func saveNote() {
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save \(error)")
        }
    }
    
    // delete note
    static func delete(note: Note) {
        managedContext.delete(note)
        saveNote()
    }
    
    // save note 
    static func retrieveNotes() -> [Note]{
        let fetchRequest = NSFetchRequest<Note>(entityName: "Note")
        do {
            let results = try managedContext.fetch(fetchRequest)
            return results
        } catch let error as NSError {
            print("Could not fetch \(error)")
        }
        return []
    }
}
