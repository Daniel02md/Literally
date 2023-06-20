//
//  MoviesResultsView.swift
//  Literally
//
//  Created by Fernanda Holanda on 16/06/23.
//

import SwiftUI

struct MovieView: View {
    var imageUrl: URL
    var title: String
    var author: String
    var rate: Float
    
    var body: some View {
        VStack {
            HStack{
                Spacer()
                Image("icon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaledToFit()
                    .frame(width: 30, height: 30)
            }
            .padding()
            
            VStack(alignment: .leading){
                Text("É ASSIM QUE ACABA")
                    .font(.custom("Montserrat", fixedSize: 32))
                    .fontWeight(.heavy)
                    .foregroundColor(Color(red: 44 / 255, green: 24 / 255, blue: 16 / 255))
                    .frame(width: 282, height: 24)
                    .multilineTextAlignment(.center)
            }
            Spacer()
        }
    }
    
//    struct MoviesResultsView_Previews: PreviewProvider {
  //      static var previews: some View {
    //        MoviesResultsView()
      //  }
    //}
}
