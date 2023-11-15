//
//  ViewController.swift
//  SimpsonBook
//
//  Created by Chandan Kumar Dash on 15/11/23.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var mySimpson = [Simpson]()
    var chosenSimpson: Simpson?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        //Simpson Object
        
        let homer = Simpson(SimpsonName: "Homer Simpson", SimpsonJob: "Nuclear Safety", SimpsonImage: UIImage(named: "homer")!)
        
        let marge = Simpson(SimpsonName: "Marge Simpson", SimpsonJob: "House Wife", SimpsonImage: UIImage(named: "marge")!)
        
        let bart = Simpson(SimpsonName: "Bart Simpson", SimpsonJob: "Student", SimpsonImage: UIImage(named: "bart")!)
        
        let lisa = Simpson(SimpsonName: "Lisa Simpson", SimpsonJob: "Student", SimpsonImage: UIImage(named: "lisa")!)
        
        let maggie = Simpson(SimpsonName: "Maggie Simpson", SimpsonJob: "Baby", SimpsonImage: UIImage(named: "maggie")!)
        
        mySimpson.append(homer)
        mySimpson.append(marge)
        mySimpson.append(bart)
        mySimpson.append(lisa)
        mySimpson.append(maggie)
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySimpson.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = mySimpson[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenSimpson = mySimpson[indexPath.row]
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"{
            let destinationVC = segue.destination as! detailsVC
            destinationVC.selectedSimpson = chosenSimpson
        }
    }
}

