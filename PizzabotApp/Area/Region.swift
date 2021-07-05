
import Foundation

struct Region {
    
    var xMin, xMax: Int
    var yMin, yMax: Int
    
    init(xMin: Int, yMin: Int, xMax: Int, yMax: Int) {
        self.xMin = xMin <= xMax ? xMin : xMax
        self.xMax = xMin <= xMax ? xMax : xMin
        self.yMin = yMin <= yMax ? yMin : yMax
        self.yMax = yMin <= yMax ? yMax : yMin
    }
    
    func contains(_ point: Point) -> Bool {
        return (xMin...xMax).contains(point.x) && (yMin...yMax).contains(point.y)
    }
    
}
