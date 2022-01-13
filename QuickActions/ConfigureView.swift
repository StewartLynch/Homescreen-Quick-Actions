//
//  ConfigureView.swift
//  QuickActions
//
//  Created by Stewart Lynch on 2022-01-12.
//

import SwiftUI

struct ConfigureView: View {
    @EnvironmentObject var vm: ViewModel
    @Binding var showConfiguration: Bool
    let classifications = Item.Classification.allCases.filter { $0 != .all }
    var body: some View {
        NavigationView {
            List(classifications, id: \.self) { classification in
                HStack {
                    Text(classification.rawValue.capitalized)
                    Spacer()
                    Button {
                        if let index = vm.selectedItems.firstIndex(where: {$0 == classification}) {
                            vm.selectedItems.remove(at: index)
                        } else {
                            vm.selectedItems.append(classification)
                        }
                    } label: {
                        Image(systemName: vm.selectedItems.contains(classification)
                              ? "checkmark.square.fill"
                              : "square"
                        )
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Configuration")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        withAnimation {
                            showConfiguration.toggle()
                        }
                    } label: {
                        Image(systemName: "x.circle.fill")
                    }
                }
            }
        }
        .shadow(color: .black.opacity(0.2), radius: 10)
        .frame(width: 200, height: 225)
    }
}

struct ConfigureView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigureView(showConfiguration: .constant(true))
            .environmentObject(ViewModel())
    }
}
