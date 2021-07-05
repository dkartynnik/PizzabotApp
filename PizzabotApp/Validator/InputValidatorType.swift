
import Foundation

protocol InputValidatorType {
    
    var dimensionsPattern: String { get }
    var pointPattern: String { get }
    var initialStringPattern: String { get }
    var dimensionsSeparators: String { get }
    var pointSeparators: String { get }
    var pointTrimmingCharacters: String { get }
    
}
