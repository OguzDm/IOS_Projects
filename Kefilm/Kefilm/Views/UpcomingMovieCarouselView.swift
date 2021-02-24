//
//  UpcomingMovieCarouselView.swift
//  Kefilm
//
//  Created by Oguz Demırhan on 10.02.2021.
//

import SwiftUI

struct UpcomingMovieCarouselView: View {
    
    
    let movies: [Movie]
    
    var body: some View {
        VStack(alignment:.leading,spacing: 0 ) {
          
            ScrollView(.horizontal, showsIndicators: false){
                
                HStack(alignment:.top,spacing:16){
                    ForEach(self.movies) { movie in
                        NavigationLink(destination:MovieDetailView(movieID: movie.id)){
                            UpcomingMovieCard(movie: movie)
                                
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.leading, movie.id == self.movies.first!.id ? 16 : 0)
                        .padding(.trailing, movie.id == self.movies.last!.id ? 16 : 0)
                        
                    }
                }
            }
        }
    }
}

struct UpcomingMovieCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingMovieCarouselView(movies: Movie.stubbedMovies)
    }
}
