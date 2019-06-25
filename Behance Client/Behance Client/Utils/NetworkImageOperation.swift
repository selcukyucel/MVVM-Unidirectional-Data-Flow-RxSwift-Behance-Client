//
//  NetworkImageOperation.swift
//  Behance Client
//
//  Created by Selcuk Yucel on 24/06/2019.
//  Copyright © 2019 The Bull Studio Ltd. All rights reserved.
//

import UIKit

final class NetworkImageOperation: AsyncOperation {
    var image: UIImage?
    
    private let url: URL
    private let completion: ((Data?, URLResponse?, Error?) -> Void)?
    
    init(url: URL, completion: ((Data?, URLResponse?, Error?) -> Void)? = nil) {
        
        self.url        = url
        self.completion = completion
        
        super.init()
    }
    
    convenience init?(string: String, completion: ((Data?, URLResponse?, Error?) -> Void)? = nil) {
        
        guard let url   = URL(string: string) else { return nil }
        self.init(url: url, completion: completion)
    }
    
    override func main() {
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            
            defer { self.state = .finished }
            
            if let completion = self.completion {
                completion(data, response, error)
                return
            }
            
            guard error == nil, let data = data else { return }
            
            self.image = UIImage(data: data)
            }.resume()
    }
}
