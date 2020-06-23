//
//  GameNumber.swift
//  Switcharoo
//
//  Created by Dhruv Shah on 2020-06-23.
//  Copyright © 2020 Dhruv Shah. All rights reserved.
//

import SwiftUI

struct GameNumber: View {
    
    var text: String
    var value: Int
    
    var body: some View {
        VStack{
            Text(text)
            Text("\(value)").font(.largeTitle)
        }.frame(maxWidth: .infinity).foregroundColor(.white)
    }
}

struct GameNumber_Previews: PreviewProvider {
    static var previews: some View {
        GameNumber(text: "Score", value: 3)
    }
}
