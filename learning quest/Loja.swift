//
//  Background.swift
//  Learning Quest
//
//  Created by Student11 on 06/11/23.
//

import SwiftUI
import SlidingTabView

/* URL do import SlidingTabView
 https://github.com/QuynhNguyen/SlidingTabView
 */

// Modelo de cada produto
struct Modelo : Hashable {
    var nome: String
    var preco: Int
    var img: String
}

// Informaçoes dos produtos
var arrayMaterial = [
    Modelo(nome: "LÁPIS", preco: 300, img: "https://images.tcdn.com.br/img/img_prod/951582/lapis_preto_n2_sextavado_faber_castell_5153_1_19d37cbb4beb214c7ad4b2a6f705b8c9.jpg"),
    Modelo(nome: "POST-IT", preco: 1000, img: "https://http2.mlstatic.com/D_NQ_NP_633033-MLB54985408528_052023-O.webp"),
    Modelo(nome: "CANETA AZUL", preco: 400, img: "https://images.tcdn.com.br/img/img_prod/1140357/caneta_esferografica_bic_cristal_dura_mais_azul_ponta_media_de_1_0mm_2637_1_671e4fdf5e2c89e777e6923939970830.jpg"),
    Modelo(nome: "BORRACHA", preco: 500, img: "https://m.media-amazon.com/images/I/51bol8r1QjL._AC_UF894,1000_QL80_.jpg"),
    Modelo(nome: "LAPISERIA", preco: 550, img: "https://cdn.awsli.com.br/2500x2500/765/765263/produto/185906936/0a507c79f2.jpg"),
]

var arrayCantina = [
    Modelo(nome: "KI QUEIJO", preco: 300,img: "https://down-br.img.susercontent.com/file/75026c0b8c0d9f7448ea651c799c126f"),
    Modelo(nome: "NUTELLA", preco: 1000,img: "https://d3ugyf2ht6aenh.cloudfront.net/stores/001/059/965/products/19517697_1sz11-c32cf871146f11054515844741277697-640-0.jpg"),
    Modelo(nome: "FANDANGOS", preco: 400,img: "https://static.paodeacucar.com/img/uploads/1/841/23493841.jpg"),
    Modelo(nome: "TAMPICO", preco: 500,img: "https://www.newagebebidas.com.br/wp-content/uploads/2020/08/tamp_newage_citricas_250ml_nova.png"),
    Modelo(nome: "BOLACHA", preco: 550,img: "https://assets.vtex.app/unsafe/fit-in/720x720/center/middle/https%3A%2F%2Fdomolivio.vtexassets.com%2Farquivos%2Fids%2F280843%2FBiscoito-Chocolate-Recheio-Baunilha-Oreo-36G.jpg%3Fv%3D638332342075800000"),
]

var arrayBrindes = [
    Modelo(nome: "URSO PELÚCIA", preco: 300,img: "https://m.media-amazon.com/images/I/61HQ2cRuPxL._AC_UF894,1000_QL80_.jpg"),
    Modelo(nome: "APITO", preco: 1000,img: "https://images.tcdn.com.br/img/img_prod/612778/apito_plastico_poker_cardeal_c_esfera_avulso_430_1_20190808164230.jpg"),
    Modelo(nome: "IOIÔ", preco: 400,img: "https://m.media-amazon.com/images/I/51vFOQ-jVjS._AC_UF894,1000_QL80_.jpg"),
    Modelo(nome: "BONECO", preco: 500,img: "https://m.media-amazon.com/images/I/51LfEXzVOUL._AC_UF894,1000_QL80_.jpg"),
    Modelo(nome: "GARRAFA", preco: 1200,img: "https://cdn.awsli.com.br/231/231645/produto/206607619/1016291_squeeze-plastico-weeze-turquesa-serie-matte-600ml-14249_l2_638006393020713323-xgejut.jpg"),
]

// View da Loja que vai chamar o quadro de Tabs
struct Loja: View {
  
    
    var aluno : Aluno
    var body: some View {
        ZStack{
            Color("bg") .ignoresSafeArea()
            Tabs(tabIndex: 3, al: aluno)
        }
    }
    
}

// Quadro Tabs
struct Tabs: View{
    @State var tabIndex = 0
    var al : Aluno
    var body: some View {
        VStack{
            VStack{
                
                SlidingTabView(selection: $tabIndex, tabs: ["Material","Comida","Brindes"], animation: .easeInOut, selectionBarColor: .black)
                    .foregroundColor(.black)
                
                Spacer()
                
                if tabIndex == 0{
                    ScrollView{
                        ForEach(arrayMaterial,id: \.self){ modelo in
                            ItemLoja(alunoCoins: al.coins!, item: modelo)
                        }
                    }
                } else if tabIndex == 1 {
                    ScrollView{
                        ForEach(arrayCantina,id: \.self){ modelo in
                            ItemLoja(alunoCoins: al.coins!, item: modelo)
                        }
                    }
           
                } else if tabIndex == 2 {
                    ScrollView{
                        ForEach(arrayBrindes,id: \.self){ modelo in
                            ItemLoja(alunoCoins: al.coins!, item: modelo)
                        }
                    }
                }
                
                Spacer()
                
            }
        }
        .background(Color("TaskBackground"))
        .cornerRadius(15)
        .padding()
    }
    
}



// Cada item das lojas
struct ItemLoja: View {
    var alunoCoins: Int
    var item : Modelo
    @State var moeda : Moeda?
    
    var body: some View {
        ZStack{
            //Cada item da loja
            
            HStack{
                Spacer()
                AvatarView(url: URL(string: item.img)!, size: 70)
                Spacer()
                VStack(spacing: 5){
                    Text(item.nome)
                        .font(.system(size:22, weight: .bold))
                    HStack{
                        Text("\(item.preco)")
                        Image(systemName: "bitcoinsign.circle.fill")
                            .foregroundColor(.yellow)
                    }.font(.system(size:16, weight: .semibold))
                    
                }
                .foregroundColor(.white)
                Spacer()
                Button("Comprar")
                {
                    Moeda.global = Moeda.global - item.preco
                }
                //Text("Comprar")
                .foregroundColor(.yellow)
                .font(.system(size:22, weight: .semibold))
                Spacer()
                
            }
            .frame(width: 330,height: 100)
            .background(Color("TaskBackgroundDark"))
            .cornerRadius(20)
            .padding()
            
        }
    }
}


struct Background_Previews: PreviewProvider {
    static var previews: some View {
        Loja(aluno: Aluno(
            nome: "Nickolas",
            xp: 80,
            coins: 1000,
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
