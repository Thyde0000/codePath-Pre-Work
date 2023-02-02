//
//  ViewController.swift
//  IntroduceStudent
//
//  Created by Erasto Jr Damian on 2/1/23.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    //Allows for changing the background color
    var currentColor:UIColor = UIColor.red
    @IBAction func changeBackground(_ sender: UIButton) {
        if(currentColor == UIColor.red){
            self.view.backgroundColor = UIColor.blue
            currentColor = UIColor.blue
                }
        else if(currentColor == UIColor.blue){
            self.view.backgroundColor = UIColor.green
            currentColor = UIColor.green
        }
        else if(currentColor == UIColor.green){
            self.view.backgroundColor = UIColor.systemPink
            currentColor = UIColor.systemPink
        }
        else if(currentColor == UIColor.systemPink){
            self.view.backgroundColor = UIColor.gray
            currentColor = UIColor.gray
        }
        else{
            self.view.backgroundColor = UIColor.red
            currentColor = UIColor.red
        }
}
    
    @IBOutlet weak var morePetsSwitch: UISwitch!
    @IBOutlet weak var morePetsStepper: UIStepper!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var schoolNameTextField: UITextField!
    @IBAction func introduceButton(_ sender: UIButton) {
        let year = yearSegmentControl.titleForSegment(at: yearSegmentControl.selectedSegmentIndex)
        let introduction = "My name is \(firstNameTextField.text!) \(lastNameTextField.text!) and I attend \(schoolNameTextField.text!). I am currently in my \(year!) year and I own \(numberOfPetsLabel.text!) dogs. It is \(morePetsSwitch.isOn) that I want more pets"
        let alertController = UIAlertController(title: "My Introduction", message: introduction, preferredStyle: .alert)
        let action = UIAlertAction(title: "Nice to met you!", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func increasePets(_ sender: UIStepper) {
        numberOfPetsLabel.text = "\(Int(sender.value))"
    }
    
    @IBOutlet weak var yearSegmentControl: UISegmentedControl!
    @IBOutlet weak var numberOfPetsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = currentColor
        // Do any additional setup after loading the view.
    }
    //Allows to hide keyboard when not on text, so you can actually press the Introduce button without it being hidden
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    
}

