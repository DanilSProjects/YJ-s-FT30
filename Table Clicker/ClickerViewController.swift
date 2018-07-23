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
    var isAnimationOver = false
    
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
        timer?.invalidate()
        startButton.isHidden = false
        isAnimationOver = false
    }
    
    
    
    @IBAction func startPressed(_ sender: Any) {
        counter = 0
        time = 0
        startButton.isHidden = true
    // Ready set go
        let animator = UIViewPropertyAnimator(duration: 1.5, curve: .linear, animations: {
            self.goLabel.text = "READY"
            self.view.backgroundColor = .red
            self.goLabel.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
            self.goLabel.alpha = 0
        })
        animator.addCompletion{(_) in
            self.goLabel.transform = CGAffineTransform.identity
            self.goLabel.alpha = 1
            self.goLabel.text = "SET"
            self.view.backgroundColor = .yellow
            let secondAnimator = UIViewPropertyAnimator(duration: 1.5, curve: .linear, animations : {
                self.goLabel.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
                self.goLabel.alpha = 0
                
            })
            secondAnimator.addCompletion{(_) in
                self.goLabel.transform = CGAffineTransform.identity
                self.goLabel.alpha = 1
                self.goLabel.text = "GO!"
                self.view.backgroundColor = .green
                let thirdAnimator = UIViewPropertyAnimator(duration: 1.5, curve: .linear, animations : {
                    self.goLabel.transform = CGAffineTransform(scaleX: 2, y: 2)
                    self.goLabel.alpha = 0
                    
                })
                thirdAnimator.addCompletion{(_) in
                    self.goLabel.alpha = 1
                    self.goLabel.transform = CGAffineTransform.identity
                    self.goLabel.isHidden = true
                    self.label.isHidden = false
                    self.label.text = "0"
                    self.isAnimationOver = true
                    self.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (_) in
                        self.time += 0.1
                    }
                }
                thirdAnimator.startAnimation()
            }
            secondAnimator.startAnimation()
        }
        
        animator.startAnimation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapped(_ sender: Any) {
        if isAnimationOver == true {
        counter += 1
        label.text = "\(counter)"
        } else if isAnimationOver == false {
            print ("Sorry sir, restricted area.")
        }
        
        if counter == 30 {
           UIView.animate(withDuration: 0.5, animations: {
            self.timer?.invalidate()
            self.view.backgroundColor = .cyan
            self.label.text = "\(self.time)"
            // Label goes up
            let labelTransform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.label.transform = labelTransform
           }) { (_) in
            UIView.animate(withDuration: 0.5, animations: {
                // Label goes back down
                self.label.transform = CGAffineTransform.identity
            }) {(_) in
            self.performSegue(withIdentifier: "exitClicker", sender: self)
            }
        }
        }
    }
    
}

