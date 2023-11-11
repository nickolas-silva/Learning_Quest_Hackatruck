//
//  VerNotas.swift
//  learning quest
//
//  Created by Student23 on 06/11/23.
//

import SwiftUI

struct VerNotas: View {
    var body: some View {
        VStack{
            ScrollView{
                ForEach(1..<6){ index in
                    VStack{
                        Text("Matemática").padding().bold()
                        HStack{
                            Text("P1").padding()
                            Text("P2").padding()
                            Text("P3").padding()
                            Text("P4").padding()
                            Spacer()
                            Text("FALTAS")
                            
                        }.padding([.horizontal], 15)
                        HStack{
                            Text("10").padding()
                            Text("5.5").padding()
                            Text("2.6").padding()
                            Text("5.0").padding()
                            Spacer()
                            Text("0")
                        }.padding([.horizontal], 15).foregroundColor(.white)
                    }.background(.gray).overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray,lineWidth: 5)).padding([.horizontal, .vertical], 20)
                }
            }
            
        }.background(Color("bg"))
    }
}

struct VerNotas_Previews: PreviewProvider {
    static var previews: some View {
        VerNotas()
    }
}
