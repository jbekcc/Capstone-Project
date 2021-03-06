//
//  RegistrationViewController.swift
//  Voter Registration
//
//  Created by Jeremy Evers on 3/14/17.
//  Copyright © 2017 Jeremy Evers. All rights reserved.
//

import UIKit
import Foundation

class RegistrationViewController: UIViewController {

    //MARK: Variables
    
    @IBOutlet weak var Citizen_switch: UISwitch!
    @IBOutlet weak var residentSwitch: UISwitch!
    @IBOutlet weak var ageSwitch: UISwitch!
    @IBOutlet weak var firstPageError: UILabel!
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var middleName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var suffix: UITextField!
    @IBOutlet weak var maleSwitch: UISwitch!
    @IBOutlet weak var femaleSwitch: UISwitch!
    
    @IBOutlet weak var addressText: UITextField!
    @IBOutlet weak var stateText: UITextField!
    @IBOutlet weak var zipcodeText: UITextField!
    @IBOutlet weak var sameAddressAsMailSwitch: UISwitch!
    @IBOutlet weak var cityText: UITextField!
    
    
    func checkAddress() -> Bool {
        
        return true
    }
    
    func checkName() -> Bool {
        if(firstName.text!.isEmpty || middleName.text!.isEmpty || lastName.text!.isEmpty || (maleSwitch.isOn && femaleSwitch.isOn) || (!maleSwitch.isOn && !femaleSwitch.isOn))
        {
            return false
        }
        return true
    }
    
    func toNameAndAge() -> Bool {
        if(!Citizen_switch.isOn || !residentSwitch.isOn || !ageSwitch.isOn)
        {
            displayError(errorText: firstPageError, errorMessage: "Must be a citizen, resident, and 18 before election day to register")
            return false;
        }
        return true;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround() 
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    func displayError(errorText: UILabel, errorMessage:String) {
        errorText.text = errorMessage
        NSLog(errorMessage)
        return
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?)-> Bool {
        if identifier == "firstFormToName"
        {
            return toNameAndAge()
        }
        return true
    }
    
    //MARK: Actions

}
