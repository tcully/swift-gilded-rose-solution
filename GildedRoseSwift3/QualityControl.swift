protocol QualityControl {
    func updateFor(item: Item)
}

struct QualityControlStruct {
    static let MAX_QUALITY = 50
    static let MIN_QUALITY = 0
    static let NORMAL_QUALITY_REDUCTION = 1
    static let DOUBLE_QUALITY_REDUCTION = NORMAL_QUALITY_REDUCTION * 2
}
