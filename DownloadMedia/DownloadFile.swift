//
//  DownloadFile.swift
//  DownloadMedia
//
//  Created by Angelos Staboulis on 24/7/24.
//

import Foundation
class Downloader{
    func downloadFile(downloadfile:String,pathSave:String) async -> Bool{
        return await withCheckedContinuation { continuation in
            let process = Process()
            process.executableURL = URL(filePath:getHomeBrewPath())
            process.arguments = [downloadfile,"-o",pathSave]
            process.terminationHandler = { (process) in
                continuation.resume(returning: !process.isRunning)
                print("\ndidFinish: \(!process.isRunning)")
            }
            process.launch()
        }
          
      
    }

    func getDownloadsDirectory()->String{
        guard let getDownloadsPath =  FileManager.default.urls(for: .downloadsDirectory, in: .allDomainsMask).first else{
            return ""
        }
        return getDownloadsPath.path()
    }
    func getUserPath()->String{
        let getPathUser =  FileManager.default.homeDirectoryForCurrentUser
        return getPathUser.path()
    }
    func getHomeBrewPath()->String{
        return "/opt/homebrew/bin/yt-dlp"
    }
}
