//
//  ContentView.swift
//  Literally
//
//  Created by Marcos Bezerra on 20/05/23.
//

import SwiftUI


struct ContentView: View {
    @State var selectedPage = 0
    @Binding var isNew: Bool
    
    var body: some View {
        GeometryReader{ cell in
            VStack(spacing: 0){
                BasePresentationView(isNew: $isNew)
                    .frame(maxHeight: 30)
                TabView(selection: $selectedPage){
                    
                    FirstPresentationPageView(currentPage: $selectedPage)
                        .frame(maxHeight: cell.size.height/1.2)
                        .tabItem {
                            selectedPage == 0 ? Image("tabBarItem"): Image(systemName: "circle.fill")
                        }
                        .tag(0)
                    
                    SecondPresentationPageView(currentPage: $selectedPage)
                        .frame(maxHeight: cell.size.height/1.2)
                        .tabItem {
                            selectedPage == 1 ? Image("tabBarItem"): Image(systemName: "circle.fill")
                        .tag(1)
                    ThirdPresentationPageView(currentPage: $selectedPage)
                        .frame(maxHeight: cell.size.height/1.2)
                        .tabItem {
                            selectedPage == 2 ? Image("tabBarItem"): Image(systemName: "circle.fill")
                        }
                        .tag(2)
                    FourthPresentationPageView(currentPage: $selectedPage)
                        .frame(maxHeight: cell.size.height/1.2)
                        .tabItem {
                            selectedPage == 3 ? Image("tabBarItem"): Image(systemName: "circle.fill")
                        }
                        .tag(3)
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .onAppear(){
                    changeTabBarItemColor()
                }
                
                
            }
            .ignoresSafeArea(.all, edges: .bottom)
            .background(Color(red: 220 / 255, green: 220 / 255, blue: 220 / 255))
        }
    }
    
    func changeTabBarItemColor(){
        UIPageControl.appearance().currentPageIndicatorTintColor = .orange
        UIPageControl.appearance().pageIndicatorTintColor = .darkGray
    }
    
}
    
