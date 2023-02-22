//
//  ViewController.swift
//  BAC Calculator
//
//  Created by Kailash Chivhe on 21/02/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var weightTextField: UITextField!
    
    @IBOutlet weak var hoursTextField: UITextField!
    
    @IBOutlet weak var resultTextField: UILabel!
    
    @IBAction func addDrinksClicked(_ sender: Any) {
        if !weightTextField.hasText || !hoursTextField.hasText{
            showAlert("Please enter missing data")
        }
    }
    
    func showAlert(_ message: String) {
        let alert = UIAlertController(title: "Missing Data", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "clear", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    var drinksList = [Drink] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultTextField.isHidden = true
    }


    @IBAction func onCalculateClicked(_ sender: Any) {
        var A: Double = 0.0
        for drink in drinksList{
            A = A + Double((drink.drinkConsumption ?? 0.0) * (drink.drinkPercentage ?? 0.0));
        }
        var gender = 0.68
        if genderSegmentedControl.selectedSegmentIndex == 1{
            gender = 0.55
        }
        var divdend = ( A * 6.24 )
        var divisor1 = ( ( Double(weightTextField?.text ?? "0.0") ?? 0.0) * gender )
        var divisor2 = 0.5 * (Double( hoursTextField?.text ?? "0.0" ) ?? 0.0)
        var result : Double = divdend / (divisor1 - divisor2)
        
        var resultText = "You're Safe!"
        if result <= 0.08{
            resultText = "You're Safe!"
        }
        else if result > 0.08 && result <= 0.20{
            resultText = "Be Careful.."
        }
        else{
            resultText = "Over the limit!"
        }
        resultTextField.text = "Result : \(resultText)"
        resultTextField.isHidden = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    };
    
    @IBAction func unwindToHome(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
        print("Size: Drinks \(drinksList.count)")
    }
    
    @IBAction func onResetClicked(_ sender: Any) {
        drinksList.removeAll()
        weightTextField.text?.removeAll()
        hoursTextField.text?.removeAll()
        resultTextField.isHidden = true
        genderSegmentedControl.selectedSegmentIndex = 0
    }
    
}

