//
//  YLMainModel.swift
//  YLFileCodeLines
//
//  Created by zero.zhang on 2020/11/11.
//

import Cocoa

class YLMainModel: NSObject {
    var rootPath: String = ""
    /// 文件数
    var fileNumber: Int = 0
    /// 代码总行数
    var totalRows: Int = 0
    
    var modelList: [YLSingleModel] = []
    /// 不同类型文件的数量
    var typeCountMap: [String:Int] = [:]
}


class YLSingleModel: NSObject {
    var fileName: String = ""
    var fileType: String = ""
    var codeRows: YLCodeRows = .zero
}

struct YLCodeRows {
    static var zero: YLCodeRows {
        return YLCodeRows(total: 0, code: 0, note: 0, blank: 0)
    }
    /// 总行数
    var total: Int = 0
    /// 代码行数
    var code: Int = 0
    /// 注释行数
    var note: Int = 0
    /// 空行数
    var blank: Int = 0
}
