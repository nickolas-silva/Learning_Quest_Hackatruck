//
//  MainView.swift
//  learning quest
//
//  Created by Student23 on 01/11/23.
//

import SwiftUI

struct MainView: View {
   
    init(){
        UITabBar.appearance().backgroundColor = .white
    }
   
  //  @StateObject var saldoAluno =
    @StateObject var vm = ModelAluno()
//    var nome: String?
//    var xp: Int?
//    var coins: Int?
//    var turma: String?
//    var materias: [Materia]?
//    var imgPerfil: String?
    
    @State var a : Aluno = Aluno(nome: "", xp: 0,coins: 0, turma: "",noticias: [], tarefas: [] )
    
    var body: some View {
        TabView{
            Home(aluno: a).tabItem{
                Label("Home", systemImage: "homekit")
            }.padding(.top, 50)
            
            Tarefas(aluno: a).tabItem{
                Label("Tarefas", systemImage: "list.bullet.clipboard.fill")
            }
            
            Loja(aluno: a).tabItem{
                Label("Loja", systemImage: "square.split.1x2.fill")
            }
            
            Ranking().tabItem{
                Label("Ranking", systemImage: "doc.append.fill.rtl")
            }
            
            Configuracoes(aluno: a).tabItem{
                Label("Configuracoes", systemImage: "engine.combustion")
            }
        }.onAppear{
            vm.fetch()
            
            
            let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                if(vm.aluno != nil){
                    a = vm.aluno!
                    timer.invalidate()
                }
                
                print("teste")
            }

        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
