
import Foundation

final class Pizzabot: PizzabotType {
    
    private let inputValidator: InputValidatorType = DefaultInputValidator()
    
    enum Errors: Error {
        case wrongInitialStringFormat
        case unexpectedRegExMatchResult
        case unexpectedStringComponentsCount
        case notAllPointsInRegion
    }
    
    private enum Actions: String {
        case moveNorth = "N"
        case moveSouth = "S"
        case moveEast = "E"
        case moveWest = "W"
        case dropPizza = "D"
    }
    
    func route(for initialString: String) throws -> String {
        if !inputValidator.validate(initialString) {
            throw Self.Errors.wrongInitialStringFormat
        }
        let dimensions = try get(dimensionsFrom: initialString)
        let points = try get(pointsFrom: initialString)
        let region = Region(xMin: 0, yMin: 0, xMax: dimensions.x, yMax: dimensions.y)
        try check(if: points, in: region)
        var currentPoint = Point(0, 0)
        var travelHistory = String()
        for point in points {
            travelHistory = move(to: point, from: currentPoint, with: travelHistory)
            travelHistory.append(Self.Actions.dropPizza.rawValue)
            currentPoint = point
        }
        return travelHistory
    }
    
    private func move(to nextPoint: Point, from previousPoint: Point, with travelHistory: String) -> String {
        var updatedPoint = previousPoint
        var updatedTravelHistory = travelHistory
        switch previousPoint {
        case let point where point.x < nextPoint.x:
            updatedPoint.x += 1
            updatedTravelHistory.append(Self.Actions.moveEast.rawValue)
        case let point where point.x > nextPoint.x:
            updatedPoint.x -= 1
            updatedTravelHistory.append(Self.Actions.moveWest.rawValue)
        case let point where point.y < nextPoint.y:
            updatedPoint.y += 1
            updatedTravelHistory.append(Self.Actions.moveNorth.rawValue)
        case let point where point.y > nextPoint.y:
            updatedPoint.y -= 1
            updatedTravelHistory.append(Self.Actions.moveSouth.rawValue)
        default:
            break
        }
        if updatedPoint != nextPoint {
            updatedTravelHistory = move(to: nextPoint, from: updatedPoint, with: updatedTravelHistory)
        }
        return updatedTravelHistory
    }
    
    private func check(if points: [Point], in region: Region) throws {
        for point in points {
            if !region.contains(point) {
                throw Self.Errors.notAllPointsInRegion
            }
        }
    }
    
    private func get(dimensionsFrom initialString: String) throws -> (x: Int, y: Int) {
        guard let matchingStrings = RegExHelper.getMatchingStrings(from: initialString, matching: inputValidator.dimensionsPattern),
              matchingStrings.count == 1,
              let matchingString = matchingStrings.first
        else {
            throw Self.Errors.unexpectedRegExMatchResult
        }
        let separators = CharacterSet(charactersIn: inputValidator.dimensionsSeparators)
        let components = matchingString.components(separatedBy: separators)
            .map({ $0.trimmingCharacters(in: .whitespacesAndNewlines) })
            .compactMap({ Int($0) })
        if components.count != 2 {
            throw Self.Errors.unexpectedStringComponentsCount
        }
        else {
            return (components[0], components[1])
        }
    }
    
    private func get(pointsFrom initialString: String) throws -> [Point] {
        var points: [Point] = []
        guard let matchingStrings = RegExHelper.getMatchingStrings(from: initialString, matching: inputValidator.pointPattern)
        else {
            throw Self.Errors.unexpectedRegExMatchResult
        }
        let separators = CharacterSet(charactersIn: inputValidator.pointSeparators)
        for matchingString in matchingStrings {
            let components = matchingString.components(separatedBy: separators)
                .map({ $0.trimmingCharacters(in: CharacterSet(charactersIn: inputValidator.pointTrimmingCharacters).union(.whitespacesAndNewlines)) })
                .compactMap({ Int($0) })
            if components.count != 2 {
                throw Self.Errors.unexpectedStringComponentsCount
            }
            else {
                points.append(Point(components[0], components[1]))
            }
        }
        return points
    }
    
}
