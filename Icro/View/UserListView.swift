//
//  UserListView.swift
//  Icro
//
//  Created by martin on 30.06.19.
//  Copyright © 2019 Martin Hartl. All rights reserved.
//

import SwiftUI
import Kingfisher
import IcroKit

struct UserListView: SwiftUI.View {
    @ObservedObject var viewModel: UserListViewModel
    let itemNavigator: ItemNavigator

    @State var show = false

    var body: some SwiftUI.View {
        List(viewModel.users, id: \Author.name) { author in
            Button(action: {
                self.itemNavigator.open(author: author)
            }, label: {
                HStack {
                    NetworkImage(imageURL: author.avatar)
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    HStack {
                        Text(author.name)
                        .font(.headline)
                        Text(author.username ?? "")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    }
                }
            })
        }
        .navigationBarTitle(Text("Following"))
    }
}
