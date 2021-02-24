//
//  UpcomingMovieView.swift
//  Kefilm
//
//  Created by Oguz Demırhan on 10.02.2021.
//

import SwiftUI

struct UpcomingMovieView: View {
    
    @ObservedObject private var nowPlayingState = MovieListState()
    @ObservedObject private var upcomingState = MovieListState()
    @ObservedObject private var topRatedState = MovieListState()
    @ObservedObject private var popularState = MovieListState()
    
    
    var body: some View {
        
        NavigationView {
            HStack{
                
                    if upcomingState.movies != nil {
                        UpcomingMovieCarouselView(movies: upcomingState.movies!)
                    }
                    else {
                        LoadingView(isLoading: self.upcomingState.isLoading, error: self.upcomingState.error) {
                            upcomingState.loadMovies(with: .upcoming)
                        }
                    }
                
                //.listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                
                
            }
            .onAppear {
                self.upcomingState.loadMovies(with: .upcoming)
            }
            .navigationBarTitle("Upcoming")
            
        }
    }
}


struct UpcomingMovieView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingMovieView()
    }
}
