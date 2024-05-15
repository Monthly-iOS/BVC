//
//  ViewModel.swift
//  week3_eunsu
//
//  Created by Eunsu JEONG on 5/4/24.
//

import UIKit

final class ViewModel {
    func fetchImage(url: String) async throws -> UIImage {
        let url = URL(string: url)
        
        guard let url = url else {
            throw NSError(domain: "url error", code: 888)
        }
        
        let request = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: request)
            
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode, (200...299).contains(statusCode) else {
            throw NSError(domain: "fetch error", code: 1004)
        }
        
        guard let image = UIImage(data: data) else {
            throw NSError(domain: "image coverting error", code: 999)
        }

        return image
    }
}
