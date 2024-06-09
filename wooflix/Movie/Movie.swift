//
//  Movie.swift
//  wooflix
//
//  Created by 여누 on 6/7/24.
//

import UIKit

struct MovieData : Codable {
    let boxOfficeResult : BoxOfficeResult
}

struct BoxOfficeResult : Codable {
    let dailyBoxOfficeList : [dailyBoxOfficeList]
}
struct dailyBoxOfficeList : Codable{
    let rank : String
    let movieNm : String
    let openDt : String
}

struct moviedate {
    var finddate : String
}
