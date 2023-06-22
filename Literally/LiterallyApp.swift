//
//  LiterallyApp.swift
//  Literally
//
//  Created by Marcos Bezerra on 20/05/23.
//

import SwiftUI

@main
struct LiterallyApp: App {
    @AppStorage("isNew") var isNew = true
    
    var body: some Scene {
        WindowGroup {
            if isNew{
                ContentView(isNew: $isNew)
            }
            else{
                baseSearchView()
            }
        }
    }
}
