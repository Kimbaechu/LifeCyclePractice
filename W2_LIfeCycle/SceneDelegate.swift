//
//  SceneDelegate.swift
//  W2_LIfeCycle
//
//  Created by Beomcheol Kwon on 2021/01/04.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    let launched = UserDefaults.shared.bool(forKey: "Launched")
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        DEBUG_LOG("willConnectTo")
        
        let mainStoyboard = UIStoryboard(name: "Main", bundle: nil)
        let lauchStoryboard = UIStoryboard(name: "Launch", bundle: nil)
        
        var vc = mainStoyboard.instantiateViewController(withIdentifier: "MainVC") 
        
        
        let launched = UserDefaults.shared.bool(forKey: "Launched")
        if launched == false {
            
            vc = lauchStoryboard.instantiateViewController(withIdentifier: "LaunchVC")
            
        }
        
        
        self.window?.rootViewController = vc
        guard let _ = (scene as? UIWindowScene) else { return }
        
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        DEBUG_LOG("")
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
        
    }
    
    //Foreground
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
        DEBUG_LOG("")
        //여기 질문
        
        //첫 실행때는 적용이 안됨
        if launched == true {
            
            if let vc = self.window?.rootViewController?.children[0].children[0] as? MainVC {
                let backTime = UserDefaults.shared.string(forKey: "BackgroundDate")
                vc.navigationItem.title = backTime
            } else {
                print("else")
            }
            
        }
        
        
        
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
        DEBUG_LOG("")
        if launched == true {
            
            if let vc = self.window?.rootViewController?.children[4] as? AnimationVC {
                guard let _ = vc.redView else {
                    return
                }
                vc.reset()
                vc.sizeUp()
            } else {
                print("sceneDidBecomeActive - else")
            }
        }
        
    }
    
    //Background
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
        DEBUG_LOG("")

        if launched == true {
            if let vc = self.window?.rootViewController?.children[4] as? AnimationVC {
                guard let _ = vc.redView else {
                    return
                }
                //만약에 아래 식을 안써주면 길이가 300인 상태에서 시작하게 됨.
                vc.redWidthConstraint.constant = 10
                
            } else {
                print("sceneDidBecomeActive - else")
            }
            
        }
    }
    
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
        
        
        DEBUG_LOG(dateFormatter(Date()))
        UserDefaults.shared.setValue(dateFormatter(Date()) ,forKey: "BackgroundDate")
        
    }
    
    
}

