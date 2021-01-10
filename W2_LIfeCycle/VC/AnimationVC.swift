//
//  AnimationVC.swift
//  W2_LIfeCycle
//
//  Created by Beomcheol Kwon on 2021/01/10.
//

import UIKit

class AnimationVC: UIViewController {
    
    @IBOutlet weak var redView: UIView!
    
    @IBOutlet weak var redWidthConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func reset(_ sender: Any) {
        redView.layer.removeAllAnimations()
        redWidthConstraint.constant = 10
//        redView.setNeedsUpdateConstraints()
        self.view.layoutIfNeeded()
    }
    
    @IBAction func restart(_ sender: Any) {
        redView.layer.removeAllAnimations()
        reset()
        sizeUp()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        sizeUp()
    }
    
    func sizeUp() {
        UIView.animate(withDuration: 10, animations: {
//            self.redView.transform = CGAffineTransform(scaleX: 30, y: 30)
            self.redWidthConstraint.constant = 300
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func reset() {
        self.redWidthConstraint.constant = 10
        self.view.layoutIfNeeded()
    }

}
