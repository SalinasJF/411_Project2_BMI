//
//  ViewController.swift
//  Testing
//
//  Created by CampusUser on 2/25/17.
//  Copyright © 2017 JorgeSalinas. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate,
        UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    
    
    //MARK: Properties
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var bmiResult: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //Mark: UITextFieldDelegate
  
    
    
    //MARK: Actions
    @IBAction func computeBMI(_ sender: Any) {
        let userHeight = Double(heightTextField.text!)
        let userWeight = Double(weightTextField.text!)
        var category: String = ""
        let heightInMeters: Double = (userHeight! * 0.025)
        let weightInKilo: Double = (userWeight! * 0.45)
        var calculatedBMI: Double = (weightInKilo / (heightInMeters * heightInMeters))
        calculatedBMI = ((round(100*calculatedBMI))/100)
        
        setphoto(calculatedBMI)
        category = classcategory(calculatedBMI)
        bmiResult.text = category + String(calculatedBMI)
        
    }
    
    //Mark: Custom Functions
    
    func setphoto(_ calculatedBMI: Double){
        if calculatedBMI < 18.5
        {
            photoImageView.image = #imageLiteral(resourceName: "underWeightPhoto")
        }
        else if 18.5 <= calculatedBMI && calculatedBMI < 25{
        photoImageView.image = #imageLiteral(resourceName: "healthyPhoto")
        }
        else{
            photoImageView.image = #imageLiteral(resourceName: "overWeightPhoto")
        }
    
    }
    
    func classcategory(_ calculatedBMI: Double)-> String{
        var category: String
        category = " "
        if calculatedBMI < 16 {
            category = "Severe Thinness "
        }
        else if 16 <= calculatedBMI && calculatedBMI < 17
        {
            category = "Moderate Thinness "
        }
        else if 17 <= calculatedBMI && calculatedBMI < 18.5
        {
            category = "Mild Thinness "
        }
        else if 18.5 <= calculatedBMI && calculatedBMI < 25
        {
            category = "Normal Range "
        }
            
        else if 25 <= calculatedBMI && calculatedBMI < 30
        {
            
            category = "Overweight "
        }
        else if 30 <= calculatedBMI && calculatedBMI < 35
        {
            category = "Obese Class | "
        }
        else if 35 <= calculatedBMI && calculatedBMI < 40
        {
            category = "Obese Class || "
        }
        else if 40 <= calculatedBMI        {
            category = "Obese Class ||| "
        }
        
        return category
        
    }

    
}

