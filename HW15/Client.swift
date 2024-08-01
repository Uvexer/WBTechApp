import Network
import Foundation

class Client {
    var connection: NWConnection?
    
    init() {
        connect()
    }
    
    func connect() {
        let endpoint = NWEndpoint.hostPort(host: "localhost", port: 8080)
        connection = NWConnection(to: endpoint, using: .tcp)
        connection?.stateUpdateHandler = { state in
            switch state {
            case .ready:
                print("Connected to server")
            case .failed(let error):
                print("Connection failed: \(error)")
            default:
                break
            }
        }
        connection?.start(queue: .main)
    }
    
    func sendData(dataModel: DataModel) {
        if let data = try? JSONEncoder().encode(dataModel) {
            connection?.send(content: data, completion: .contentProcessed({ error in
                if let error = error {
                    print("Failed to send data: \(error)")
                } else {
                    print("Data sent successfully")
                }
            }))
        }
    }
}

