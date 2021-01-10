//
//  ViewController.swift
//  W2_LIfeCycle
//
//  Created by Beomcheol Kwon on 2021/01/04.
//

import UIKit

func dateFormatter(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm:ss"
    return formatter.string(from: date)
}


class MainVC: UIViewController {
    
    var anyTimer: Timer?
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var viewDidLoadLabel: UILabel!
    @IBOutlet weak var viewWillAppearLabel: UILabel!
    @IBOutlet weak var viewDidAppearLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DEBUG_LOG("")
        //초기 UI설정
        changeLabelColor(label: viewDidLoadLabel)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        DEBUG_LOG("")
        changeLabelColor(label: viewWillAppearLabel)
        startTimer()
        let backTime = UserDefaults.shared.string(forKey: "BackgroundDate")
        self.navigationItem.title = backTime
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        DEBUG_LOG("")
        changeLabelColor(label: viewDidAppearLabel)
    }
    
    //textField.resignFirstResponder() 차이 확인
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        DEBUG_LOG("")
        textField.resignFirstResponder()
//        textField.text = nil
    }
    
    //textField.resignFirstResponder() 차이 확인
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        DEBUG_LOG("")
//        textField.resignFirstResponder()
        textField.text = nil
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "YellowSegue":
            if let vc = segue.destination as? YellowVC {
                vc.text = textField.text
            }
        case "RedSegue":
            if let vc = segue.destination as? RedVC {
                vc.text = textField.text
            }
        default:
            fatalError()
        }
  
    }
    
    func changeLabelColor(label: UILabel) {
        let red = CGFloat((arc4random() % 256)) / 255.0
        let green = CGFloat((arc4random() % 256)) / 255.0
        let blue = CGFloat((arc4random() % 256)) / 255.0
        let alpha = CGFloat(1.0)

        UIView.animate(withDuration: 1, animations: {
            label.layer.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: alpha).cgColor
        }, completion:nil)
        
        UIView.animate(withDuration: 1, animations: {
            self.view.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        }, completion: nil)
    }
}

extension MainVC {
 
    func startTimer() {
        anyTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timer), userInfo: nil, repeats: true)
    }
    
    @objc func timer() {
        timeLabel.text = dateFormatter(Date())
    }
}
