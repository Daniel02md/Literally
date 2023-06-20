//
//  FourthPresentationPagePreview.swift
//  Literally
//
//  Created by Fernanda Holanda on 13/06/23.
//

import Foundation



import SwiftUI


struct FourthPresentationPagePreview: View {
    @Binding var currentPage: Int
 
    
    var body: some View {
        
        GeometryReader{cell in
            HStack{
                Spacer()
                ZStack(alignment: .top){
                    HStack(alignment: .center){
                        
                        RoundedRectangle(cornerRadius: 50)
                            .foregroundColor(Color(red: 236 / 255, green: 236 / 255, blue: 236 / 255))
                            .frame(maxWidth: cell.size.width / 1.3, maxHeight: .infinity)
                    }
                    .frame(maxHeight: .infinity)
                    
                    VStack{
                        VStack{
                            Image("fourthPage")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        .frame(minWidth: cell.size.width / 1.16, minHeight: cell.size.height / 3.3)
                        .padding(.bottom, 15)
                        
                        VStack(alignment: .leading){
                            Text("DESCUBRA SEUS MUNDOS FAVORITOS DE OUTRO JEITO.")
                                .font(.system(size: 28))
                                .fontWeight(.black)
                                .padding(.bottom, 15)
                                .foregroundColor(Color(red: 199 / 255, green: 80 / 255, blue: 0 / 255))
                            
                            Text("Com o nosso aplicativo você conseguirá assistir aos seus livros favoritos e ler os filmes que mais gosta!")
                                .foregroundColor(Color(cgColor: CGColor(red: 0, green: 0, blue: 0, alpha: 0.7)))
                                .fixedSize(horizontal: false, vertical: true)

                            
                        }
                        .frame(maxWidth: cell.size.width/1.5, alignment: .leading)
                        
                        Spacer()
                        Button(action: {}){
                            Text("Comece aqui!")
                        }
                        .padding(.horizontal, 60)
                        .padding(.vertical, 15)
                        .background(Color(red: 251 / 255, green: 231 / 255, blue: 146 / 255))
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        Spacer()
                        
                    }.frame(maxWidth: cell.size.width/1.16)
                        
                }
                .frame(maxWidth: cell.size.width, maxHeight: .infinity)
                
                Spacer()
            }
            
        }
    }
}


//struct Preview_FourthPresentationPage: PreviewProvider{
//    static var previews: some View{
//        GeometryReader{ cell in
//            Spacer()
//                .frame(height: 50)
//            
//            FourthPresentationPagePreview()
//            
//                .frame(maxHeight: cell.size.height/1.2)
//        }
//    }
//}

                            


