import _NIOFileSystem

func getStringContents(_ path: String) async throws -> String {
    let fh = try await FileSystem.shared.openFile(forReadingAt: FilePath(path))
    let i = try await fh.info()
    let buffer = try await fh.readToEnd(maximumSizeAllowed: .bytes(i.size))
    let contents = String(buffer: buffer)
    try await fh.close()
    return contents
}
