//
//  ViewController.swift
//  FirestoreCRUD
//
//  Created by Fahim Rahman on 9/10/20.
//

import UIKit
import FirebaseFirestore

class ViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .darkContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    // create
    @IBAction func createButtonAction(_ sender: UIButton) {
        
        let document = db.collection("Star Wars").document("1")
        
        document.setData([
            
            "id": document.documentID,
            "Grandfather": "Skywaker",
            "Father": "Anakin Skywaker",
            "Son": "Luke Skywaker",
            "Daughter": "Leia Skywaker"
            
        ]) { (error) in
            if let error = error {
                print(error)
            }
            else {
                print("Successfully Created with id \(document.documentID)")
            }
        }
    }
    
    
    
    
    // read
    @IBAction func readButtonAction(_ sender: UIButton) {
        
        // reading all data from a document
        //        db.collection("Star Wars").document("1").getDocument { (document, error) in
        //
        //            if let error = error {
        //                print(error)
        //            }
        //            else {
        //                if document!.exists == true && document != nil {
        //
        //                    print(document!.data()!)
        //                }
        //            }
        //        }
        
        // reading an specific data from a document
        db.collection("Star Wars").document("1").getDocument() { (document, error) in
            if let error = error {
                print(error)
            }
            else {
                if document != nil {
                    print(document?.data()?["Father"] ?? "")
                }
            }
        }
    }
    
    
    
    
    
    // update
    @IBAction func updateButtonAction(_ sender: UIButton) {
        
        let document = db.collection("Star Wars").document("1")
        
        document.setData([
            
            "id": document.documentID,
            "Grandfather": "Skywaker",
            "Father": "Anakin Skywaker",
            "Son": "Luke Skywaker"
            
        ]) { (error) in
            if let error = error {
                print(error)
            }
            else {
                print("Successfully Created with id \(document.documentID)")
            }
        }
    }
    
    
    
    
    // delete
    @IBAction func deleteButtonAction(_ sender: UIButton) {
        
        // delete the whole document
        db.collection("Star Wars").document("1").delete() { (error) in
            
            if let error = error {
                print(error)
            }
            else {
                print("Successfully Deleted")
            }
        }
        
        
        // delete the field inside a document
        //        db.collection("Star Wars").document("1").updateData(["Grandfather": FieldValue.delete()]) { (error) in
        //
        //            if let error = error {
        //                print(error)
        //            }
        //            else {
        //                print("Successfully Deleted")
        //            }
        //        }
    }
}
