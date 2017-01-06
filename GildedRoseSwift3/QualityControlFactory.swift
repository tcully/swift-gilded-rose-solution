class QualityControlFactory {
    let qualityControls = [
        (name: BrieQualityControl().BRIE, qualityControl: BrieQualityControl()),
        (name: BackstageQualityControl().BACKSTAGE, qualityControl: BackstageQualityControl()),
        (name: SulfurasQualityControl().SULFURAS, qualityControl: BrieQualityControl()),
        (name: ConjuredQualityControl().CONJURED, qualityControl: ConjuredQualityControl())
        ] as [(name: String, qualityControl: QualityControl)]
    
    func qualityControlFor(item: Item) -> QualityControl {
        for qualityControl in qualityControls {
            if (qualityControl.name == item.name) {
                return qualityControl.qualityControl
            }
        }
        return NormalQualityControl()
    }
}
