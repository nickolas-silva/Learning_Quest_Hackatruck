//
//  ModelAluno.swift
//  learning quest
//
//  Created by Student23 on 07/11/23.
//

import Foundation

struct XP{
    static var global : Int = 0
}


struct Moeda {
    
   static  var global : Int = 1000
    
}

struct Tarefa: Decodable, Hashable{
    var titulo: String?
    var valXp: Int?
    var valCoins: Int?
    var passos: [String]?
    var dificuldade: Int?
}

struct Noticia: Decodable, Hashable{
    var titulo: String?
    var desc: String?
}

struct Materia: Decodable, Hashable{
    var nome: String?
    var p1: Double?
    var p2: Double?
    var p3: Double?
    var p4: Double?
    var qntFaltas: Int?
}

struct Aluno: Decodable, Hashable{
    var nome: String?
    var xp: Int?
    var coins: Int?
    var turma: String?
    var materias: [Materia]?
    var imgPerfil: String?
    var noticias: [Noticia]?
    var tarefas: [Tarefa]?
    var pontos: Int?
}


class ModelAluno: ObservableObject{
    @Published var aluno: Aluno?
    
    func fetch(){
        guard let url = URL(string: "http://192.168.128.250:1880/getAluno") else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
        
            do{
                let parsed = try JSONDecoder().decode([Aluno].self, from: data)
                DispatchQueue.main.async {
                    self?.aluno = parsed[0]
                }
            } catch{
                print(error)
            }
        }
        task.resume()
    }
}
