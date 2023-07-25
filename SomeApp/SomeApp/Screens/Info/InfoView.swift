//
//  InfoView.swift
//  SomeApp
//
//  Created by Be on 07.07.23.
//

import SwiftUI

struct InfoView: View {
    
    @StateObject var viewModel: InfoViewModel

    var body: some View {
        VStack {
            if viewModel.fetching {
                ProgressView()
            } else if let error = viewModel.error {
                Text("Error: \(error.localizedDescription)")
            } else if let info = viewModel.info {
                Text("Base path: \(info.basePath), api version: \(info.apiVersion)")
            } else {
                Text("Info view")
            }
        }
        .padding()
        .onAppear {
            viewModel.onAppear()
        }
    }
}
