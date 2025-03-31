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
            Text("Segunda Tela")
                .font(.largeTitle)
                .padding()

            Text("Valor Atual: \(globalData.selectedValue)")
                .font(.headline)
                .padding()

            NavigationLink(destination: ThirdView().environmentObject(globalData)) {
                Text("Botão 1 (Vai para a Terceira Tela)")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .simultaneousGesture(TapGesture().onEnded {
                globalData.selectedValue = "Botão 1 clicado"
            })

            NavigationLink(destination: ThirdView().environmentObject(globalData)) {
                Text("Botão 2 (Vai para a Terceira Tela)")
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .simultaneousGesture(TapGesture().onEnded {
                globalData.selectedValue = "Botão 2 clicado"
            })
        }
    }
}

struct ThirdView: View {
    @EnvironmentObject var globalData: GlobalData

    var body: some View {
        VStack {
            Text("Terceira Tela")
                .font(.largeTitle)
                .padding()

            Text("Valor recebido: \(globalData.selectedValue)")
                .font(.headline)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
