//
//  AsposeCellsSwift.swift
//  AsposeCellsSwift
//
//  Created by Fidel Hernández Salazar on 11/12/22.
//

import Foundation
import AsposeCellsCloud

class AsposeCellsSwift {
    static let shared = AsposeCellsSwift()

    fileprivate var currentlyAuthorized: Bool = false

    convenience init(clientId: String, clientSecret: String) {
        self.init()

        AsposeCellsCloudAPI.clientId = clientId
        AsposeCellsCloudAPI.clientSecret = clientSecret
    }

    /**
     :doc
     Authorize rest client with Aspose Servers
     Return:
     - true if success
     - error
     */
    @discardableResult
    func authorizeClient() async throws -> Bool {
        return try await withCheckedThrowingContinuation { continuation in
            AuthAspose.checkAuth { error in
                if let error = error {
                    self.currentlyAuthorized = false
                    continuation.resume(throwing: error)
                } else {
                    self.currentlyAuthorized = true
                    continuation.resume(returning: true)
                }
            }
        }
    }

    // MARK: - Files & Folders

    @discardableResult
    func getFilesList(atPath: String) async throws -> FilesList? {
        return try await withCheckedThrowingContinuation { continuation in
            CellsAPI.getFilesList(path: atPath) { data, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume(returning: data)
                }
            }
        }
    }

    @discardableResult
    func downloadFile(atPath: String) async throws -> NSData? {
        return try await withCheckedThrowingContinuation { continuation in
            CellsAPI.downloadFile(path: atPath) { data, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume(returning: data)
                }
            }
        }
    }

    // MARK: - Workbook

    /**
     :doc
     Create workbook
     Params:
     - fileName: The file name
     Return:
     - true if success
     - error
     */
    @discardableResult
    func workbookCreate(fileName: String) async throws -> WorkbookResponse? {
        return try await withCheckedThrowingContinuation({ continuation in
            CellsAPI.cellsWorkbookPutWorkbookCreate(name: fileName) { data, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    return continuation.resume(returning: data)
                }
            }
        })
    }

    // MARK: - Worksheet

    @discardableResult
    func getWorksheets(fileName: String) async throws -> WorksheetsResponse? {
        return try await withCheckedThrowingContinuation({ continuation in
            CellsAPI.cellsWorksheetsGetWorksheets(name: fileName) { data, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    return continuation.resume(returning: data)
                }
            }
        })
    }

    @discardableResult
    func addNewWorksheet(fileName: String, sheetName: String) async throws -> WorksheetsResponse? {
        return try await withCheckedThrowingContinuation({ continuation in
            CellsAPI.cellsWorksheetsPutAddNewWorksheet(name: fileName, sheetName: sheetName) { data, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    return continuation.resume(returning: data)
                }
            }
        })
    }

    @discardableResult
    func renameWorksheet(fileName: String, currentSheetName: String, newSheetName: String) async throws -> CellsCloudResponse? {
        return try await withCheckedThrowingContinuation({ continuation in
            CellsAPI.cellsWorksheetsPostRenameWorksheet(name: fileName, sheetName: currentSheetName, newname: newSheetName) { data, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    return continuation.resume(returning: data)
                }
            }
        })
    }

    // MARK: - Cell

    @discardableResult
    func setCellValue(fileName: String, sheetName: String, cellName: String, value: String, valueType: CellValueType? = .string, formula: String? = nil) async throws -> CellResponse? {
        return try await withCheckedThrowingContinuation({ continuation in

            // If not value type set, assing string by default
            let cellValueType: CellValueType = valueType ?? .string

            CellsAPI.cellsPostWorksheetCellSetValue(name: fileName, sheetName: sheetName, cellName: cellName, value: value, type: cellValueType.rawValue, formula: formula, folder: nil, storageName: nil) { data, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    return continuation.resume(returning: data)
                }
            }
        })
    }

    @discardableResult
    func setCellStyle(fileName: String, sheetName: String, cellName: String, style: Style? = nil) async throws -> StyleResponse? {
        return try await withCheckedThrowingContinuation({ continuation in
            CellsAPI.cellsPostUpdateWorksheetCellStyle(name: fileName, sheetName: sheetName, cellName: cellName, style: style) { data, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    return continuation.resume(returning: data)
                }
            }
        })
    }

    // MARK: - Formula

    @discardableResult func getWorksheetCalculateFormula(fileName: String, sheetName: String, formula: String) async throws -> SingleValueResponse? {
        return try await withCheckedThrowingContinuation({ continuation in
            CellsAPI.cellsWorksheetsGetWorksheetCalculateFormula(name: fileName, sheetName: sheetName, formula: formula) { data, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    return continuation.resume(returning: data)
                }
            }
        })
    }

    @discardableResult
    func getWorkbookCalculateAllFormula(fileName: String, options: CalculationOptions? = nil, ignoreError: Bool? = true) async throws -> CellsCloudResponse? {
        return try await withCheckedThrowingContinuation({ continuation in
            CellsAPI.cellsWorkbookPostWorkbookCalculateFormula(name: fileName, options: options, ignoreError: ignoreError) { data, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    return continuation.resume(returning: data)
                }
            }
        })
    }

    // MARK: - Comments

    @discardableResult
    func addWorksheetComment(fileName: String, sheetName: String, cellName: String, comment: Comment) async throws -> CellsCloudResponse? {
        return try await withCheckedThrowingContinuation({ continuation in
            CellsAPI.cellsWorksheetsPostWorksheetComment(name: fileName, sheetName: sheetName, cellName: cellName, comment: comment) { data, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    return continuation.resume(returning: data)
                }
            }
        })
    }

}
