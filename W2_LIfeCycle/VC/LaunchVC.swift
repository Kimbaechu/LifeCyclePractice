//
//  LaunchVC.swift
//  W2_LIfeCycle
//
//  Created by Beomcheol Kwon on 2021/01/05.
//

import UIKit

class LaunchVC: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.shared.setValue(true, forKey: "Launched")
  
    }
    
    @IBAction func doSegue(_ sender: Any) {
        performSegue(withIdentifier: "ToMain", sender: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
