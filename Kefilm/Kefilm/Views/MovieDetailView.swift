//
//  MovieDetailView.swift
//  Kefilm
//
//  Created by Oguz Demırhan on 31.01.2021.
//

import SwiftUI

struct MovieDetailView: View {
    let movieID: Int
    @ObservedObject private var movieDetailState = MovieDetailState()
    
    var body: some View {
        ZStack {
            LoadingView(isLoading: self.movieDetailState.isLoading, error: self.movieDetailState.error) {
                self.movieDetailState.loadMovie(id: self.movieID)
            }
            
            if movieDetailState.movie != nil {
                MovieDetailListView(movie: self.movieDetailState.movie!)
            }
        }
        .navigationBarTitle(movieDetailState.movie?.title ?? "")
        .onAppear {
            self.movieDetailState.loadMovie(id: movieID)
        
            
        }
    }
}

struct MovieDetailListView: View {
    
    let movie : Movie
    @State private var selectedTrailer : MovieVideo?
    
    var body: some View {
        List {
            MovieDetailImage(imageURL: self.movie.backdropURL)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                
            HStack {
                Text(movie.genreText)
                    .fontWeight(.light)
                Text(movie.yearText)
                    .fontWeight(.light)
                Text(movie.durationText)
                    .fontWeight(.light)
                Text(movie.budgetText)
                    .fontWeight(.light)
            }
            
            Text(movie.overview)
            HStack {
                if !movie.ratingText.isEmpty {
                    Text(movie.ratingText)
                }
                Text(movie.scoreText)
            }
            
            HStack(alignment:.top,spacing:4){
                VStack(alignment:.leading,spacing:5){
                    Text("Casts")
                        .font(.headline)
                    ForEach(self.movie.cast!.prefix(9)) { cast in
                        Text(cast.name).font(.subheadline)
                    }
                    
                }
                
                if movie.crew != nil && movie.crew!.count > 0 {
                    VStack(alignment:.leading,spacing:4){
                        
                        if movie.directors != nil && movie.directors!.count > 0 {
                            Text("Director(s)").font(.headline)
                            ForEach(self.movie.directors!.prefix(3)){ crew in
                                
                                Text(crew.name).font(.subheadline)
                                
                            }
                        }
                        
                        if movie.producers != nil && movie.producers!.count > 0 {
                            Text("Producer(s)").font(.headline)
                            ForEach(self.movie.producers!.prefix(2)){ producer in
                                
                                Text(producer.name).font(.subheadline)
                                
                            }
                        }
                    }
                }
                
               
                
                
            }
            
            if movie.youtubeTrailers != nil && movie.youtubeTrailers!.count > 0 {
                Text("Trailers").font(.headline)
                    .frame(maxWidth:.infinity,alignment:.center)
                ForEach(movie.youtubeTrailers!){ trailer in
                    Button(action: {
                        self.selectedTrailer = trailer
                    }){
                        HStack{
                            Text(trailer.name)
                            Image(systemName: "play.circle").foregroundColor(Color(UIColor.systemRed))
                            
                        }
                    }
                    
                }
            }
            

            
        }
        .sheet(item: self.$selectedTrailer){ trailer in
            
            SafariView(url: trailer.youtubeURL!)
        }
        
        
        
        
    }
    
}

struct MovieDetailImage: View {
    
    @ObservedObject private var imageLoader = ImageLoader()
    let imageURL: URL
    
    var body: some View {
        ZStack {
            Rectangle().fill(Color(UIColor.secondarySystemBackground))
            if self.imageLoader.image != nil {
                Image(uiImage: self.imageLoader.image!)
                    .resizable()
                
                    
                   
            }
        }
        .aspectRatio(16/9, contentMode: .fit)
        .onAppear {
            self.imageLoader.loadImage(with: self.imageURL)
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            MovieDetailView(movieID: Movie.stubbedMovie.id)
        }
        
    }
}
