//
//  ResultViewController.swift
//  TipCal
//
//  Created by Ahmet Enes Irmak on 25.04.2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    //MARK: - Variables
    var percentageOfTip = 10
    var numberOfSplittedCustomer = "2"
    var ResultPerPerson = "0.0"
    
    //MARK: - IBOutlets
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = ResultPerPerson
        settingsLabel.text = "Split between \(numberOfSplittedCustomer) people, with \(percentageOfTip)% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    


}
