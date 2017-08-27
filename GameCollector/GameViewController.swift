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
   
    @IBOutlet weak var addupdatebutton: UIButton!
    @IBOutlet weak var deletebutton: UIButton!
    
    var imagePicker = UIImagePickerController()
    var game : Game? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imagePicker.delegate = self
        
        if game != nil {
           print("We have a game")
           TitleTextField.text = game?.title
            gameImageView.image = UIImage(data: game!.image as! Data)
            
            addupdatebutton.setTitle("Update", for: .normal)
        } else {
            deletebutton.isHidden = true
        }
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
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
        
    }
  
    @IBAction func deleteTapped(_ sender: Any) {
    }
  
    @IBAction func addTapped(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let game = Game(context: context)
        game.title = TitleTextField.text!
        game.image = (UIImagePNGRepresentation(gameImageView.image!)) as NSData?
        
       (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
        
    }
}
