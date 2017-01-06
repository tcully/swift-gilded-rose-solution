public class GildedRose
{
    var items: [Item]
    
    init(items: [Item])
    {
        self.items = items;
    }
    
    public func updateQuality()
    {
        for i in 0 ..< items.count
        {
            let qualityControl = QualityControlFactory().qualityControlFor(item: items[i])
            qualityControl.updateFor(item: items[i])
            SellInControl().updateFor(item: items[i])
        }
    }
}
