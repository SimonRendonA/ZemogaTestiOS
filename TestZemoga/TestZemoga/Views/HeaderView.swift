//
//  HeaderView.swift
//  TestZemoga
//
//  Created by Developer on 1/11/22.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack{
            Color.newPrimaryColor
                .ignoresSafeArea()
            Text("POSTS")
                .font(.title)
                .foregroundColor(.white)
                .fontWeight(.heavy)
                .padding(.vertical)
        }
            
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
