//
//  teste.swift
//  Literally
//
//  Created by user on 16/06/23.
//

import SwiftUI

struct teste: View {
    @State private var searchText = ""

    var body: some View {
        NavigationStack {
                    Text("")
                        .navigationTitle("HOME")
                        .toolbar{
                            ToolbarItem(placement: .navigationBarTrailing){
                                
                                NavigationLink(destination: Text("teste")) {
                                    
                                        Image(systemName: "globe")
                                }
                            }
                        }
                }
                .searchable(text: $searchText)
    }
}

struct teste_Previews: PreviewProvider {
    static var previews: some View {
        teste()
    }
}
