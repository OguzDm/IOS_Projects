//
//  TopRatedView.swift
//  Kefilm
//
//  Created by Oguz Demırhan on 10.02.2021.
//

import SwiftUI

struct TopRatedView: View {
    
    @ObservedObject private var topRatedState = MovieListState()
    var body: some View {
        
        NavigationView {
            List{
                
                    if topRatedState.movies != nil {
                        ForEach(topRatedState.movies!){ movie in
                            
                            NavigationLink(destination:MovieDetailView(movieID: movie.id)){
                                
                                TopRatedRowView(movie: movie)
                                    
                                    
                            }.buttonStyle(PlainButtonStyle())
                            
                            .listRowInsets(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 5))
                        }
                    }
                    else {
                        LoadingView(isLoading: self.topRatedState.isLoading, error: self.topRatedState.error) {
                            topRatedState.loadMovies(with: .topRated)
                        }
                    }
                
                //.listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                
                
            
           
            }
            .onAppear {
                self.topRatedState.loadMovies(with: .topRated)
            }
            .navigationBarTitle("Top Rated")
        }
     
    }
}

struct TopRatedView_Previews: PreviewProvider {
    static var previews: some View {
        TopRatedView()
    }
}
