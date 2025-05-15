import SwiftUI
import AVFoundation

// Classe para armazenar a variável global
class GlobalData: ObservableObject {
    @Published var selectedValue: String = "Nenhum"
    
    var player: AVAudioPlayer?
    
    func prepareSound(name: String, ext: String) {
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
    "a": "votando",
    "b": "coup",
    "c": "voando",
    "d": "pingpong",
    "e": "ditador",
    "f": "borboleta",
    "g": "papai",
    "h": "lendo",
    "i": "metropoly",
    "j": "concentrado",
    "k": "estudando",
    "l": "espelho",
    "m": "macarrao",
    "n": "guardanapo",
    "o": "sinuca",
    "p": "macbook"
]

struct ContentView: View {
    @EnvironmentObject var globalData: GlobalData
    
    var body: some View {
        VStack {
            //            Text("Marlon App")
            //                .font(.largeTitle)
            //                .padding()
            Spacer().frame(height: 40)
            Text("Marlon App")
                .font(.system(size: 40, weight: .black, design: .default))
                .foregroundColor(.green)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(
                    Color.white
                )                                                              // fundo degradê
                .cornerRadius(8)                                              // cantos arredondados
                .shadow(color: Color.black.opacity(0.4), radius: 4, x: 2, y: 2) // sombra para “levantar” o texto
            
            
            Spacer()

            Text("Descubra qual Marlon você seria!")
                .font(.title)
                .padding()
            Spacer()
            NavigationLink(destination: SecondView().environmentObject(globalData)) {
                Text("Começar")
                    .padding()
                    .frame(width: 200)
                    .foregroundColor(.black)
                    .background(Color.white)
                    .cornerRadius(5)
            }
            Text("Criado por Gardini e Sofia")
                .font(.headline)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.green)
        .ignoresSafeArea()
    }
}

struct SecondView: View {
    @EnvironmentObject var globalData: GlobalData
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Se você fosse embaixador do Academy, qual evento você faria?")
                .font(.title2)
                .padding()
            
            
            Group {
                makeButton(title: "Hopi Hari!", value: "a")
                makeButton(title: "Karaokê", value: "b")
                makeButton(title: "Coffee Break", value: "c")
                makeButton(title: "Competição de ping pong", value: "d")
            }
        }
        .onAppear {
            globalData.prepareSound(name: "click", ext: "m4a")
            globalData.player?.play()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.green)
        .ignoresSafeArea()
    }
    
    @ViewBuilder
    private func makeButton(title: String, value: String) -> some View {
        NavigationLink(destination: ThirdView().environmentObject(globalData)) {
            Text(title)
                .padding()
                .frame(width: 200)
                .foregroundColor(.black)
                .background(Color.white)
                .cornerRadius(5)
        }
        .simultaneousGesture(TapGesture().onEnded {
            globalData.selectedValue = value
        })
    }
}

struct ThirdView: View {
    @EnvironmentObject var globalData: GlobalData
    
    init() {
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text("O que você prefere fazer no seu tempo livre?")
                .font(.title2)
                .padding()
            
            Group {
                makeButton(title: "Sair com os amigos", suffix: "e")
                makeButton(title: "Contemplar a natureza", suffix: "f")
                makeButton(title: "Sair com a família", suffix: "g")
                makeButton(title: "Ler", suffix: "h")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.green)
        .ignoresSafeArea()
    }
    
    @ViewBuilder
    private func makeButton(title: String, suffix: String) -> some View {
        NavigationLink(destination: FourthView().environmentObject(globalData)) {
            Text(title)
                .padding()
                .frame(width: 200)
                .foregroundColor(.black)
                .background(Color.white)
                .cornerRadius(5)
        }
        .simultaneousGesture(TapGesture().onEnded {
            globalData.selectedValue += suffix
        })
    }
}

struct FourthView: View {
    @EnvironmentObject var globalData: GlobalData
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Escolha uma emoção que tem sido frequente na sua vida")
                .font(.title2)
                .padding()
            
            
            Group {
                emotionButton(title: "Felicidade", suffix: "i")
                emotionButton(title: "Raiva", suffix: "j")
                emotionButton(title: "Ansiedade", suffix: "k")
                emotionButton(title: "Curiosidade", suffix: "l")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.green)
        .ignoresSafeArea()
    }
    
    @ViewBuilder
    private func emotionButton(title: String, suffix: String) -> some View {
        NavigationLink(destination: FifthView().environmentObject(globalData)) {
            Text(title)
                .padding()
                .frame(width: 200)
                .foregroundColor(.black)
                .background(Color.white)
                .cornerRadius(5)
        }
        .simultaneousGesture(TapGesture().onEnded {
            globalData.selectedValue += suffix
        })
    }
}

struct FifthView: View {
    @EnvironmentObject var globalData: GlobalData
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Qual sua comida favorita do bandeco?")
                .font(.title2)
                .padding()
            
            
            Group {
                foodButton(title: "Macarrão", suffix: "m")
                foodButton(title: "Guardanapos", suffix: "n")
                foodButton(title: "Nuggets", suffix: "o")
                foodButton(title: "Quibe", suffix: "p")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.green)
        .ignoresSafeArea()
    }
    
    @ViewBuilder
    private func foodButton(title: String, suffix: String) -> some View {
        NavigationLink(destination: ResultView().environmentObject(globalData)) {
            Text(title)
                .padding()
                .frame(width: 200)
                .foregroundColor(.black)
                .background(Color.white)
                .cornerRadius(5)
        }
        .simultaneousGesture(TapGesture().onEnded {
            globalData.selectedValue += suffix
        })
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
        let strippedText = text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !strippedText.isEmpty else { return nil }
        return Array(strippedText).randomElement()
    }
    
    var fotoEscolhida: Character? {
        randomCharacter(from: globalData.selectedValue)
    }
    
    var body: some View {
        VStack() {
            if let foto = fotoEscolhida,
               let imageName = chavesImagens[foto] {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .padding()
            }
            
            Text("Este é seu Marlon interior e será seu guia espiritual daqui pra frente. Aceite-o em toda sua glória.")
                .font(.headline)
                .padding()
            NavigationLink(destination: ContentView().environmentObject(globalData)) {
                            Text("Tela inicial")
                                .padding()
                                .frame(width: 200)
                                .foregroundColor(.black)
                                .background(Color.white)
                                .cornerRadius(5)
                        }
                        .simultaneousGesture(TapGesture().onEnded {
                            globalData.selectedValue = ""
                        })
            
        }
        .onAppear {
            globalData.prepareSound(name: "Versions of Me (Cover)", ext: "mp3")
            globalData.player?.play()
        }
//        .padding(50)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.green)
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(GlobalData())
    }
}

