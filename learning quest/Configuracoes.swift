//
//  TelaDeConfig.swift
//  TelaDePerfilConfig
//
//  Created by Student17 on 06/11/23.
//

import SwiftUI

struct Configuracoes: View {
    var aluno : Aluno
    var body: some View {
        //Array com opções do menu
        let opcoes = [
                    "Conta",
                    "Privacidade",
                    "Alterar email",
                    "Tamanho da fonte",
                    "Sobre o Learning Quest"
                ]
        HStack{
            Spacer()
            
            VStack { //VStack Geral
            
            //VStack do primeiro Quadro
            VStack{
                ZStack{
                    VStack(){ // VStack interna do quadro
                        HStack(alignment: .center){ //
                            Spacer()
                            ZStack{
                                AvatarView(url:URL(string: "https://miro.medium.com/v2/resize:fill:176:176/1*_v32bSQ2RBDObU7UHHMEEQ.jpeg")!, size:80).padding()
                            }
                            Spacer()
                            VStack(alignment: .leading){
                                Text("\(aluno.nome!)")
                                Text("gabriel @escola.com")
                            }
                            Spacer()
                        }
                        
                        Divider()
                            .overlay(.black)
                        
                        HStack(){
                            Text("Editar Perfil")
                        }
                    }.frame(width: 340, height: 160)
                        .background(Color("TaskBackground"))
                        .clipShape(RoundedRectangle(cornerRadius:12))
                        .padding(10)
                        
                }
                                
                ZStack{ // Lista de opções
                   // Color("FundoRetangulo")
                    ScrollView{
                        Spacer()
                        ForEach(opcoes, id: \.self){ opcao in
                            VStack(){
                                
                                //Divider().overlay(.black)
                               
                                HStack{
                                    Text(opcao)
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                }.padding([.leading, .trailing])
                                
                                Divider().overlay(.black)
                                
                            }
                        }
                       // Spacer()

                    }.frame(minHeight: 300, maxHeight: 400)
                    
                }.frame(width: 340)
                    .background(Color("TaskBackground"))
                    .clipShape(RoundedRectangle(cornerRadius:12))
                
                Spacer()
            }
            
        }
            
            Spacer()
        }
        .padding()
        //.frame(width: .infinity, height: .infinity)
        .background(Color("bg"))
    }
}

struct TelaDeConfig_Previews: PreviewProvider {
    static var previews: some View {
        Configuracoes(aluno: Aluno(
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
