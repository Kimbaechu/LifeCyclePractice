//
//  RedVC.swift
//  W2_LIfeCycle
//
//  Created by Beomcheol Kwon on 2021/01/05.
//

import UIKit

class RedVC: UIViewController {

    var text: String?
    
    @IBOutlet weak var viewDidLoadLabel: UILabel!
    @IBOutlet weak var viewWillAppearLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DEBUG_LOG("")
        viewDidLoadLabel.text = text
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        DEBUG_LOG("")
        viewWillAppearLabel.text = text
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        DEBUG_LOG("")
        changeBackgroundColor()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        DEBUG_LOG("")
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        DEBUG_LOG("")

    }
    
    func changeBackgroundColor() {
        UIView.animate(withDuration: 1.0, animations: {
            self.view.backgroundColor = .systemRed
        }, completion: nil)
    }
    
}

