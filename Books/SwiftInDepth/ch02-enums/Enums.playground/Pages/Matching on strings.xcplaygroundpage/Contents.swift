//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # Matching on strings

func iconName(for fileExtension: String) -> String {
    switch fileExtension {
    case "jpg": return "assetIconJpeg"
    case "bmp": return "assetIconBitmap"
    case "gif": return "assetIconGif"
    default: return "assetIconUnknown"
    }
}

iconName(for: "jpg") // "assetIconJpeg"
iconName(for: "JPG") // "assetIconUnknown", not favorable.

// rawValue를 사용한다면 발생할 수 있는 주의점 정도겠구나


//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
