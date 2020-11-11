//
//  YLWindowController.swift
//  YLFileCodeLines
//
//  Created by zero.zhang on 2020/11/11.
//

import Cocoa

class YLWindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
        
        // 设置titlebar为透明 <-> Set titlebar as transparent
        window?.titlebarAppearsTransparent = true
        // 隐藏title
        window?.titleVisibility = .hidden
        // 隐藏最大化按钮
        window?.standardWindowButton(.zoomButton)?.isHidden = true
    }

}
