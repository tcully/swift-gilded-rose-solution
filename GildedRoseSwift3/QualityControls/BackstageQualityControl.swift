class BackstageQualityControl: QualityControl {
    public let BACKSTAGE = "Backstage passes to a TAFKAL80ETC concert"
    private let QUITE_SOON = 10
    private let REALLY_SOON = 5
    internal func updateFor(item: Item) {
        if (item.quality < QualityControlStruct.MAX_QUALITY) {
            addQualityFor(amountToAdd: QualityControlStruct.NORMAL_QUALITY_REDUCTION, item: item)
            if (item.sellIn <= QUITE_SOON) {
                addQualityFor(amountToAdd: QualityControlStruct.NORMAL_QUALITY_REDUCTION, item: item)
            }
            
            if (item.sellIn <= REALLY_SOON) {
                addQualityFor(amountToAdd: QualityControlStruct.NORMAL_QUALITY_REDUCTION, item: item)
            }
        }
        if (item.sellIn <= 0) {
            item.quality = 0
        }
    }
    
    private func addQualityFor(amountToAdd: Int, item: Item) {
        item.quality = min(QualityControlStruct.MAX_QUALITY, item.quality + amountToAdd)
    }
}
