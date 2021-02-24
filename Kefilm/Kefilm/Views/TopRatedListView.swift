//
//  TopRatedListView.swift
//  Kefilm
//
//  Created by Oguz Demırhan on 10.02.2021.
//

import SwiftUI

struct TopRatedListView: View {
    let movies: [Movie]
    
    var body: some View {
        List{
            ForEach(movies) { movie in
                TopRatedRowView(movie: movie)
            }
        }
    }
}

struct TopRatedListView_Previews: PreviewProvider {
    static var previews: some View {
        TopRatedListView(movies: Movie.stubbedMovies)
    }
}
