//
//  SceneDelegate.swift
//  HealthApp
//
//  Created by Cordova Garcia Moises Emmanuel on 28/12/23.
//

import UIKit
import SwiftUI
import SwiftData


class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    private var savedURL: URL?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    // التأكد من أن المشهد هو UIWindowScene
    guard let windowScene = (scene as? UIWindowScene) else { return }
    
    let window = UIWindow(windowScene: windowScene)
    
    do {
        // 1. إعداد قاعدة البيانات (المريض والعمليات)
        let container = try ModelContainer(for: Patient.self, OperativeNote.self)
        
        // 2. إنشاء الواجهة وربطها بالبيانات
        let contentView = PatientList()
            .modelContainer(container)
        
        // 3. عرض الواجهة على الشاشة
        window.rootViewController = UIHostingController(rootView: contentView)
        self.window = window
        window.makeKeyAndVisible()
        
    } catch {
        print("فشل في إنشاء قاعدة البيانات: \(error)")
    }
}

        
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        guard let url = self.savedURL else { return }
        self.handleURL(url)
        self.savedURL = nil
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        guard let url = URLContexts.first?.url else { return }
        self.handleURL(url)
    }
    
    private func handleURL(_ url: URL) {
        guard var topController = window?.rootViewController else { return }
        let storyboard = UIStoryboard(name: Constants.Storyboard.main, bundle: nil)
        let addDoctorVC = storyboard.instantiateViewController(identifier: Constants.ViewIdentifiers.addDoctorVC)
        while let presentedViewController = topController.presentedViewController {
            topController = presentedViewController
        }
        topController.present(addDoctorVC, animated: true, completion: nil)
    }
    
    
}

