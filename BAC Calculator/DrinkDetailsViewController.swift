//
//  DrinkDetailsViewController.swift
//  BAC Calculator
//
//  Created by Kailash Chivhe on 21/02/23.
//

import UIKit

class DrinkDetailsViewController: UIViewController {

    
    @IBOutlet weak var drinkSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var ounceTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onCancelClicked(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "unwindDrinkToHome"{
            var drink =  getDrinkData()
            let destinationVCName = segue.destination as! ViewController
            destinationVCName.drinksList.append(drink)
        }
    }
    
    func getDrinkData()->Drink{
        var drink = Drink()
        drink.drinkType = drinkSegmentedControl.description
        var drinkPercentage = 0.0
        switch drinkSegmentedControl.selectedSegmentIndex{
        case 0:
            drinkPercentage = 0.05
        case 1:
            drinkPercentage = 0.07
        case 2:
            drinkPercentage = 0.12
        case 3:
            drinkPercentage = 0.40
        default:
            drinkPercentage = 0.0
        }
        drink.drinkPercentage = drinkPercentage
        drink.drinkConsumption = Double(ounceTextField?.text ?? "0")
        return drink
    }
    
    @IBAction func onSubmitClicked(_ sender: UIButton) {
        if !ounceTextField.hasText{
            showAlert("Please enter quantity")
        }
    }
    
    func showAlert(_ message: String) {
        let alert = UIAlertController(title: "Missing Data", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "clear", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
}
