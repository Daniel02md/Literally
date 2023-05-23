//
//  BasePresentationView.swift
//  Literally
//
//  Created by Marcos Bezerra on 20/05/23.
//

import SwiftUI

struct BasePresentationView: View {
    @Binding var isNew: Bool
    var body: some View {
        GeometryReader{ cell in
            HStack{
                Spacer()
                    .frame(maxWidth: .infinity)
                
                HStack{
                    Image("searchLogoIcon")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color(red: 156 / 255, green: 64 / 255, blue: 20 / 255))
                        .background(Color(red: 220 / 255, green: 220 / 255, blue: 220 / 255))
                        
                    Text("LITERALLY")
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 0.613, green: 0.251, blue: 0.08))
                }
                .frame(width: 136, height: 30)
                
                Button("Pular"){
                    isNew = false
                }
                .frame(maxWidth: .infinity, maxHeight: 20, alignment: .trailing)
                .padding(.trailing, 15)
            }
            .frame(width: cell.size.width, height: 50)
            .background(Color(red: 220 / 255, green: 220 / 255, blue: 220 / 255))
        }
    }
}
