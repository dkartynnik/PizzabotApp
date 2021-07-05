
import Foundation

final class DefaultInputValidator: InputValidatorType {
    
    let dimensionsPattern = "\\s*[0-9]+\\s*x\\s*[0-9]+\\s*"
    let pointPattern = "\\s*\\(\\s*[0-9]+\\s*,\\s*[0-9]+\\s*\\)\\s*"
    var initialStringPattern: String { "^" + dimensionsPattern + "(?:" + pointPattern + ")*" + "$" }
    let dimensionsSeparators = "xX"
    let pointSeparators = ","
    let pointTrimmingCharacters = "()"
    
}
