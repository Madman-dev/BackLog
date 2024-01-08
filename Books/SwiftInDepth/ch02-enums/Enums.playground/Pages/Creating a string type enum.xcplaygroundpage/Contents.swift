//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)

//: # Creating a string type enum

enum Image: String {
    case jpg
    case gif
    case bmp
}

// Image의 rawValue를 활용하는 함수를 생성 -> 컴파일러에서 오류를 발견해주게 된다. (수고를 덜어주네)
func iconNamer(for imageTypes: String) -> String {
    guard let image = Image(rawValue: imageTypes) else { return "모르겠어요" }
    
    switch image {
    case .jpg: return "jpg 이미지"
    case .bmp: return "bmp 이미지"
    case .gif: return "gif 이미지"
    }
}


// 하지만 대소문자 구분은 여전히 되지 않는 상황
enum ImageType: String {
    case jpg
    case bmp
    case gif
    
    init?(rawValue: String) {
        switch rawValue.lowercased() {    // case insensitive
        case "jpg", "jpeg": self = .jpg   // 여러 타입을 하나로 반환 가능
        case "bmp", "bitmap": self = .bmp
        case "gif", "gifv": self = .gif
        default: return nil
        }
    }
    
}

func iconName(for fileExtension: String) -> String {
    guard let imageType = ImageType(rawValue: fileExtension) else {
        return "assetIconUnknown"
    }
    switch imageType {
    case .jpg: return "assetIconJpeg"
    case .bmp: return "assetIconBitmap"
    case .gif: return "assetIconGif"
    }
}

iconName(for: "jpg") // "Received jpg"
iconName(for: "jpeg") // "Received jpg"
iconName(for: "JPG") // "Received a jpg"
iconName(for: "JPEG") // "Received a jpg"
iconName(for: "gif") // "Received a gif"

//: [Table of contents](Table%20of%20contents) - [Previous page](@previous) - [Next page](@next)
