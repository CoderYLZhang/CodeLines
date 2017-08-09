//
//  main.swift
//  codeLines
//
//  Created by yinlong on 2017/6/27.
//  Copyright © 2017年 yinlong. All rights reserved.
//

import Foundation

let filePath = "原始目录"
let toPath = "目标目录"


CopyFiles.ignoreFolders = ["Pods", "3rd-partyLibs", "Vendor", "zh-Hans.lproj"] // 要忽略的文件夹名
CopyFiles.process(filePath, toPath: toPath, fileExtension: "strings")


//CodeLines.ignoreFolders = ["Pods"] // 要忽略的文件夹名
//let sumLines = CodeLines.process(filePath)

//print("总行数: \(sumLines.total), 有效代码行数: \(sumLines.code), 注释: \(sumLines.note), 空行: \(sumLines.blank)")
//print(".h文件数: \(sumLines.fileH), .m文件数: \(sumLines.fileM), .Swift文件数: \(sumLines.fileSwift)")





