//
//  ListVC.swift
//  W2_LIfeCycle
//
//  Created by Beomcheol Kwon on 2021/01/06.
//

import UIKit

class ListVC: UIViewController {

    var list = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? AddVC {
            vc.delegate = self
        }
    }

}

extension ListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = list[indexPath.row]
        
        return cell
    }
    
    
}

extension ListVC: ComposeDelegate {
    func updateList(value: String) {
        list.append(value)
    }
    
    func reload() {
        tableView.reloadData()
    }
    
    
}
