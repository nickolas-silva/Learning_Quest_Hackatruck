//
//  Ranking.swift
//  learning quest
//
//  Created by Student23 on 01/11/23.
//

import SwiftUI

struct Ranking: View {
    
    var body: some View {
        NavigationStack{
            
            VStack{
                Spacer()
                NavigationLink(destination: VerNotas(), label: {Text("Ver minhas notas").padding()}).foregroundColor(.white).background(.gray).padding()
            
                ScrollView{
                    
                    ForEach(1..<11){index in
                        HStack{
                            Circle().frame(width: 80).foregroundColor(.white).padding([.leading, .top, .bottom], 20)
                            
                            VStack{
                                Text("Nome do Aluno").bold().frame(maxWidth: .infinity, alignment: .leading)
                                Spacer()
                                Text("Turma: 2 I").bold().frame(maxWidth: .infinity, alignment: .leading)
                                Spacer()
                                
                                
                            }.padding()
                            
                            Spacer()
                            
                            VStack{
                                Text("\(index)").bold().font(.system(size: 22))
                                Text("Ranking").bold().font(.system(size: 20))
                            }.padding([.trailing],20)
                        }.background(.gray).overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray, lineWidth: 4)).padding()
                    }
                    

                }
            
            }.background(Color("bg"))
            
        }
        
    }
}

struct Ranking_Previews: PreviewProvider {
    static var previews: some View {
        Ranking()
    }
}
