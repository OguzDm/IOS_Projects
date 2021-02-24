//
//  NowPlayingView.swift
//  Kefilm
//
//  Created by Oguz Demırhan on 11.02.2021.
//

import SwiftUI

struct NowPlayingView: View {
    
    @ObservedObject private var nowPlayingState = MovieListState()
    
    
    var body: some View {
        
        NavigationView {
            HStack{
                
                    if nowPlayingState.movies != nil {
                        UpcomingMovieCarouselView(movies: nowPlayingState.movies!)
                    }
                    else {
                        LoadingView(isLoading: self.nowPlayingState.isLoading, error: self.nowPlayingState.error) {
                            nowPlayingState.loadMovies(with: .nowPlaying)
                        }
                    }
                
                //.listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                
                
            }
            .onAppear {
                self.nowPlayingState.loadMovies(with: .nowPlaying)
            }
            .navigationBarTitle("Now Playing")
            
        }
    }
}

struct NowPlayingView_Previews: PreviewProvider {
    static var previews: some View {
        NowPlayingView()
    }
}
