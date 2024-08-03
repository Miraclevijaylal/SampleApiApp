//
//  PostViewModel.swift
//  TableDemo
//
//  Created by Vijay Lal on 01/08/24.
//

import Foundation
class PostViewModel {
    func fetchPosts(completion: @escaping ([PostModel]?) -> Void) {
        guard let unwrappedURL: URL = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        URLSession.shared.dataTask(with: URLRequest.init(url: unwrappedURL)) { [weak self] data, response, error in
            guard let unwrapSelf = self else { return }
            guard let unwrapData = data else { return }
            do {
                let array = try JSONDecoder().decode([PostModel].self, from: unwrapData)
                print(array)
                completion(array)
            } catch(let error) {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
