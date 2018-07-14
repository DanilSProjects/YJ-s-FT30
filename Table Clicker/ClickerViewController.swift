//
//  ViewController.swift
//  Table Clicker
//
//  Created by Soon Yin Jie on 14/7/18.
//  Copyright © 2018 Tinkercademy. All rights reserved.
//

import UIKit

class ClickerViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    var counter = 0
    var time: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (_) in
            self.time += 0.1
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapped(_ sender: Any) {
        counter += 1
        label.text = "\(counter)"
        
        if counter == 30 {
           UIView.animate(withDuration: 1, animations: {
            self.view.backgroundColor = .cyan
            self.label.text = "DONE!"
           }) { (_) in
            self.performSegue(withIdentifier: "exitClicker", sender: self)
        }
        }
    }
    
}

