//
//  TechImageApp.swift
//  Shared
//
//  Created by 勝田啓一 on 2022/12/03.
//

import SwiftUI

@main
struct TechImageApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    @StateObject private var userData = UserData()
    
    var body: some Scene {
        WindowGroup {
            // Albumを最初の画面に設定
            Album()
                .environmentObject(userData)
        }
    }
}

class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        
        // アプリ起動時に最初に呼ばれる
        return true
    }
}
