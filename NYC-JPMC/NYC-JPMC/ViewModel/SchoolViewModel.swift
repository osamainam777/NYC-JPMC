//
//  SchoolViewModel.swift
//  NYC-JPMC
//
//  Created by Usama Inaam Rasheed on 1/11/23.
//

import Foundation

class SchoolViewModel: ObservableObject {

    //MARK: Properties
    @Published var nycSchoolData:[School] = []
    @Published var satScore: Score?
    private var error: Error?

    //MARK: Methods
    ///We use this method to get flight data from API
    func getData(completionHandler : @escaping (_ success: Bool) -> ()) {
        APIHandler().fetchData(urlString: URLString.nycSchoolDirectory, of: [School].self) { [weak self] result in
            switch result {
            case .failure(let error):
                self?.error = error
                completionHandler(false)
            case .success(let data):
                DispatchQueue.main.async {
                    self?.nycSchoolData = data
                    completionHandler(true)
                }
            }
        }
    }

    func getSatData(with schoolDbn: String, completionHandler : @escaping (_ success: Bool) -> ()) {
        APIHandler().fetchData(urlString: URLString.satScore, with: schoolDbn, of: [Score].self) { [weak self] result in
            switch result {
            case .failure(let error):
                self?.error = error
                completionHandler(false)
            case .success(let data):
                DispatchQueue.main.async {
                    self?.satScore = data.first
                    completionHandler(true)
                }
            }
        }
    }
}
