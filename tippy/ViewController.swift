//
//  ViewController.swift
//  tippy
//
//  Created by Moiz Rizvi on 12/30/16.
//  Copyright © 2016 Moiz Rizvi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipView: UIView!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipSelector: UISegmentedControl!
    @IBOutlet weak var onePersonLabel: UILabel!
    @IBOutlet weak var twoPeopleLabel: UILabel!
    @IBOutlet weak var threePeopleLabel: UILabel!
    @IBOutlet weak var fourPeopleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.billField.becomeFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tipSelector.selectedSegmentIndex = UserDefaults.standard.integer(forKey: "tipPercentage")
        calculateTip(self)
        updateFonts()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func calculateTip(_ sender: AnyObject) {
        let tipPercent = [0.18, 0.20, 0.25]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercent[tipSelector.selectedSegmentIndex]
        let total = bill + tip
        let onePersonTotal = total / 1
        let twoPeopleTotal = total / 2
        let threePeopleTotal = total / 3
        let fourPeopleTotal = total / 4
        
        
        tipLabel.text = String(format: "$%.2f", tip)
        onePersonLabel.text = String(format: "$%.2f", onePersonTotal)
        twoPeopleLabel.text = String(format: "$%.2f", twoPeopleTotal)
        threePeopleLabel.text = String(format: "$%.2f", threePeopleTotal)
        fourPeopleLabel.text = String(format: "$%.2f", fourPeopleTotal)
        
        if (bill != 0) {
            tipView.isHidden = false
        } else {
            tipView.isHidden = true
        }
        
    }
    
    @IBAction func hideTipView(_ sender: AnyObject) {
        tipView.isHidden = true
    }
    

    func updateFonts()  {
        onePersonLabel.font = UIFont.monospacedDigitSystemFont(ofSize: UIFont.buttonFontSize, weight: UIFont.buttonFontSize)
        onePersonLabel.textColor = UIColor.white
        
        twoPeopleLabel.font = UIFont.monospacedDigitSystemFont(ofSize: UIFont.buttonFontSize, weight: UIFont.buttonFontSize)
        twoPeopleLabel.textColor = UIColor.white
        
        threePeopleLabel.font = UIFont.monospacedDigitSystemFont(ofSize: UIFont.buttonFontSize, weight: UIFont.buttonFontSize)
        threePeopleLabel.textColor = UIColor.white
        
        fourPeopleLabel.font = UIFont.monospacedDigitSystemFont(ofSize: UIFont.buttonFontSize, weight: UIFont.buttonFontSize)
        fourPeopleLabel.textColor = UIColor.white
        
        let selectedPartySize = UserDefaults.standard.integer(forKey: "partySize")
        
        if (selectedPartySize == 0) {
            onePersonLabel.font = UIFont.boldSystemFont(ofSize: 30)
            onePersonLabel.textColor = UIColor.green
        }
        if (selectedPartySize == 1) {
            twoPeopleLabel.font = UIFont.boldSystemFont(ofSize: 30)
            twoPeopleLabel.textColor = UIColor.green
        }
        if (selectedPartySize == 2) {
            threePeopleLabel.font = UIFont.boldSystemFont(ofSize: 30)
            threePeopleLabel.textColor = UIColor.green
        }
        if (selectedPartySize == 3) {
            fourPeopleLabel.font = UIFont.boldSystemFont(ofSize: 30)
            fourPeopleLabel.textColor = UIColor.green
        }
    }
    

}

