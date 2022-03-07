import Foundation

extension Array {
    subscript(safeIndex index: Int) -> Element? {
        guard index >= .zero, index < endIndex else {
            return nil
        }

        return self[index]
    }
}
