class SellInControl {
    func updateFor(item: Item) {
        item.sellIn -= getReductionValueFor(item: item)
    }
    
    private func getReductionValueFor(item: Item) -> Int {
        return item.name == SulfurasQualityControl().SULFURAS ? 0 : 1
    }
}
