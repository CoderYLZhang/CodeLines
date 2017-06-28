//
//  String+Path.swift
//  codeLines
//
//  Created by yinlong on 2017/6/27.
//  Copyright © 2017年 yinlong. All rights reserved.
//

import Foundation

extension String {
    var ns: NSString {
        return self as NSString
    }
    var pathExtension: String {
        return ns.pathExtension
    }
    var lastPathComponent: String {
        return ns.lastPathComponent
    }
}
