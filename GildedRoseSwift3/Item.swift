public class Item {
    public var name: String = ""
    public var sellIn: Int = 0
    public var quality: Int = 0
    
    init(name: String, sellIn: Int, quality: Int){
        self.name = name
        self.sellIn = sellIn
        self.quality = quality
    }
}
