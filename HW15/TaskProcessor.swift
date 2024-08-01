import Foundation

class TaskProcessor {
    func processDataAsync(data: DataModel, completion: @escaping (Result<DataModel, Error>) -> Void) {
        DispatchQueue.global().async {
            // Имитация обработки данных
            var processedData = data
            processedData.data += " processed"
            DispatchQueue.main.async {
                completion(.success(processedData))
            }
        }
    }
}

