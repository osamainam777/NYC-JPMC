//
//  ScoreModel.swift
//  NYC-JPMC
//
//  Created by Usama Inaam Rasheed on 1/11/23.
//

import Foundation

struct Score: Codable {
    var dbn: String?
    var school_name: String?
    var num_of_sat_test_takers: String?
    var sat_critical_reading_avg_score: String?
    var sat_math_avg_score: String?
    var sat_writing_avg_score: String?
}
