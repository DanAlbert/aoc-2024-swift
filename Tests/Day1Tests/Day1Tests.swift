import Testing

@testable import Day1

@Test func testParseValid() {
  let expectedLeft = LocationIdList([0, 2, 4, 6])
  let expectedRight = LocationIdList([1, 3, 5, 7])
  #expect(
    try! parseLocationIdLists(
      """
      0 1
      2 3
      4 5
      6 7
      """) == (expectedLeft, expectedRight))
}

@Test func testParseInvalidLine() {
  #expect(
    throws: ParseError.wrongNumberOfElements(
      lineNumber: 2, contents: "4 5 6", numberOfElements: 3)
  ) {
    try parseLocationIdLists(
      """
      0 1
      2 3
      4 5 6
      6 7
      """
    )
  }
}

@Test func testParseNonNumber() {
  #expect(throws: ParseError.intParseError(lineNumber: 2, text: "a")) {
    try parseLocationIdLists(
      """
      0 1
      2 3
      4 a
      6 7
      """
    )
  }
}

@Test func testPart1Example() {
  let (left, right) = try! parseLocationIdLists(
    """
    3   4
    4   3
    2   5
    1   3
    3   9
    3   3
    """
  )
  #expect(left.distance(right) == 11)
}

@Test func testPart1Answer() {
  #expect(solve() == 2_904_518)
}
