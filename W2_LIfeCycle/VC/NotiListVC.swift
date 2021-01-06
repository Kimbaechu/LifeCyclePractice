//
//  NotiListVC.swift
//  W2_LIfeCycle
//
//  Created by Beomcheol Kwon on 2021/01/06.
//

import UIKit

class NotiListVC: UIViewController {

    var list = [String]()
    var token: NSObjectProtocol?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        token = NotificationCenter.default.addObserver(forName: NSNotification.Name.MemoAdd, object: nil, queue: OperationQueue.main, using: { [weak self] noti in

            guard let memo = noti.userInfo?["NewMemo"] as? String else { return }

            self?.list.append(memo)
            self?.tableView.reloadData()
        })
    }
    
    deinit {
        if let token = token {
            NotificationCenter.default.removeObserver(token)
        }
    }
}

extension NotiListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = list[indexPath.row]
        
        return cell
    }
}
