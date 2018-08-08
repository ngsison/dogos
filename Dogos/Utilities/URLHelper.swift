//
//  URLHelper.swift
//  Dogos
//
//  Created by Nathaniel SISON on 8/8/2018.
//  Copyright © 2018 Nathaniel Brion Sison. All rights reserved.
//

import Foundation

class URLHelper {
    static func getImagesByBreedURL(_ breed: String) -> String {
        return "\(Constants.BASE_URL)breed/\(breed)/images"
    }
}
