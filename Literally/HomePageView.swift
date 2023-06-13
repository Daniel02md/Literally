//
//  HomePageView.swift
//  Literally
//
//  Created by Marcos Daniel on 13/06/23.
//
import SwiftUI
import Foundation


struct HomePageView: View{
    @State var searchTerm: String = ""
    var body: some View{
        VStack{
            HStack{
                Text("home")
                Spacer()
                Image(systemName: "globe")            }
            .padding(.horizontal, 50)
            NavigationStack{
                NavigationLink
            }
            Divider()
            
           
        }
    }
}



struct Homepage_preview_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}



