import Advent
import Foundation

class LocationIdList: Equatable {
  let locationsIds: [Int]
  let sortedLocationIds: [Int]

  init(_ locationIds: [Int]) {
    self.locationsIds = locationIds
    self.sortedLocationIds = self.locationsIds.sorted()
  }

  func distance(_ rhs: LocationIdList) -> Int {
    var sum = 0
    for (left, right) in zip(self.sortedLocationIds, rhs.sortedLocationIds) {
      sum += abs(left - right)
    }
    return sum
  }

  static func == (lhs: LocationIdList, rhs: LocationIdList) -> Bool {
    return lhs.locationsIds == rhs.locationsIds
  }
}

enum ParseError: Error, Equatable {
  case wrongNumberOfElements(
    lineNumber: Int, contents: String, numberOfElements: Int)
  case intParseError(lineNumber: Int, text: String)
}

func parseLocationIdLists(_ input: String) throws(ParseError) -> (
  LocationIdList, LocationIdList
) {
  var left: [Int] = []
  var right: [Int] = []
  for (lineNumber, line) in input.split(whereSeparator: \.isNewline)
    .enumerated()
  {
    let elements = line.split(
      omittingEmptySubsequences: true, whereSeparator: \.isWhitespace)
    guard elements.count == 2 else {
      throw ParseError.wrongNumberOfElements(
        lineNumber: lineNumber, contents: String(line),
        numberOfElements: elements.count)
    }

    guard let leftInt = Int(elements[0]) else {
      throw ParseError.intParseError(
        lineNumber: lineNumber, text: String(elements[0]))
    }
    left.append(leftInt)

    guard let rightInt = Int(elements[1]) else {
      throw ParseError.intParseError(
        lineNumber: lineNumber, text: String(elements[1]))
    }
    right.append(rightInt)
  }

  return (LocationIdList(left), LocationIdList(right))
}

func solve() -> Int {
  guard let input = Advent.loadProblemInput(bundle: Bundle.module) else {
    fatalError("Could not open input file")
  }
  do {
    let (left, right) = try parseLocationIdLists(input)
    return left.distance(right)
  } catch {
    fatalError("Could not parse input file: \(error)")
  }
}

print("Solution: \(solve())")
