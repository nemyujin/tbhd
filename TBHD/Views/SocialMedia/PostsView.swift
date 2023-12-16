//
//  PostsView.swift
//  SocialMedia
//
//  Created by Balaji on 25/12/22.
//

import SwiftUI

struct PostsView: View {
    @State private var recentsPosts: [Post] = []
    @State private var createNewPost: Bool = false
    var body: some View {
        NavigationStack{
            ReusablePostsView(posts: $recentsPosts)
              
        }
        .fullScreenCover(isPresented: $createNewPost) {
            CreateNewPost { post in
                recentsPosts.insert(post, at: 0)
            }
        }

        .overlay(alignment: .bottomTrailing) {
            Button {
                createNewPost.toggle() // 이 부분을 fullScreenCover의 isPresented와 연결된 바인딩으로 변경
            } label: {
                Image(systemName: "plus")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(13)
                    .background(.black, in: Circle())
                    .offset(x: -20, y: -60)
            }
            .padding(15)
        }

    }
}

struct PostsView_Previews: PreviewProvider {
    static var previews: some View {
        PostsView()
    }
}
