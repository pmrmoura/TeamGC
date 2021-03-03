//
//  MotherView.swift
//  OuviFalar
//
//  Created by Juliano Vaz on 03/03/21.
//

import SwiftUI

struct MotherView : View {
    
//    @EnvironmentObject var toggle: OnboardingToggle
//    var user = User() se for fazer configuracao de usuario
    @StateObject var toggle = OnboardingToggle()
    var body: some View {
        NavigationView {
            VStack {
                if toggle.currentPage == "Onboarding" {
                    OnboardView()
                } else if toggle.currentPage == "Search" {
    //                ContentView().environmentObject(user)
                    SearchView()
                }
            }
        }
        .environmentObject(toggle)
        .navigationBarTitle("") //this must be empty
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .edgesIgnoringSafeArea([.top, .bottom])
    }
}

//struct MotherView_Previews: PreviewProvider {
//    static var previews: some View {
//        MotherView().environmentObject(ViewRouter())
//    }
//}
