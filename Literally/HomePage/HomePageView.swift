//
//  HomePageView.swift
//  Literally
//
//  Created by Marcos Daniel on 13/06/23.
//
import SwiftUI
import Foundation
import CoreData

struct HomePageView: View{
    
    
    @State var searchTerm: String = ""
    var body: some View{
        
        NavigationStack{
            Searchable(searchOn: Text("search page"), searchOff: HomeCatalog())
                .searchable(text: $searchTerm)
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        NavigationLink(destination: {
                            
                        }){
                            Image(systemName: "bookmark")
                                .resizable()
                                .frame(height: 20)
                        }
                    }
                    ToolbarItem(placement: .navigationBarLeading){
                        
                        Text("HOME")
                            .font(.system(.title, weight: .heavy))
                        
                }
            }
        }
    }
}


struct Searchable: View{
    @Environment(\.isSearching) var isSearching
    var searchOn: any View
    var searchOff: any View
    
    var body: some View{
        if (isSearching){
            AnyView(searchOn)
        }
        else{
            AnyView(searchOff)
        }
       
    }
}

struct Homepage_preview_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}



