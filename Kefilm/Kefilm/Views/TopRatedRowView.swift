//
//  TopRatedRowView.swift
//  Kefilm
//
//  Created by Oguz Demırhan on 10.02.2021.
//

import SwiftUI

struct TopRatedRowView: View {
    
    let movie : Movie
    @ObservedObject var imageLoader = ImageLoader()
    
    var body: some View {
        HStack{
                if self.imageLoader.image != nil {
                    Image(uiImage: self.imageLoader.image!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 175, height: 250,alignment: .leading)
                        .cornerRadius(10)
                }
                else {
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .cornerRadius(8)
                        .shadow(radius: 4)
                    
                    Text(movie.title)
                        .multilineTextAlignment(.center)
                }
                VStack {
                    HStack{
                        Text(movie.title).font(.title)
                        Text("(\(movie.yearText))").fontWeight(.light)
                        
                    }
                    
                    Text("\(movie.overview.components(separatedBy: ".").first!)." ).fontWeight(.light)
                    
                }
                
                
                
            }
        .frame(width: UIScreen.main.bounds.size.width-20, height: 250,alignment: .center)
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(10)
            
            

            
        
            .onAppear{
                self.imageLoader.loadImage(with: movie.posterURL)
            }
        
        
    }
}

struct TopRatedRowView_Previews: PreviewProvider {
    static var previews: some View {
        TopRatedRowView(movie: Movie.stubbedMovie)
    }
}
