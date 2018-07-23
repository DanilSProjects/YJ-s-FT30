//
//  ScoreTableViewController.swift
//  Table Clicker
//
//  Created by Soon Yin Jie on 14/7/18.
//  Copyright © 2018 Tinkercademy. All rights reserved.
//

import UIKit

class ScoreTableViewController: UITableViewController {
    
    var timeStamps: [String] = []
    var scores: [Float] = []
    private let SAVED_SCORES_KEY = "savedScores"
    private let SAVED_TIME_STAMP_KEY = "savedTimeStamps"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let loadedScores = UserDefaults.standard.array(forKey: SAVED_SCORES_KEY)
        let loadedTimes = UserDefaults.standard.array(forKey: SAVED_TIME_STAMP_KEY)
        timeStamps = loadedTimes as? [String] ?? [String]()
        scores = loadedScores as? [Float] ?? [Float]()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func clearButton(_ sender: UIBarButtonItem) {
        scores.removeAll()
        timeStamps.removeAll()
        UserDefaults.standard.set(scores, forKey: SAVED_SCORES_KEY)
        UserDefaults.standard.set(timeStamps, forKey: SAVED_TIME_STAMP_KEY)
        tableView.reloadData()
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return scores.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scoreCell", for: indexPath) as! ScoreTableViewCell

        if let label = cell.textLabel {
            label.text = "\(scores[indexPath.row]) seconds"
        }
        
        if let timeLabel = cell.timeStampLabel {
            timeLabel.text = timeStamps[indexPath.row]
        }

        return cell
    }
    
    @IBAction func unwindToScoreTable(segue: UIStoryboardSegue) {
        if segue.identifier == "exitClicker" {
            let source = segue.source as! ClickerViewController
            scores.insert((source.time), at: 0)
            timeStamps.insert(source.timeCompleted, at: 0)
            tableView.reloadData()
            UserDefaults.standard.set(scores, forKey: SAVED_SCORES_KEY)
            UserDefaults.standard.set(timeStamps, forKey: SAVED_TIME_STAMP_KEY)
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            timeStamps.remove(at: indexPath.row)
            scores.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            UserDefaults.standard.set(scores, forKey: SAVED_SCORES_KEY)
            UserDefaults.standard.set(timeStamps, forKey: SAVED_TIME_STAMP_KEY)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
