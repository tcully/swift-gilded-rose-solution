class BrieQualityControl: QualityControl {
    public let BRIE = "Aged Brie"
    internal func updateFor(item: Item) {
        if (item.quality < 50) {
            item.quality += 1
        }
    }
}
