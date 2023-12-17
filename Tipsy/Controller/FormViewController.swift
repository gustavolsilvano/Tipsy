//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var button10: UIButton!
    @IBOutlet weak var button20: UIButton!
    @IBOutlet weak var billTextInput: UITextField!
    
    var buttons: [UIButton] = []
    
    var billSplitBrain = BillSplitBrain()
    
    @IBOutlet weak var splitLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        buttons = [button0, button10, button20]
        //Looks for single or multiple taps.
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
    }
    
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @IBAction func changeSplit(_ sender: UIStepper) {
        splitLabel.text = billSplitBrain.setSplit(sender.value)
    }
    
    @IBAction func changeTip(_ sender: UIButton) {
        billSplitBrain.setTip(sender.tag)
        buttons.forEach{button in button.isSelected = button.tag == sender.tag}
    }
    
    @IBAction func calculateBillSplit(_ sender: Any) {
        if billTextInput.text == nil {return}
        let billDouble = Double(billTextInput.text!.replacingOccurrences(of: ",", with: "."))!
        print(billDouble)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            
        }
    }
}

