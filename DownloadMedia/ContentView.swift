//
//  ContentView.swift
//  DownloadMedia
//
//  Created by Angelos Staboulis on 24/7/24.
//

import SwiftUI
import AlertToast
struct ContentView: View {
    @State var urlDownload:String
    @State var savingFile:String
    @State var getFinished:Bool
    @State var isPlaying:Bool
    let process = Downloader()
    var body: some View {
        NavigationStack{
            VStack {
                Text("Enter your url for Download").frame(width:650,alignment: .leading)
                TextField("Enter your url for Download",text: $urlDownload).frame(width:650,height:45,alignment: .leading)
                Text("Enter your path for Saving File").frame(width:650,alignment: .leading)
                TextField("Enter your path for Saving File",text: $savingFile).frame(width:650,height:45,alignment: .leading)
                if isPlaying {
                    MediaView(video: urlDownload)
                        .frame(width: 650, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }else{
                    StopMediaView(video: "https://www.google.com")
                        .frame(width: 650, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
                Button {
                    isPlaying.toggle()
                } label: {
                    Text("Play Video").frame(width:650,height:45,alignment: .center)
                }
                Button {
                    isPlaying = false
                    let helper = Helper()
                    helper.removeWebViewCache {
                        debugPrint("remove everything from cache")
                    }
                } label: {
                    Text("Stop Video").frame(width:650,height:45,alignment: .center)
                }
                
                Button(action: {
                    Task{
                        getFinished = await process.downloadFile(downloadfile: urlDownload, pathSave: savingFile)
                    }
                }, label: {
                    Text("Download file").frame(width:650,height:45,alignment: .center)
                }).toast(isPresenting: $getFinished) {
                    AlertToast(type: .complete(.red), title: "Download is fnished!")
                }
            }.frame(width:650,height:350)
        }
    }
}

#Preview {
    ContentView(urlDownload: "", savingFile: "", getFinished: false, isPlaying: false)
}
