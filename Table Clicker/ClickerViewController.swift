//
//  ViewController.swift
//  Table Clicker
//
//  Created by Soon Yin Jie on 14/7/18.
//  Copyright © 2018 Tinkercademy. All rights reserved.
//

import UIKit

class ClickerViewController: UIViewController {

    @IBOutlet var goLabel: UILabel!
    @IBOutlet weak var label: UILabel!
    var counter = 0
    var time: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 1.5, animations: {
            self.goLabel.text = "READY"
            let scaleTrans = CGAffineTransform(scaleX: 0.2, y: 0.2)
            self.goLabel.transform = scaleTrans
            self.goLabel.alpha = 0
        }) { (_) in
            UIView.animate(withDuration: 0.01, animations: {
                self.goLabel.transform = CGAffineTransform.identity
                self.goLabel.alpha = 1
                self.goLabel.text = "SET"
                self.view.backgroundColor = .yellow
            }) {(_) in
                UIView.animate(withDuration: 1.5, animations: {
                    self.goLabel.text = "SET"
                    let scaleTrans = CGAffineTransform(scaleX: 0.2, y: 0.2)
                    self.goLabel.transform = scaleTrans
                    self.goLabel.alpha = 0
                    
                }) {(_) in
                    UIView.animate(withDuration: 0.01, animations: {
                        self.goLabel.transform = CGAffineTransform.identity
                        self.goLabel.alpha = 1
                        self.goLabel.text = "GO!"
                        self.view.backgroundColor = .green
                    }) {(_) in
                        UIView.animate(withDuration: 1.5, animations: {
                            self.goLabel.text = "GO!"
                            let scaleTrans = CGAffineTransform(scaleX: 2, y: 2)
                            self.goLabel.transform = scaleTrans
                            self.goLabel.alpha = 0
                        }) {(_) in
                            self.goLabel.isHidden = true
                            self.label.isHidden = false
                            self.label.text = "0"
                            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (_) in
                                self.time += 0.1
                            }
                            
                        }
    }
    }
    }
    }
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

