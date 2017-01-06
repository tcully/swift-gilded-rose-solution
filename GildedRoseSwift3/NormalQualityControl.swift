class NormalQualityControl: QualityControl {
    internal func updateFor(item: Item) {
        if (item.quality > 0) {
            let qualityReduction = item.sellIn <= 0 ? 2 : 1
            item.quality -= qualityReduction
        }
    }
}
