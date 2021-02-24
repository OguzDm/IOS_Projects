//
//  ContentView.swift
//  Kefilm
//
//  Created by Oguz Demırhan on 25.01.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView{
            NowPlayingView().tabItem {
                VStack{
                    Image(systemName: "film")
                    Text("Now Playing")
                }
            }
            
            .tag(0)
            
            
            TopRatedView().tabItem {
                
                VStack{
                    Image(systemName: "star")
                    Text("Top Rated")
                }
            }
            .tag(1)
            
            UpcomingMovieView().tabItem {
                VStack{
                    Image(systemName: "timer")
                    Text("Upcoming")
                }
            }
            .tag(2)
            
            
            PopularMovieView().tabItem {
                VStack{
                    Image(systemName: "sparkles")
                    Text("Popular")
                }
            }
            .tag(3)
           
            
            MovieSearchView().tabItem {
                VStack {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            }
            .tag(4)
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
