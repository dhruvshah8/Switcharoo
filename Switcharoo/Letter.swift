//
//  Letter.swift
//  Switcharoo
//
//  Created by Dhruv Shah on 2020-06-23.
//  Copyright © 2020 Dhruv Shah. All rights reserved.
//

import SwiftUI

enum DragState{
    case good
    case bad
    case unknown
}

struct Letter: View {
    @State var dragAmount = CGSize.zero
    @State var dragState = DragState.unknown
    var text: String
    var index: Int
    
    var onChanged: ((CGPoint, String) -> DragState)?
    var onEnded: ((CGPoint, Int, String) -> Void)?
    
    var body: some View {
        Image(text)
            .frame(width: 90, height: 130)
            .offset(dragAmount)
            .shadow(color: dragColor, radius: dragAmount == .zero ? 0 : 10)
            .shadow(color: dragColor, radius: dragAmount == .zero ? 0 : 10)
            .gesture(
                DragGesture(coordinateSpace: .global)
                    .onChanged{
                        self.dragAmount = CGSize(width: $0.translation.width, height: -$0.translation.height)
                        self.dragState = self.onChanged?($0.location, self.text) ?? .unknown
                        
                }
                .onEnded{
                    if self.dragState == .good {
                        self.onEnded?($0.location, self.index, self.text)
                    }
                    self.dragAmount = .zero
                }
        )
      //  .zIndex(dragAmount == .zero ? 0 : 1)
    }
    
    var dragColor: Color{
        switch dragState{
        case .unknown:
            return .black
        case .good:
            return .green
        case .bad:
            return .red
             
        }
    }
    
}

struct Letter_Previews: PreviewProvider {
    static var previews: some View {
        Letter(text: "A", index: 0)
    }
}
