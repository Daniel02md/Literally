//
//  favoriteView.swift
//  Literally
//
//  Created by user on 19/06/23.
//

import SwiftUI

struct headerFavoriteView: View {
    var saves = ["aaaa", "bbbb"]
    var body: some View {
        NavigationStack{
            VStack {
                
                Text("")
                    .navigationBarTitle("Favoritos")
                    .toolbar{
                        ToolbarItem{
                            Button(action: {
                                print("a")
                            }, label: {
                                Image("fullfilledIcon")
                                
                            })
                        }
                    }
                
                
            }
        }
    }
    
    struct favoriteView_Previews: PreviewProvider {
        static var previews: some View {
            headerFavoriteView()
        }
    }
}
