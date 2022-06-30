//
//  ViewController.swift
//  NotesPractice
//
//  Created by Ehsan Taghavi on 26.05.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var table: UITableView?
    @IBOutlet var label: UILabel!
    
    var models: [(title: String, note:String)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table?.delegate = self
        table?.dataSource = self
        title = "Notes"
    }
    
    @IBAction func didTapNewNote(){
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row].title
        cell.detailTextLabel?.text = models[indexPath.row].note
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let vc = storyboard?.instantiateViewController(identifier: "note") as? NoteViewController else{
            return
        }
        vc.title = "Note"
        navigationController?.pushViewController(vc, animated: true)
    }
}

