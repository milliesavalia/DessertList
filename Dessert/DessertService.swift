import Foundation

protocol DessertServiceProtocol {
    func requestData(completion: @escaping (Result<[Meal]?, Error>) -> Void)
    func requestDessertData(mealId: String, completion: @escaping (Result<Meal?, Error>) -> Void)
}

final class DessertService: DessertServiceProtocol {
    func requestData(completion: @escaping (Result<[Meal]?, Error>) -> Void) {
        let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, _ in
            if let data = data {
                if let jsonData = try? JSONDecoder().decode(ResponseData.self, from: data) {
                    return completion(.success(jsonData.meals))
                } else {
                    return completion(.failure(JsonParsingError()))
                }
            } else {
                return completion(.failure(LoadingError()))
            }
        }
        task.resume()
    }
    
    func requestDessertData(mealId: String, completion: @escaping (Result<Meal?, Error>) -> Void) {
        if let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealId)") {
            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request) { data, _, _ in
                if let data = data {
                    if let jsonData = try? JSONDecoder().decode(ResponseData.self, from: data) {
                        return completion(.success(jsonData.meals.first))
                    } else {
                        return completion(.failure(JsonParsingError()))
                    }
                } else {
                    return completion(.failure(LoadingError()))
                }
            }
            task.resume()
        }
    }
}

struct LoadingError: Error {}
struct JsonParsingError: Error {}
