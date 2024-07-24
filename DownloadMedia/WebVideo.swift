//
//  WebVideo.swift
//  DownloadMedia
//
//  Created by Angelos Staboulis on 24/7/24.
//
import SwiftUI
import WebKit
import Cocoa
struct WebVideo:NSViewRepresentable{
    typealias NSViewType = WKWebView
    var urlVideo = String()
    
    func makeNSView(context: Context) -> WKWebView {
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.allowsAirPlayForMediaPlayback = true
        webConfiguration.mediaTypesRequiringUserActionForPlayback = []
        let webView = WKWebView(frame: .zero,configuration: webConfiguration)
        if let urlMain = URL(string:urlVideo) {
            webView.load(URLRequest(url: urlMain))
        }
        return webView
    }
    
    func updateNSView(_ nsView: WKWebView, context: Context) {
    }
    

    
 
}
