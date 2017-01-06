class ConjuredQualityControl: QualityControl {
    public let CONJURED = "Conjured Mana Cake"
    internal func updateFor(item: Item) {
        let reductionAmount = item.sellIn <= 0 ?
            QualityControlStruct.DOUBLE_QUALITY_REDUCTION * 2 :
            QualityControlStruct.NORMAL_QUALITY_REDUCTION * 2
        item.quality = max(QualityControlStruct.MIN_QUALITY, item.quality - reductionAmount)
    }
}
