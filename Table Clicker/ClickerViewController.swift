//
//  ViewController.swift
//  Table Clicker
//
//  Created by Soon Yin Jie on 14/7/18.
//  Copyright © 2018 Tinkercademy. All rights reserved.
//

import UIKit

class ClickerViewController: UIViewController {

    @IBOutlet var startButton: UIButton!
    @IBOutlet var goLabel: UILabel!
    @IBOutlet weak var label: UILabel!
    var counter = 0
    var time: Float = 0
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewLoadSetup()
    }
    
    func viewLoadSetup() {
        goLabel.text = ""
        label.isHidden = true
        goLabel.isHidden = false
        view.backgroundColor = .red
        counter = 0
        time = 0
        startButton.isHidden = false
 
    }
    
    
    
    @IBAction func startPressed(_ sender: Any) {
        counter = 0
        time = 0
        startButton.isHidden = true
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
                            self.goLabel.alpha = 1
                            self.goLabel.transform = CGAffineTransform.identity
                            self.goLabel.isHidden = true
                            self.label.isHidden = false
                            self.label.text = "0"
                            self.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (_) in
                                self.time += 0.1
                                print (self.time)
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
            self.timer?.invalidate()
            self.view.backgroundColor = .cyan
            self.label.text = "\(self.time)"
            let labelTransform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.label.transform = labelTransform
           }) { (_) in
            self.performSegue(withIdentifier: "exitClicker", sender: self)
        }
        }
    }
    
}

