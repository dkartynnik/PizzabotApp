
import Foundation

final class DefaultInputValidator: InputValidatorType {
    
    let dimensionsPattern = "\\s*[0-9]+\\s*x\\s*[0-9]+\\s*"
    let pointPattern = "\\s*\\(\\s*[0-9]+\\s*,\\s*[0-9]+\\s*\\)\\s*"
    let dimensionsSeparators = "xX"
    let pointSeparators = ","
    let pointTrimmingCharacters = "()"
    
    var initialStringPattern: String { "^" + dimensionsPattern + "(?:" + pointPattern + ")*" + "$" }
    
    func validate(_ initialString: String) -> Bool {
        if RegExHelper.check(if: initialString, matches: initialStringPattern) != true {
            return false
        }
        return true
    }
    
}
