
import Foundation

final class RegExHelper {
    
    static func check(if string: String, matches pattern: String) -> Bool? {
        guard let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive) else {
            return nil
        }
        guard let _ = regex.firstMatch(in: string, options: [], range: NSRange(location: 0, length: string.count)) else {
            return false
        }
        return true
    }
    
    static func getMatchingStrings(from string: String, matching pattern: String) -> [String]? {
        guard let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive) else {
            return nil
        }
        let matches = regex.matches(in: string, options: [], range: NSRange(location: 0, length: string.count))
        let nsString = string as NSString
        let matchingStrings = matches.map({ nsString.substring(with: $0.range) })
        return matchingStrings
    }
    
}
