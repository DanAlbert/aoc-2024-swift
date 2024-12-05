import Advent
import Foundation

let input = Advent.loadProblemInput(bundle: Bundle.module)
guard
  let firstLine = input?.split(maxSplits: 2, whereSeparator: \.isNewline).first
else {
  fatalError("Input is empty")
}
print("First line: \(firstLine)")
