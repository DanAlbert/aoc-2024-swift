import Foundation

package func loadProblemInput(
  _ resourceName: String = "input", bundle: Bundle = Bundle.main
) -> String? {
  guard let inputPath = bundle.path(forResource: resourceName, ofType: "txt")
  else {
    return nil
  }

  return try? String(contentsOfFile: inputPath, encoding: .utf8)
}
