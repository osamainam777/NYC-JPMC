//
//  SchoolView.swift
//  NYC-JPMC
//
//  Created by Usama Inaam Rasheed on 1/11/23.
//

import Foundation
import SwiftUI


struct SchoolView: View {
    var school: School
    @State var satScore: Score?
    @ObservedObject var viewModel = SchoolViewModel()
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Text(school.school_name ?? "")
                            .font(.title3)
                            .bold()
                            .padding(.bottom, 5)
                        Text("Test Takers: " + (satScore?.num_of_sat_test_takers ?? "-"))
                        Text("SAT Avgerage Math Score: " + (satScore?.sat_math_avg_score ?? "-"))
                        Text("SAT Avgerage Reading Score: " + (satScore?.sat_critical_reading_avg_score ?? "-"))
                        Text("SAT Avgerage Writing Score: " + (satScore?.sat_writing_avg_score ?? "-"))
                    }
                    .padding()
                    Divider()
                    VStack(alignment: .leading) {
                        Text("Overview: ")
                            .bold()
                            .padding(.bottom, 5)
                        Text(school.overview_paragraph ?? "")
                    }
                    .padding()

                    Divider()

                    VStack(alignment: .leading, spacing: 5) {
                        Text("Address: \(school.location ?? "-")")
                        Text("Phone: \(school.phone_number ?? "-")")
                        Text("Website: \(school.website ?? "-")")
                    }
                    .padding()
                }
                .onAppear {
                    viewModel.getSatData(with: school.dbn ?? "") { success in
                        if success {
                            self.satScore = viewModel.satScore
                        }
                    }
                }
            }
        }
        .navigationTitle(school.school_name ?? "")
    }
}

struct SchoolView_Previews: PreviewProvider {
    static var previews: some View {
        SchoolView(school: School())
    }
}

