//
//  marlon_quizApp.swift
//  marlon-quiz
//
//  Created by Aluno 15 on 31/03/25.
//

import SwiftUI

@main
struct marlon_quizApp: App {
    @StateObject var globalData = GlobalData()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView().environmentObject(globalData)
            }
        }
    }
}
