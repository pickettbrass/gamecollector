//
//  GameViewController.swift
//  GameCollector
//
//  Created by Peter Pickett on 8/23/17.
//  Copyright © 2017 Peter Pickett. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var gameImageView: UIImageView!
    @IBOutlet weak var TitleTextField: UITextField!
   
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imagePicker.delegate = self
    }
    
    
    
    @IBAction func PhotosTapped(_ sender: Any) {
       imagePicker.sourceType = .photoLibrary
       present(imagePicker, animated: true, completion: nil)

    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        gameImageView.image = image
        
        imagePicker.dismiss(animated: true, completion: nil)
    }

    @IBAction func CameraTapped(_ sender: Any) {
    }
  
  
    @IBAction func addTapped(_ sender: Any) {
    }
}
