//
//  UpcomingMovieCard.swift
//  Kefilm
//
//  Created by Oguz Demırhan on 10.02.2021.
//

import SwiftUI

struct UpcomingMovieCard: View {
    
    let movie : Movie
    @ObservedObject var imageLoader = ImageLoader()
    
    var body: some View {
        
        ZStack {
            if self.imageLoader.image != nil {
                
                VStack {
                    Image(uiImage: self.imageLoader.image!)
                        .resizable().cornerRadius(8).shadow(radius: 4)
                        .scaledToFit()
                        .frame(width: 380,height:600)
                    Text(movie.title).font(.title2).fontWeight(.light).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    Text("(\(movie.yearText))")
                    //Text("\(movie.overview.components(separatedBy: ".").first!)." ).fontWeight(.light)
                }
                
                    
            }
            else {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .cornerRadius(8)
                    .shadow(radius: 4)
                
                Text(movie.title)
                    .multilineTextAlignment(.center)
            }
        }
        .frame(width:380,height: 700)
        
        .onAppear{
            
            self.imageLoader.loadImage(with: movie.posterURL)
        }
    }
}

struct UpcomingMovieCard_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingMovieCard(movie: Movie.stubbedMovie )
    }
}
