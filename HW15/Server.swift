import Network
import Foundation

class Server {
    var listener: NWListener?
    var receiveDataCallback: ((DataModel) -> Void)?
    
    init(receiveDataCallback: ((DataModel) -> Void)? = nil) {
        self.receiveDataCallback = receiveDataCallback
        startListening()
    }
    
    func startListening() {
        do {
            listener = try NWListener(using: .tcp, on: 8080)
            listener?.stateUpdateHandler = { state in
                switch state {
                case .ready:
                    print("Server is ready.")
                case .failed(let error):
                    print("Server failed with error: \(error)")
                default:
                    break
                }
            }
            listener?.newConnectionHandler = { [weak self] newConnection in
                self?.handleNewConnection(newConnection)
            }
            listener?.start(queue: .main)
        } catch {
            print("Failed to start listener: \(error)")
        }
    }
    
    func handleNewConnection(_ connection: NWConnection) {
        connection.start(queue: .main)
        receiveData(on: connection)
    }
    
    func receiveData(on connection: NWConnection) {
        connection.receive(minimumIncompleteLength: 1, maximumLength: 65536) { data, _, isComplete, error in
            if let data = data, !data.isEmpty {
                self.processReceivedData(data)
            }
            if isComplete {
                connection.cancel()
            } else if let error = error {
                print("Connection error: \(error)")
            } else {
                self.receiveData(on: connection)
            }
        }
    }
    
    func processReceivedData(_ data: Data) {
        do {
            let dataModel = try JSONDecoder().decode(DataModel.self, from: data)
            print("Received data: \(dataModel)")
            receiveDataCallback?(dataModel)
        } catch {
            print("Failed to decode data: \(error)")
        }
    }
}

