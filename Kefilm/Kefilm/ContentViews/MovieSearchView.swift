//
//  MovieSearchView.swift
//  Kefilm
//
//  Created by Oguz Demırhan on 10.02.2021.
//

import SwiftUI

struct MovieSearchView: View {
    
    @ObservedObject var movieSearchState = MovieSearchState()
    
    var body: some View {
        
        NavigationView {
            List {
                SearchBarView(placeholder: "Search For Movies", text: self.$movieSearchState.query)
                    .listRowInsets(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0))
                
                LoadingView(isLoading: self.movieSearchState.isLoading, error: self.movieSearchState.error) {
                    self.movieSearchState.search(query: self.movieSearchState.query)
                }
                
                if self.movieSearchState.movies != nil {
                    ForEach(self.movieSearchState.movies!) { movie in
                        
                        NavigationLink(destination: MovieDetailView(movieID: movie.id)){
                            VStack(alignment:.leading){
                                Text(movie.title).fontWeight(.medium)
                                Text("(\(movie.yearText))").fontWeight(.light)
                            }
                        }
                    }
                }
            }
            .onAppear{
                self.movieSearchState.startObserve()
            }
            .navigationBarTitle("Search")
        }
        
        
    }
}

struct MovieSearchView_Previews: PreviewProvider {
    static var previews: some View {
        MovieSearchView()
    }
}
