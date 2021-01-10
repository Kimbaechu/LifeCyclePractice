//
//  AddVC.swift
//  W2_LIfeCycle
//
//  Created by Beomcheol Kwon on 2021/01/06.
//

import UIKit

class AddVC: UIViewController {
    
    var delegate: ComposeDelegate?
    var memo: String?
    
    @IBOutlet weak var memoTitleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func save(_ sender: Any) {
        guard let title = memoTitleTextField.text, title.count > 0 else {
            return
        }
        
        delegate?.updateList(value: title)
        delegate?.reload()
        dismiss(animated: true, completion: nil)
    }
    
}

protocol ComposeDelegate {
    func updateList(value: String)
    func reload()
}
