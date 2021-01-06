//
//  NotiAddVC.swift
//  W2_LIfeCycle
//
//  Created by Beomcheol Kwon on 2021/01/06.
//

import UIKit

class NotiAddVC: UIViewController {

    @IBOutlet weak var memoTitleTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func save(_ sender: Any) {
        guard let title = memoTitleTextField.text, title.count > 0 else {
            return
        }
        
        DispatchQueue.global().async {
            NotificationCenter.default.post(name: NSNotification.Name.MemoAdd, object: nil, userInfo: ["NewMemo": title])
        }
        dismiss(animated: true, completion: nil)
    }

}

extension NSNotification.Name {
    static let MemoAdd = NSNotification.Name("MemoAddNotification")
}
