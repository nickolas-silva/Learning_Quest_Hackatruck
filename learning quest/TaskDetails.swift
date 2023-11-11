//
//  TaskDetails.swift
//  Tela Tarefas
//
//  Created by Student14_02 on 06/11/23.
//

import SwiftUI

struct TaskDetails: View {
    var tare: Tarefa
    var body: some View{
        VStack{
            Spacer()
            Text("\(tare.titulo!)").padding(15).bold().font(.title)
            ForEach(0..<tare.passos!.count){ i in
                Divider()
                Text("\(tare.passos![i])").font(.title3).padding()
                
            }
            Spacer()
            Button("Concluir") {
                XP.global = XP.global + tare.valXp!
                Moeda.global = Moeda.global + tare.valCoins!
            }.padding(.bottom)
        }.frame(width: 350, height:500).background(Color("TaskBackground")).cornerRadius(20)
    }
}

struct TaskDetailsView: View {
    var tarefa: Tarefa
    var body: some View {
        ZStack{
            Color("bg").ignoresSafeArea()
            TaskDetails(tare: tarefa)
        }
    }
}

struct TaskDetails_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailsView(tarefa: Tarefa(
            titulo: "Tarefa1",
            valXp: 100,
            valCoins: 500,
            passos: [
            "Passso1",
            "Passo2",
            "Passo3",
            "TESTE"
            ],
            dificuldade: 2
        )
)
    }
}


