//
//  DownloadMediaApp.swift
//  DownloadMedia
//
//  Created by Angelos Staboulis on 24/7/24.
//

import SwiftUI

@main
struct DownloadMediaApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(urlDownload: "", savingFile: "", getFinished: false, isPlaying: false).frame(width:650,height:650,alignment: .center)
        }.windowResizability(.contentSize)
    }
}
