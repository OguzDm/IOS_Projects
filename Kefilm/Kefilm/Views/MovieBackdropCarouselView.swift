//
//  MovieBackdropCarouselView.swift
//  Kefilm
//
//  Created by Oguz Demırhan on 30.01.2021.
//

import SwiftUI

struct MovieBackdropCarouselView: View {
    
    
    let movies: [Movie]
    
    var body: some View {
        VStack(alignment:.leading,spacing: 0 ) {
         
            
            
            ScrollView(.vertical,showsIndicators: false){
                
            
                VStack {
                    ScrollView(.horizontal, showsIndicators: false){
                        
                        HStack(alignment:.top,spacing:16){
                            
                            ForEach(self.movies.prefix(upTo: 4)) { movie in
                                
                                NavigationLink(destination:MovieDetailView(movieID: movie.id)){
                                    MovieBackDropCard(movie: movie)
                    
                                        .frame(width: 272, height: 200)
                                        .padding(.leading,movie.id == self.movies.first!.id ? 16 : 0)
                                        .padding(.trailing,movie.id == self.movies.last!.id ? 16:0)
                        }
                                .buttonStyle(PlainButtonStyle())
                        
                        }
                    }
                    }
                    
                    
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(alignment:.top,spacing:16){
                            ForEach(self.movies.suffix(from: 4).prefix(upTo: 8)) { movie in
                                NavigationLink(destination:MovieDetailView(movieID: movie.id)){
                                    MovieBackDropCard(movie: movie)
                    
                                        .frame(width: 272, height: 200)
                                        .padding(.leading,movie.id == self.movies[4].id ? 16 : 0)
                                        .padding(.trailing,movie.id == self.movies.last!.id ? 16:0)
                        }
                                    .buttonStyle(PlainButtonStyle())
                        
                        }
                    }
                    }
                    
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(alignment:.top,spacing:16){
                            ForEach(self.movies.suffix(from: 8).prefix(upTo: 12)) { movie in
                                NavigationLink(destination:MovieDetailView(movieID: movie.id)){
                                    MovieBackDropCard(movie: movie)
                    
                                        .frame(width: 272, height: 200)
                                        .padding(.leading,movie.id == self.movies[8].id ? 16 : 0)
                                        .padding(.trailing,movie.id == self.movies.last!.id ? 16:0)
                        }
                                .buttonStyle(PlainButtonStyle())
                        
                        }
                            }
                                }
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(alignment:.top,spacing:16){
                            ForEach(self.movies.suffix(from: 12).prefix(upTo: 16)) { movie in
                                NavigationLink(destination:MovieDetailView(movieID: movie.id)){
                                    MovieBackDropCard(movie: movie)
                    
                                        .frame(width: 272, height: 200)
                                        .padding(.leading,movie.id == self.movies[12].id ? 16 : 0)
                                        .padding(.trailing,movie.id == self.movies.last!.id ? 16:0)
                        }
                                .buttonStyle(PlainButtonStyle())
                        
                        }
                            }
                                }
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(alignment:.top,spacing:16){
                            ForEach(self.movies.suffix(from: 16).prefix(upTo: 20)) { movie in
                                NavigationLink(destination:MovieDetailView(movieID: movie.id)){
                                    MovieBackDropCard(movie: movie)
                    
                                        .frame(width: 272, height: 200)
                                        .padding(.leading,movie.id == self.movies[16].id ? 16 : 0)
                                        .padding(.trailing,movie.id == self.movies.last!.id ? 16:0)
                        }
                                .buttonStyle(PlainButtonStyle())
                        
                        }
                            }
                                }
                    
                    
                }
                
            }
            
        }
    }
}

struct MovieBackdropCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        MovieBackdropCarouselView(movies: Movie.stubbedMovies)
    }
}
