//
//  SchoolModel.swift
//  NYC-JPMC
//
//  Created by Usama Inaam Rasheed on 1/11/23.
//

import Foundation

struct School : Codable, Hashable {
    var dbn: String?
    var school_name: String?
    var city: String?
    var zip: String?
    var state_code: String?
    var school_email: String?
    var overview_paragraph: String?
    var location: String?
    var website: String?
    var phone_number: String?
}
