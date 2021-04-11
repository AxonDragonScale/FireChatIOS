//
//  ChatsView.swift
//  FireChat
//
//  Created by Ronak Harkhani on 10/04/21.
//

import SwiftUI

struct ChatsView: View {
    var body: some View {
        NavigationView {
            Text("ChatsView")
                .navigationTitle(Text("Chats"))
        }
    }
}

struct ChatsView_Previews: PreviewProvider {
    static var previews: some View {
        ChatsView()
    }
}
