//
//  Bundle-WordLoading.swift
//  Switcharoo
//
//  Created by Dhruv Shah on 2020-06-23.
//  Copyright © 2020 Dhruv Shah. All rights reserved.


//  Turns txt file into set 

import Foundation

extension Bundle {
    
    func words(from filename: String) -> Set<String> {
        guard let fileURL = url(forResource: filename, withExtension: nil) else {
            fatalError("Can't find \(filename)")
        }

        guard let contents = try? String(contentsOf: fileURL) else {
            fatalError("Can't load \(filename)")
        }

        return Set(contents.components(separatedBy: "\n"))
    }
}

