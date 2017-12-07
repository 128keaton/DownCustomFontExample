//
//  ViewController.swift
//  DownCustomFontExample
//
//  Created by Keaton Burleson on 12/6/17.
//  Copyright © 2017 Keaton Burleson. All rights reserved.
//

import UIKit
import Down
import WebKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print("Available fonts: \(UIFont.familyNames)")

        let webView = WKWebView(frame: self.view.bounds)

        let path = URL(fileURLWithPath: Bundle.main.bundlePath)

        webView.loadHTMLString(getHTML(), baseURL: path)

        webView.configuration.preferences.setValue(true, forKey: "developerExtrasEnabled")

        self.view.addSubview(webView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getHTML() -> String {
        let cssImport = "<head><link rel=\"stylesheet\" type=\"text/css\" href=\"style.css\"></head>"

        let htmlString = try? Down(markdownString: "**This is a font test**").toHTML()

        print(cssImport + htmlString!)

        return cssImport + htmlString!
    }

}

