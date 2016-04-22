//
//  AddContactsVC.swift
//  AddressBook
//
//  Created by Miwand Najafe on 2016-04-21.
//  Copyright © 2016 Miwand Najafe. All rights reserved.
//

import UIKit

protocol writeValueBackDelegate {
    func getAddedContact(person:Person)
}

class AddContactsVC: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var fullNameField:UITextField!
    @IBOutlet weak var emailField:UITextField!
    @IBOutlet weak var cellNumField:UITextField!
    @IBOutlet weak var imgPickerBtn:UIButton!
    @IBOutlet weak var personImg:UIImageView! {
        didSet {
            personImg.roundedView()
        }
    }
    var imgPicker: UIImagePickerController!
    var delegate:writeValueBackDelegate? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        imgPicker = UIImagePickerController()
        imgPicker.delegate = self
    }
    
    @IBAction func imagePickerPressed(sender: UIButton) {
        sender.setTitle("", forState: .Normal)
        presentViewController(imgPicker, animated: true, completion: nil)
    }
    
    @IBAction func doneBtnPressed(sender: AnyObject) {
        
        if let name = fullNameField.text,
            email = emailField.text,
            cellNum = cellNumField.text,
            image = personImg.image  {
            let person = Person(name: name, cellNum: cellNum, image: image, email: email)
            
            if delegate != nil {
                delegate?.getAddedContact(person)
                navigationController?.popViewControllerAnimated(true)
            }
            
        } else {
            let alertControl = UIAlertController(title: "One or more fields missing", message: "Fill out all the fields", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
            alertControl.addAction(okAction)
            self.presentViewController(alertControl, animated: true, completion: nil)
        }
    }
    
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imgPicker.dismissViewControllerAnimated(true) {
            self.personImg.image = image
        }
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        imgPickerBtn.setTitle("Pick an Image", forState: .Normal)
        dismissViewControllerAnimated(true, completion: nil)
    }
}
