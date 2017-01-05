//
//  SettingsViewController.swift
//  tippy
//
//  Created by Moiz Rizvi on 12/30/16.
//  Copyright © 2016 Moiz Rizvi. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipSelector: UISegmentedControl!
    
    @IBOutlet weak var defaultPartySizeSelector: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        defaultTipSelector.selectedSegmentIndex = UserDefaults.standard.integer(forKey: "tipPercentage")
        defaultPartySizeSelector.selectedSegmentIndex = UserDefaults.standard.integer(forKey: "partySize")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func defaultTipSet(_ sender: AnyObject) {
        UserDefaults.standard.set(defaultTipSelector.selectedSegmentIndex, forKey: "tipPercentage")
    }

    @IBAction func defaultPartySizeSet(_ sender: AnyObject) {
        UserDefaults.standard.set(defaultPartySizeSelector.selectedSegmentIndex, forKey: "partySize")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
