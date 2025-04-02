import SwiftUI

// Classe para armazenar a variável global
class GlobalData: ObservableObject {
    @Published var selectedValue: String = "Nenhum"
}

struct ContentView: View {
    @StateObject var globalData = GlobalData() // Criamos a instância da classe GlobalData

    var body: some View {
        NavigationView {
            VStack {
                Text("Tela Inicial")
                    .font(.largeTitle)
                    .padding()

                Text("Valor Selecionado: \(globalData.selectedValue)")
                    .font(.headline)
                    .padding()

                NavigationLink(destination: SecondView().environmentObject(globalData)) {
                    Text("Ir para a Segunda Tela")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
    }
}

struct SecondView: View {
    @EnvironmentObject var globalData: GlobalData

    var body: some View {
        VStack {
            Text("Se você fosse embaixador do Academy, o que você faria?")
                .font(.title2)
                .padding()
    
            Text("Valor Atual: \(globalData.selectedValue)")
                .font(.headline)
                .padding()

            NavigationLink(destination: ThirdView().environmentObject(globalData)) {
                Text("Hopi Hari!")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .simultaneousGesture(TapGesture().onEnded {
                globalData.selectedValue = "Botão 1 clicado"
            })

            NavigationLink(destination: ThirdView().environmentObject(globalData)) {
                Text("Karaokê")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .simultaneousGesture(TapGesture().onEnded {
                globalData.selectedValue = "Botão 2 clicado"
            })
            NavigationLink(destination: ThirdView().environmentObject(globalData)) {
                Text("Coffee Break")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .simultaneousGesture(TapGesture().onEnded {
                globalData.selectedValue = "Botão 3 clicado"
            })
            NavigationLink(destination: ThirdView().environmentObject(globalData)) {
                Text("Competição de ping pong")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .simultaneousGesture(TapGesture().onEnded {
                globalData.selectedValue = "Botão 4 clicado"
            })
        }
    }
}

struct ThirdView: View {
    @EnvironmentObject var globalData: GlobalData

    var body: some View {
        VStack {
            Text("O que você prefere fazer no seu tempo livre?")
                .font(.largeTitle)
                .padding()

            Text("Valor Atual: \(globalData.selectedValue)")
                .font(.headline)
                .padding()

            NavigationLink(destination: FourthView().environmentObject(globalData)) {
                Text("Sair com os amigos")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .simultaneousGesture(TapGesture().onEnded {
                globalData.selectedValue = globalData.selectedValue+"Botão 1 clicado"
            })

            NavigationLink(destination: FourthView().environmentObject(globalData)) {
                Text("Contemplar a natureza")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .simultaneousGesture(TapGesture().onEnded {
                globalData.selectedValue = "Botão 2 clicado"
            })
            NavigationLink(destination: FourthView().environmentObject(globalData)) {
                Text("Sair com a família")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .simultaneousGesture(TapGesture().onEnded {
                globalData.selectedValue = "Botão 3 clicado"
            })
            NavigationLink(destination: FourthView().environmentObject(globalData)) {
                Text("Ler")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .simultaneousGesture(TapGesture().onEnded {
                globalData.selectedValue = "Botão 4 clicado"
            })
        }
    }
}

struct FourthView: View {
    @EnvironmentObject var globalData: GlobalData

    var body: some View {
        VStack {
            Text("Escolha uma emoção que tem sido frequente na sua vida")
                .font(.title2)
                .padding()

            Text("Valor Atual: \(globalData.selectedValue)")
                .font(.headline)
                .padding()

            NavigationLink(destination: FifthView().environmentObject(globalData)) {
                Text("Felicidade")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .simultaneousGesture(TapGesture().onEnded {
                globalData.selectedValue = globalData.selectedValue+"Botão 1 clicado"
            })

            NavigationLink(destination: FifthView().environmentObject(globalData)) {
                Text("Raiva")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .simultaneousGesture(TapGesture().onEnded {
                globalData.selectedValue = "Botão 2 clicado"
            })
            NavigationLink(destination: FifthView().environmentObject(globalData)) {
                Text("Ansiedade")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .simultaneousGesture(TapGesture().onEnded {
                globalData.selectedValue = "Botão 3 clicado"
            })
            NavigationLink(destination: FifthView().environmentObject(globalData)) {
                Text("Curiosidade")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .simultaneousGesture(TapGesture().onEnded {
                globalData.selectedValue = "Botão 4 clicado"
            })
        }
    }
}

struct FifthView: View {
    @EnvironmentObject var globalData: GlobalData

    var body: some View {
        VStack {
            Text("Comida favorita do bandeco")
                .font(.largeTitle)
                .padding()

            Text("Valor Atual: \(globalData.selectedValue)")
                .font(.headline)
                .padding()

            NavigationLink(destination: ResultView().environmentObject(globalData)) {
                Text("Macarrão")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .simultaneousGesture(TapGesture().onEnded {
                globalData.selectedValue = globalData.selectedValue+"Botão 1 clicado"
            })

            NavigationLink(destination: ResultView().environmentObject(globalData)) {
                Text("Guardanapos")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .simultaneousGesture(TapGesture().onEnded {
                globalData.selectedValue = "Botão 2 clicado"
            })
            NavigationLink(destination: ResultView().environmentObject(globalData)) {
                Text("Nuggets")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .simultaneousGesture(TapGesture().onEnded {
                globalData.selectedValue = "Botão 3 clicado"
            })
            NavigationLink(destination: ResultView().environmentObject(globalData)) {
                Text("Quibe")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .simultaneousGesture(TapGesture().onEnded {
                globalData.selectedValue = "Botão 4 clicado"
            })
        }
    }
}

struct ResultView: View {
    @EnvironmentObject var globalData: GlobalData

    var body: some View {
        VStack {
            Text("Resultado")
                .font(.largeTitle)
                .padding()
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
