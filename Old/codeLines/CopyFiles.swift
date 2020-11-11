//
//  CopyFiles.swift
//  codeLines
//
//  Created by yinlong on 2017/8/9.
//  Copyright © 2017年 yinlong. All rights reserved.
//

import Foundation

struct CopyFiles {
    static  var ignoreFolders = [String]()
    static func process(_ filePath : String, toPath : String, fileExtension : String) {
    
        
        let fileManager = FileManager.default
        var isDirectory : ObjCBool = false
        var toPathTxist : ObjCBool = false // 目标目录是否存在
        
        fileManager.fileExists(atPath: filePath, isDirectory: &isDirectory)
        fileManager.fileExists(atPath: toPath, isDirectory: &toPathTxist)
        if !toPathTxist.boolValue {// 如果目标目录不存在,就创建
            try! fileManager.createDirectory(atPath: toPath, withIntermediateDirectories: true, attributes: nil)
        }
        
        if isDirectory.boolValue { // 是目录
            
            if ignoreFolders.contains(filePath.lastPathComponent) {
                return
            }
            let fileArr = try! fileManager.contentsOfDirectory(atPath: filePath)
            
            for file in fileArr {
                CopyFiles.process("\(filePath)/\(file)", toPath: toPath, fileExtension: fileExtension)
            }
        }
        // 文件
        let currFileExtension = filePath.pathExtension
        let lastPathComponent = filePath.lastPathComponent
        
        if currFileExtension == fileExtension {
            print(filePath)
            // 移动srcUrl中的文件（test.txt）到toUrl中（copyed.txt）
            try? fileManager.copyItem(atPath: filePath, toPath: toPath + "/" + lastPathComponent)
        }
    }
}

















