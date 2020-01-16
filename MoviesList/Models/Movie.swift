//
//  Movie.swift
//  Movies
//
//  Created by Eduardo Leite on 04/09/19.
//  Copyright © 2019 Cubos. All rights reserved.
//

import UIKit

class Movie: NSObject, Decodable {
    // swiftlint:disable identifier_name
    var poster_path: String?
    var title: String?
    var overview: String?
}
