
import Foundation

let pizzabot: PizzabotType = Pizzabot()

do {
    print(try pizzabot.route(for: "5x5 (1, 3) (4, 4)"))
    print(try pizzabot.route(for: "5x5 (0, 0) (1, 3) (4,4) (4, 2) (4, 2) (0, 1) (3, 2) (2, 3) (4, 1)"))
}
catch {
    print(error)
}
