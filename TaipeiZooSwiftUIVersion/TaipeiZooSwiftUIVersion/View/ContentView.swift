//
//  ContentView.swift
//  TaipeiZooSwiftUIVersion
//
//  Created by user on 2022/12/29.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = AreaViewModel()

    var body: some View {
        NavigationStack {
            ZStack {
                List(viewModel.zooAreaInfos) { zooArea in
                    NavigationLink(value: zooArea) {
                        AnimalCell(data: zooArea)
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .listStyle(.plain)
                .navigationTitle("台北市立動物園")
                .navigationDestination(for: ZooAreaInfo.self
                                       , destination: { areaInfo in
                    AreaDetailView(viewModel: AreaDetailViewModel(areaInfo: areaInfo))
                })
                
                if viewModel.isLoading {
                    ProgressView()
                        .scaleEffect(2)
                }
            }
        }
        .tint(.black)
        .alert(viewModel.errorMessage ?? "", isPresented: .constant(viewModel.errorMessage != nil)) {
            Button(role: .cancel) {
                
            } label: {
                Text("確認")
            }
        }
        .onAppear {
            viewModel.getData()
        }
    }
}

struct AnimalCell: View {
    var data: ZooAreaInfo
    
    var body: some View {
        HStack(spacing: 16) {
            AsyncImage(url: URL(string: data.picUrl), content: { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .transition(.slide)
                case .empty:
                    ZStack {
                        Color.purple.opacity(0.1)
                        ProgressView()
                    }
                case .failure(_):
                    Image(systemName: "exclamationmark.icloud")
                                .resizable()
                                .scaledToFit()
                @unknown default:
                    Image(systemName: "exclamationmark.icloud")
                }
            })
            .frame(width: 150, height: 100)
            .cornerRadius(6)

            VStack(alignment: .leading) {
                Text(data.name)
                    .font(.headline)
                Text(data.info)
                    .font(.subheadline)
                    .lineLimit(2)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension UINavigationController {
    
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        navigationBar.topItem?.backButtonDisplayMode = .minimal
    }
}
