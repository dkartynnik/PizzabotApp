
import Foundation

enum Messages: String {
    case inputInstructionsString = "Input instructions string:"
    case result = "Result:"
}

let pizzabot: PizzabotType = Pizzabot()

print(Messages.inputInstructionsString.rawValue)

while let input = readLine() {
    let result: String
    do {
        result = try pizzabot.route(for: input)
    }
    catch {
        result = error.localizedDescription
    }
    print(Messages.result.rawValue, result)
    print(Messages.inputInstructionsString.rawValue)
}
