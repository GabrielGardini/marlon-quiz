import SwiftUI
import AVFoundation


// Classe para armazenar a variável global
class GlobalData: ObservableObject {
    @Published var selectedValue: String = "Nenhum"
    
    var player: AVAudioPlayer?

    
    func prepareSound(name: String, ext:String) {
        if let soundURL = Bundle.main.url(forResource: name, withExtension: ext) {
            do {
                player = try AVAudioPlayer(contentsOf: soundURL)
                player?.prepareToPlay()
                print("Sound file loaded successfully")
            } catch {
                print("Error loading sound file: \(error.localizedDescription)")
            }
        } else {
            print("Sound file not found")
        }
    }
    
}

let chavesImagens: [Character: String] = [
    "a": "imageA",
    "b": "imageB",
    "c": "imageC",
    "d": "imageA",
    "e": "imageB",
    "f": "borboleta",
    "g": "imageA",
    "h": "imageB",
    "i": "imageC",
    "j": "imageA",
    "k": "imageB",
    "l": "imageC",
    "m": "imageA",
    "n": "imageB",
    "o": "imageC",
    "p": "imageA"
]


struct ContentView: View {
    @EnvironmentObject var globalData: GlobalData // Criamos a instância da classe GlobalData


    var body: some View {
       // NavigationView {
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
        //}
    }
}

struct SecondView: View {
    @EnvironmentObject var globalData: GlobalData
    
    var player: AVAudioPlayer?



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
                globalData.selectedValue = "a"
            })

            NavigationLink(destination: ThirdView().environmentObject(globalData)) {
                Text("Karaokê")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .simultaneousGesture(TapGesture().onEnded {
                globalData.selectedValue = "b"
            })
            NavigationLink(destination: ThirdView().environmentObject(globalData)) {
                Text("Coffee Break")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .simultaneousGesture(TapGesture().onEnded {
                globalData.selectedValue = "c"
            })
            NavigationLink(destination: ThirdView().environmentObject(globalData)) {
                Text("Competição de ping pong")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .simultaneousGesture(TapGesture().onEnded {
                globalData.selectedValue = "d"
            })
        }.onAppear(perform:{
            globalData.prepareSound(name: "click",ext:"m4a")
            globalData.player?.play()})

    }
}

struct ThirdView: View {
    @EnvironmentObject var globalData: GlobalData
    
    
    init() {
        print("Estou passando por aqui - 3rd view")
    }


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
                globalData.selectedValue = globalData.selectedValue+"e"
            })

            NavigationLink(destination: FourthView().environmentObject(globalData)) {
                Text("Contemplar a natureza")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .simultaneousGesture(TapGesture().onEnded {
                globalData.selectedValue = globalData.selectedValue+"f"
            })
            NavigationLink(destination: FourthView().environmentObject(globalData)) {
                Text("Sair com a família")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .simultaneousGesture(TapGesture().onEnded {
                globalData.selectedValue = globalData.selectedValue+"g"
            })
            NavigationLink(destination: FourthView().environmentObject(globalData)) {
                Text("Ler")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .simultaneousGesture(TapGesture().onEnded {
                globalData.selectedValue = globalData.selectedValue+"h"
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
                globalData.selectedValue = globalData.selectedValue+"i"
            })

            NavigationLink(destination: FifthView().environmentObject(globalData)) {
                Text("Raiva")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .simultaneousGesture(TapGesture().onEnded {
                globalData.selectedValue = globalData.selectedValue+"j"
            })
            NavigationLink(destination: FifthView().environmentObject(globalData)) {
                Text("Ansiedade")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .simultaneousGesture(TapGesture().onEnded {
                globalData.selectedValue = globalData.selectedValue+"k"
            })
            NavigationLink(destination: FifthView().environmentObject(globalData)) {
                Text("Curiosidade")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .simultaneousGesture(TapGesture().onEnded {
                globalData.selectedValue = globalData.selectedValue+"l"
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
                globalData.selectedValue = globalData.selectedValue+"m"
            })

            NavigationLink(destination: ResultView().environmentObject(globalData)) {
                Text("Guardanapos")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .simultaneousGesture(TapGesture().onEnded {
                globalData.selectedValue = globalData.selectedValue+"n"
            })
            NavigationLink(destination: ResultView().environmentObject(globalData)) {
                Text("Nuggets")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .frame(width: 450, height: 50)
            }
            .simultaneousGesture(TapGesture().onEnded {
                globalData.selectedValue = globalData.selectedValue+"o"
            })
            NavigationLink(destination: ResultView().environmentObject(globalData)) {
                Text("Quibe")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .simultaneousGesture(TapGesture().onEnded {
                globalData.selectedValue = globalData.selectedValue+"p"
            })
        }
    }
}

struct ResultView: View {
    @EnvironmentObject var globalData: GlobalData
    var player: AVAudioPlayer?

    init() {
        if let soundURL = Bundle.main.url(forResource: "Versions of Me (Cover)", withExtension: "mp3") {
            do {
                player = try AVAudioPlayer(contentsOf: soundURL)
                player?.prepareToPlay()
                print("Sound file loaded successfully")
            } catch {
                print("Error loading sound file: \(error.localizedDescription)")
            }
        } else {
            print("Sound file not found")
        }
    }
    
    func randomCharacter(from text: String) -> Character? {
        let strippedText = text.trimmingCharacters(in: .whitespacesAndNewlines) // Remove espaços e quebras de linha
        guard !strippedText.isEmpty else { return nil } // Verifica se a string não está vazia
        
        let characters = Array(strippedText) // Converte para um array de caracteres
        return characters.randomElement() // Retorna um caractere aleatório
    }

    var fotoEscolhida: Character? {
        randomCharacter(from: globalData.selectedValue)
    }
    var body: some View {
        VStack {
            Image(chavesImagens[fotoEscolhida!] ?? "macarrao")
                .resizable() // Permite redimensionar
                .scaledToFit() // Ajusta a imagem proporcionalmente ao espaço disponível
                .frame(width: 250, height: 250).onAppear(perform: {globalData.prepareSound(name: "Versions of Me (Cover)", ext:"mp3")
                    globalData.player?.play()})
            Text("Resultado")
                .font(.largeTitle)
                .padding()
            
            Text(globalData.selectedValue)
                .font(.largeTitle)
                .padding()
            
            if let foto = fotoEscolhida {
                Text(String(foto)) // ✅ Convertendo Character para String
                    .font(.largeTitle)
                    .padding()
            } else {
                Text("Nenhum caractere disponível")
                    .font(.title)
                    .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
