//
//  OnboardingToggle.swift
//  OuviFalar
//
//  Created by Juliano Vaz on 03/03/21.
//


import Foundation

class OnboardingToggle: ObservableObject {
    
    init() {
        if !UserDefaults.standard.bool(forKey: "didLaunchBefore") {
            UserDefaults.standard.set(true, forKey: "didLaunchBefore")
            currentPage = "Onboarding"
        } else {
            //MainUIView
            currentPage = "Search"
        }
    }
    
    @Published var currentPage: String
    
}
