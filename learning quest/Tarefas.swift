//
//  ContentView.swift
//  Tela Tarefas
//
//  Created by Student14_02 on 01/11/23.
//

import SwiftUI

struct Task:View{
    var aln: Aluno?
    var indx: Tarefa?

    
    var body: some View{
        var dificuldade: Int = indx!.dificuldade!
        ZStack{
            VStack{
                HStack(){
                    Text("\(indx!.titulo!)").bold().padding()
                    Text("\(indx!.valCoins!)")
                        Image(systemName: "bitcoinsign.circle.fill")
                        Spacer()
                    Text("\(indx!.valXp!)")
                        Image(systemName: "graduationcap.circle.fill")
                        Spacer(minLength: 5)
                }
                VStack{
                    HStack{
                        Text("Dificuldade").padding().opacity(0.7)
                        Spacer()
                    }
                    HStack{
                        if(dificuldade <= 1){
                            RoundedRectangle(cornerRadius:30).fill(.green).frame(width: 80, height: 15).padding([.leading], 15)
                            Spacer()
                        } else if(dificuldade == 2){
                            RoundedRectangle(cornerRadius:30).fill(.green).frame(width: 80, height: 15).padding([.leading], 15)
                            RoundedRectangle(cornerRadius:30).fill(.yellow).frame(width: 80, height: 15)
                            Spacer()
                        }else if(dificuldade == 3){
                            RoundedRectangle(cornerRadius:30).fill(.green).frame(width: 80, height: 15).padding([.leading], 15)
                            RoundedRectangle(cornerRadius:30).fill(.yellow).frame(width: 80, height: 15)
                            RoundedRectangle(cornerRadius:30).fill(.orange).frame(width: 80, height: 15)
                            Spacer()
                            
                        } else{
                            RoundedRectangle(cornerRadius:30).fill(.green).frame(width: 80, height: 15)
                            RoundedRectangle(cornerRadius:30).fill(.yellow).frame(width: 80, height: 15)
                            RoundedRectangle(cornerRadius:30).fill(.orange).frame(width: 80, height: 15)
                            RoundedRectangle(cornerRadius:30).fill(.red).frame(width: 80, height: 15)
                        }
                        
                        
                    }
                    Spacer()
                }.frame(width: 360)
                Spacer()
            }.frame(width: 360, height: 200).background(Color("TaskBackground"))
                .cornerRadius(10)
                .shadow(radius: 10)
        }
    }
}


struct Tarefas: View {
    var aluno: Aluno
    @State var moeda2 : Int?
    @State var xp : Int?
    var body: some View {
        NavigationStack{
        ZStack{
            Color("bg").ignoresSafeArea()
            ScrollView{
                VStack{
                    HStack{
                        AvatarView(url:URL(string: "https://miro.medium.com/v2/resize:fill:176:176/1*_v32bSQ2RBDObU7UHHMEEQ.jpeg")!, size:80).padding()
                        VStack{
                            Text("\(aluno.nome!), \(aluno.turma!)").frame(maxWidth: .infinity, alignment: .leading).bold()
                            HStack{
                                Image(systemName: "bookmark.fill")
                                         Text("XP \(xp ?? Int(0.0))").bold()
                                      }.frame(maxWidth: .infinity, alignment: .leading)
                             }
                             Spacer()
                             Image(systemName: "bitcoinsign")
                        Text("\(moeda2 ?? Int(0.0))").padding([.trailing], 20).bold()
                    }.frame(width: .infinity).padding(.top)
                    Spacer()
                }
                ForEach(aluno.tarefas!, id: \.self){i in
                    NavigationLink(destination:TaskDetailsView(tarefa: i)){
                        Task(aln: aluno, indx: i).padding()
                    }.buttonStyle(PlainButtonStyle())
                }
            }.onAppear(){
                xp = XP.global
                moeda2 =  Moeda.global
            }
            }
        }
    }
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Tarefas(aluno: Aluno(
        nome: "Nickolas",
        xp: 80,
        coins: 100,
        turma: "2 III",
        materias: [
            Materia(
            nome: "Matematica",
            p1: 10,
            p2: 5.7,
            p3: 4.3,
            p4: 5,
            qntFaltas: 8
            
        ),
            Materia(
            nome: "Biologia",
            p1: 10,
            p2: 5.7,
            p3: 4.3,
            p4: 5,
            qntFaltas: 8
            
        ),
            Materia(
            nome: "Quimica",
            p1: 10,
            p2: 5.7,
            p3: 4.3,
            p4: 5,
            qntFaltas: 8
            
        ),
            Materia(
            nome: "Portugues",
            p1: 10,
            p2: 5.7,
            p3: 4.3,
            p4: 5,
            qntFaltas: 8
            
        ),
            
        ],
        imgPerfil: "https://www.google.com/imgres?imgurl=https%3A%2F%2Fa.espncdn.com%2Fcombiner%2Fi%3Fimg%3D%2Fi%2Fteamlogos%2Fsoccer%2F500%2F819.png&tbnid=Y9rJRnSaaSa2IM&vet=12ahUKEwjzl8319rKCAxUfTLgEHYfXAPIQMygAegQIARBu..i&imgrefurl=https%3A%2F%2Fwww.espn.com.br%2Ffutebol%2Ftime%2F_%2Fid%2F819%2Fflamengo&docid=ohQlEhIqCcud5M&w=500&h=500&q=flamengo&client=firefox-b-d&ved=2ahUKEwjzl8319rKCAxUfTLgEHYfXAPIQMygAegQIARBu",
        
        noticias: [
            Noticia(
            titulo: "AVISO",
            desc: "TESTE"
            ),
            Noticia(
            titulo: "AVISO2",
            desc: "TESTEeeeeeeeee"
            ),
            Noticia(
            titulo: "AVISO3",
            desc: "TESTE"
            ),
            Noticia(
            titulo: "AVISO3",
            desc: "TESTE"
            )

        ],
        tarefas: [
            Tarefa(
                titulo: "Tarefa1",
                valXp: 100,
                valCoins: 500,
                passos: [
                "Passso1",
                "Passo2",
                "Passo3"
                ],
                dificuldade: 3
            ),
            Tarefa(
                titulo: "Tarefa2",
                valXp: 100,
                valCoins: 500,
                passos: [
                "Passso1",
                "Passo2",
                "Passo3"
                ],
                dificuldade: 1
            )
        
        ]
        )
        
        )

    }
}
