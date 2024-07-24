//
//  MediaView.swift
//  DownloadMedia
//
//  Created by Angelos Staboulis on 24/7/24.
//

import SwiftUI

struct MediaView: View {
    @State private var amount = 0.0
    @State var video:String
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    var body: some View {
            ZStack(alignment: .center) {
                ProgressView("Loading…", value: amount, total: 50)
                    .onReceive(timer) { _ in
                        if amount < 50 {
                            amount += 2
                        }
                }.opacity(amount < 50 ? 1 : 0.0)
                .progressViewStyle(.circular)
                
            }.background {
                WebVideo(urlVideo:video).frame(width:650,height:300)
            }
         
    }
}

