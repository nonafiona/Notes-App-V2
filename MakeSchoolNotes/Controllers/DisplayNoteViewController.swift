//
//  DisplayNoteViewController.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 1/10/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit

class DisplayNoteViewController: UIViewController {
    
    var note: Note?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var noteTitleTextField: UITextField!
    
    @IBOutlet weak var noteContentTextView: UITextView!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let listNotesTableViewController = segue.destination as! ListNotesTableViewController
        // click on cancel or save buttons that segues back to table view cell note view
        if segue.identifier == "Save" {
                
            if let note = note {
                // 2
                note.title = noteTitleTextField.text ?? ""
                note.content = noteContentTextView.text ?? ""
                note.modificationTime = Date()
                
                CoreDataHelper.saveNote()
                // 2
                
            } else {
                let note = Note()
                note.title = noteTitleTextField.text ?? ""
                note.content = noteContentTextView.text ?? ""
                note.modificationTime = Date()

                CoreDataHelper.addNote(note: note)
            }
        }
        
        // click on cell
        if let identifier = segue.identifier {
            // 2
            if identifier == "displayNote" {
                // 3
                print("Transitioning to the Display Note View Controller")
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let note = note {
            noteTitleTextField.text = note.title
            noteContentTextView.text = note.content
        } else {
        // 1
        noteTitleTextField.text = ""
        noteContentTextView.text = ""
        }
        
    }
    
    
    }
    
    

