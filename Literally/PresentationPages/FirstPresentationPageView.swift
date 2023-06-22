//
//  FirstPresentationPagePreview.swift
//  Literally
//
//  Created by Marcos Bezerra on 23/05/23.
//

import SwiftUI




struct FirstPresentationPageView: View {
    
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
                            Image("firstPage")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        .frame(minWidth: cell.size.width / 1.16, minHeight: cell.size.height / 3.3)
                        .padding(.bottom, 15)
                        
                        VStack(alignment: .leading){
                            Text("CONHEÇA")
                                .font(.system(size: 28))
                                .fontWeight(.bold)
                                .foregroundColor(Color(red: 199 / 255, green: 80 / 255, blue: 0 / 255))
                            
                            Text("LITERALLY")
                                .font(.system(size: 28))
                                .fontWeight(.black)
                                .padding(.bottom, 15)
                                .foregroundColor(Color(red: 199 / 255, green: 80 / 255, blue: 0 / 255))
                            
                            Text("Um app para amantes de literatura e cinema. Assista seus livros e leia seus filmes.")
                                .foregroundColor(Color(cgColor: CGColor(red: 0, green: 0, blue: 0, alpha: 0.7)))
                                .fixedSize(horizontal: false, vertical: true)
                            
                            Text("Clique em próximo para saber mais e acessar nossa plataforma.")
                                .padding(.top, 0.5)
                                .foregroundColor(Color(cgColor: CGColor(red: 0, green: 0, blue: 0, alpha: 0.7)))
                                .fixedSize(horizontal: false, vertical: true)
                            
                        }
                        .frame(maxWidth: cell.size.width/1.5, alignment: .leading)
                        
                        Spacer()
                        Button(action: {
                            currentPage = currentPage + 1
                        }){
                            Text("Próximo")
                        }
                        .padding(.horizontal, 60)
                        .padding(.vertical, 15)
                        .background(Color(red: 255 / 255, green: 188 / 255, blue: 67 / 255))
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



//struct Preview_FirstPresentationPage: PreviewProvider{
//    @Binding var state: Int = 8
//
//    static var previews: some View{
//
//        GeometryReader{ cell in
//            Spacer()
//                .frame(height: 50)
//
//            FirstPresentationPageView(currentPage: $state)
//                .frame(maxHeight: cell.size.height/1.2)
//        }
//    }
//}
