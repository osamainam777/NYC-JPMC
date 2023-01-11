//
//  ContentView.swift
//  NYC-JPMC
//
//  Created by Usama Inaam Rasheed on 1/11/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = SchoolViewModel()
    @State var schools: [School] = []
    @State var showScoolView: Bool = false
    @State var schoolview: SchoolView?

    var body: some View {
        NavigationView {
            VStack {
                Text("NYC Schools")
                    .font(.title)
                ScrollView {
                    NavigationLink(destination: schoolview, isActive: $showScoolView) {
                        EmptyView()
                            .hidden()
                    }
                    ForEach(schools, id: \.self) { school in
                        VStack(alignment: .leading) {
                            Text(school.school_name ?? "")
                                .font(.title3)
                                .bold()
                            Spacer()
                            Text("\(school.city ?? ""), \(school.state_code ?? ""), \(school.zip ?? "")")
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.blue)
                            Divider()
                        }
                        .padding()
                        .onTapGesture {
                            schoolview = SchoolView(school: school)
                            showScoolView = true
                        }
                    }
                }
            }
            .padding()
            .onAppear {
                viewModel.getData { success in
                    if success {
                        schools = viewModel.nycSchoolData
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
