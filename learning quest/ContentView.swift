//
//  ContentView.swift
//  learning quest
//
//  Created by Student23 on 31/10/23.
//

import SwiftUI

struct Home: View {
    @State var moeda1 : Int?
    @State var xp2: Int?
    var aluno: Aluno
    var body: some View {
        ZStack{
            Color("bg")
            VStack{
                HStack{
                    AvatarView(url:URL(string: "https://miro.medium.com/v2/resize:fill:176:176/1*_v32bSQ2RBDObU7UHHMEEQ.jpeg")!, size:80).padding()
                    VStack{
                        
                        Text("\(aluno.nome!), \(aluno.turma!)").frame(maxWidth: .infinity, alignment: .leading).bold()
                        
                        HStack{
                            Image(systemName: "bookmark.fill")
                            Text("XP \(xp2 ?? Int(0.0))").bold()
                        }.frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                    
                    Spacer()
                    Image(systemName: "bitcoinsign")
                    if(moeda1 ?? Int(0.0) < 0){
                        Text("0").padding([.trailing], 20).bold()
                    }else{
                        Text("\(moeda1 ?? Int(0.0))").padding([.trailing], 20).bold()
                    }
                    
                    
                }.frame(width: .infinity).padding(.top)
                Feed(al: aluno)
            }.onAppear(){
                moeda1 = Moeda.global
                xp2 = XP.global
            }
        }.ignoresSafeArea()
    }
}

struct FeedComponent: View{
    
    var indx: Noticia?
    var body: some View{
        
        ScrollView{
            HStack{
                Text("\(indx!.titulo!)").bold()
                Image(systemName: "target")
            }.padding(.top)
            HStack{
                Text("\(indx!.desc!)")
            }.padding(10)
        }.frame(width: 300, height: 180).background(Color("TaskBackgroundDark")).cornerRadius(20)
    }
}

struct Feed: View{
    var al: Aluno?
    var body: some View{
        ScrollView{
            Text("Feed").bold().font(.title)
            ForEach((al?.noticias)!, id: \.self){ i in
                FeedComponent(indx: i).padding().shadow(radius: 5)
            }
        }.frame(width: 350, height:550).background(Color("TaskBackground"))
            .cornerRadius(20)
        }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Home(aluno: Aluno(
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
                dificuldade: 2
            )
        
        ]
        )
        
        )
    }
}
