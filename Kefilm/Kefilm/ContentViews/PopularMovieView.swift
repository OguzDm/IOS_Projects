//
//  PopularMovieView.swift
//  Kefilm
//
//  Created by Oguz Demırhan on 11.02.2021.
//

import SwiftUI

struct PopularMovieView: View {
    @ObservedObject private var popularState = MovieListState()
    
        var body: some View {
            
            NavigationView {
                HStack{
                    
                        if popularState.movies != nil {
                            MovieBackdropCarouselView(movies: popularState.movies!)
                        }
                        else {
                            LoadingView(isLoading: self.popularState.isLoading, error: self.popularState.error) {
                                popularState.loadMovies(with: .popular)
                            }
                        }
                    
                    //.listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    
                    
                }
                .onAppear {
                    self.popularState.loadMovies(with: .popular)
                }
                .navigationBarTitle("Popular")
                
                
                
            }
        }
    
}

struct PopularMovieView_Previews: PreviewProvider {
    static var previews: some View {
        PopularMovieView()
    }
}
