import SwiftUI

struct ContentView15: View {
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        VStack {
            Text("Distributed Data Processing System")
                .font(.largeTitle)
                .padding()

            List(viewModel.dataModels) { dataModel in
                Text("\(dataModel.data)")
            }
            .padding()
            
            HStack {
                Button(action: viewModel.startServer) {
                    Text("Start Server")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Button(action: viewModel.connectClient) {
                    Text("Connect Client")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
        .padding()
        .onAppear {
            viewModel.initialize()
        }
    }
}

class ContentViewModel: ObservableObject {
    @Published var dataModels: [DataModel] = []
    
    private var server: Server?
    private var client: Client?
    
    func initialize() {
        server = Server(receiveDataCallback: { [weak self] dataModel in
            DispatchQueue.main.async {
                self?.dataModels.append(dataModel)
            }
        })
    }
    
    func startServer() {
        server?.startListening()
    }
    
    func connectClient() {
        client = Client()
        client?.sendData(dataModel: DataModel(id: UUID(), data: "New data"))
    }
}

