//
//  RxAddVC.swift
//  W2_LIfeCycle
//
//  Created by Beomcheol Kwon on 2021/01/05.
//

import UIKit
import RxSwift

class RxAddVC: UIViewController {

    let memoSubject = PublishSubject<String>()
    
    var memoSubjectObservable: Observable<String> {
        return memoSubject.asObservable()
    }
    
    @IBOutlet weak var memoTitleTextField: UITextField!
    
    @IBAction func save() {
        guard let title = self.memoTitleTextField.text else {
            return
        }
        
        memoSubject.onNext(title)
        
        self.dismiss(animated: true, completion: nil)
    }
    
}
