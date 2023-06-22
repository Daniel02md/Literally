//
//  FirstPresentationPagePreview.swift
//  Literally
//
//  Created by Marcos Bezerra on 23/05/23.
//

import SwiftUI




struct SecondPresentationPageView: View {
    
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
                            Image("secondPage")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        .frame(minWidth: cell.size.width / 1.16, minHeight: cell.size.height / 3.3)
                        .padding(.bottom, 15)
                        
                        VStack(alignment: .leading){
                            
                            Text("FERRAMENTA DE BUSCA E RECOMENDACÃO")
                                .font(.system(size: 28))
                                .fontWeight(.black)
                                .padding(.bottom, 15)
                                .foregroundColor(Color(red: 199 / 255, green: 80 / 255, blue: 0 / 255))
                            
                            Text("Você já assistiu um filme e quis muito ler um livro com o enredo parecido? Ou leu um livro e quis muito assistir um filme parecido com um filme que você acabou de assistir? Pois assim funciona o Literally.")
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
                        .background(Color(red: 0.63, green: 0.74, blue: 1.0))
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



//struct Preview_SecondPresentationPage: PreviewProvider{
//    static var previews: some View{
//        GeometryReader{ cell in
//            Spacer()
//                .frame(height: 50)
//            
//            SecondPresentationPageView()
//                .frame(maxHeight: cell.size.height/1.2)
//        }
//    }
//}
