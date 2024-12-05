import Advent
import Foundation
import Testing

@Test func canReadData() {
  #expect(Advent.loadProblemInput(bundle: Bundle.module) == "hello world")
}

@Test func throwsErrorForMissingData() {
  #expect(
    Advent.loadProblemInput("does-not-exist", bundle: Bundle.module) == nil)
}
