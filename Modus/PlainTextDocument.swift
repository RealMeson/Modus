//
//  PlainTextDocument.swift
//  Modus
//
//  Created by Sean Romel on 2023-03-24.
//

import SwiftUI
import UniformTypeIdentifiers

extension UTType {
    static var toml: UTType {
        UTType(importedAs: "public.toml")
    }
}

final class PlainTextDocument: ReferenceFileDocument {

    typealias Snapshot = String
    
    @Published var text: String
    
    static var readableContentTypes: [UTType] { [.plainText, .text, .json, .toml, .log] }
    
    init(configuration: ReadConfiguration) throws {
        guard let data = configuration.file.regularFileContents
        else {
            throw CocoaError(.fileReadCorruptFile)
        }
        self.text = String(data: data, encoding: .utf8) ?? ""
    }
    
    func snapshot(contentType: UTType) throws -> String {
        text // Make a copy.
    }
    
    init(_ text: String = "") {
        self.text = text
    }
    
    func fileWrapper(snapshot: String, configuration: WriteConfiguration) throws -> FileWrapper {
        let data = try JSONEncoder().encode(snapshot)
        let fileWrapper = FileWrapper(regularFileWithContents: data)
        return fileWrapper
    }
}
