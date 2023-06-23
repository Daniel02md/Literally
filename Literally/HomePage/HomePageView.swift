//
//  HomePageView.swift
//  Literally
//
//  Created by Marcos Daniel on 13/06/23.
//
import SwiftUI
import Foundation
import CoreData


enum ChoiceScope {
    case movie
    case book
}
struct HomePageView: View{
    
    
    
    @State var scope: ChoiceScope = .book
    @State var searchTerm: String = ""
    @Binding var bookAuthor: String 
    @Binding var booksByAuthor: [Book]
    @Binding var topRated: [Movie]
    @Binding var popular: [Movie]
    
    var body: some View{
        
        NavigationStack{
            Searchable(searchOn: baseSearchView(scope: $scope, searchTerm: $searchTerm), searchOff: HomeCatalog(popular: self.$popular, byAuthors: $booksByAuthor, author: $bookAuthor, topRated: self.$topRated))
                .searchable(text: $searchTerm)
                .searchScopes($scope) {
                    Text("Filme").tag(ChoiceScope.movie)
                    Text("Livro").tag(ChoiceScope.book)
                }
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        NavigationLink(destination: Text("Favoritos")){
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

//struct Homepage_preview_Previews: PreviewProvider {
//    static var previews: some View {
//        HomePageView()
//    }
//}



