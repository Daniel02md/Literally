//
//  FirstPresentationPagePreview.swift
//  Literally
//
//  Created by Marcos Bezerra on 23/05/23.
//

import SwiftUI




struct ThirdPresentationPageView: View {
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
                            Image("thirdPage")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        .frame(minWidth: cell.size.width / 1.16, minHeight: cell.size.height / 3.3)
                        .padding(.bottom, 15)
                        
                        VStack(alignment: .leading){
                            
                            Text("PRECISÃO DE RECOMENDACÃO")
                                .font(.system(size: 28))
                                .fontWeight(.black)
                                .padding(.bottom, 15)
                                .foregroundColor(Color(red: 199 / 255, green: 80 / 255, blue: 0 / 255))
                            
                            Text("Graças a API da Inteligência Artificial Chat GPT versão 4 usada conseguimos uma precisão incrível com as recomendações de livros baseadas em enredos de filmes e recomendações de filmes baseadas em enredo de livros.")
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
                        .background(Color(red: 1.0, green: 0.43, blue: 0.49))
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



//struct Preview_ThirdPresentationPage: PreviewProvider{
//    static var previews: some View{
//        GeometryReader{ cell in
//            Spacer()
//                .frame(height: 50)
//
//            ThirdPresentationPageView()
//                .frame(maxHeight: cell.size.height/1.2)
//        }
//    }
//}
