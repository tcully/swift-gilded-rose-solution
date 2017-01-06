import XCTest
@testable import GildedRoseSwift3

class GildedRoseSwift3Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testBrieIncreasesByQualityAtTheEndOfTheDay() {
        let initialQuality = 10
        let items = [Item (name: "Aged Brie", sellIn: 5, quality: initialQuality)]
        let subject = GildedRose(items: items)
        subject.updateQuality()
        XCTAssert(items[0].quality == initialQuality + 1)
    }
    
    func testBrieSellInDecreasesAtTheEndOfTheDay() {
        let initialSellIn = 5
        let items = [Item (name: "Aged Brie", sellIn: initialSellIn, quality: 10)]
        let subject = GildedRose(items: items)
        subject.updateQuality()
        XCTAssert(items[0].sellIn == initialSellIn - 1)
    }
    
    func testBrieQualityNeverIncreasesAbove50() {
        let items = [Item (name: "Aged Brie", sellIn: 40, quality: 49)]
        let subject = GildedRose(items: items)
        subject.updateQuality()
        XCTAssertEqual(items[0].quality, 50)
        subject.updateQuality()
        XCTAssertEqual(items[0].quality, 50)
    }
    
    func testSulfurasNeverDecreasesInQuality() {
        let items = [Item (name: "Sulfuras, Hand of Ragnaros", sellIn: 40, quality: 80)]
        let subject = GildedRose(items: items)
        subject.updateQuality()
        XCTAssertEqual(items[0].quality, 80)
        subject.updateQuality()
        XCTAssertEqual(items[0].quality, 80)
    }
    
    func testSulfurasSellInNeverDecreases() {
        let items = [Item (name: "Sulfuras, Hand of Ragnaros", sellIn: 40, quality: 80)]
        let subject = GildedRose(items: items)
        subject.updateQuality()
        XCTAssertEqual(items[0].sellIn, 40)
        subject.updateQuality()
        XCTAssertEqual(items[0].sellIn, 40)
    }
    
    func testElixirNeverHasNegativeQuality() {
        let items = [Item (name: "Elixir of the Mongoose", sellIn: 1, quality: 0)]
        let subject = GildedRose(items: items)
        subject.updateQuality()
        XCTAssertEqual(items[0].quality, 0)
    }
    
    func testElixirDecreasesInQualityAtTheEndOfTheDay() {
        let items = [Item (name: "Elixir of the Mongoose", sellIn: 1, quality: 1)]
        let subject = GildedRose(items: items)
        subject.updateQuality()
        XCTAssertEqual(items[0].quality, 0)
    }
    
    func testElixirSellInDecreasesAtTheEndOfTheDay() {
        let items = [Item (name: "Elixir of the Mongoose", sellIn: 1, quality: 1)]
        let subject = GildedRose(items: items)
        subject.updateQuality()
        XCTAssertEqual(items[0].sellIn, 0)
        subject.updateQuality()
        XCTAssertEqual(items[0].sellIn, -1)
    }
    
    func testElixirQualityDegradesTwiceAsFastAfterExpiry() {
        let items = [Item (name: "Elixir of the Mongoose", sellIn: 0, quality: 20)]
        let subject = GildedRose(items: items)
        subject.updateQuality()
        XCTAssertEqual(items[0].quality, 18)
        subject.updateQuality()
        XCTAssertEqual(items[0].quality, 16)
        subject.updateQuality()
        XCTAssertEqual(items[0].quality, 14)
        subject.updateQuality()
        XCTAssertEqual(items[0].quality, 12)
    }
    
    func testBackstagePassIncreasesByQualityAtTheEndOfTheDay() {
        let items = [Item (name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 20, quality: 1)]
        let subject = GildedRose(items: items)
        subject.updateQuality()
        XCTAssertEqual(items[0].quality, 2)
    }
    
    func testBackstagePassQualityDoesntIncreaseAbove50() {
        let items = [Item (name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 20, quality: 49)]
        let subject = GildedRose(items: items)
        subject.updateQuality()
        XCTAssertEqual(items[0].quality, 50)
        subject.updateQuality()
        XCTAssertEqual(items[0].quality, 50)
    }
    
    func testBackstagePassQualityIncreasesBy2When10OrLessDaysRemaining() {
        let items = [Item (name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 11, quality: 10)]
        let subject = GildedRose(items: items)
        subject.updateQuality()
        XCTAssertEqual(items[0].quality, 11)
        subject.updateQuality()
        XCTAssertEqual(items[0].quality, 13)
        subject.updateQuality()
        XCTAssertEqual(items[0].quality, 15)
    }
    
    func testBackstagePassQualityIncreasesBy3When5OrLessDaysRemaining() {
        let items = [Item (name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 6, quality: 10)]
        let subject = GildedRose(items: items)
        subject.updateQuality()
        XCTAssertEqual(items[0].quality, 12)
        subject.updateQuality()
        XCTAssertEqual(items[0].quality, 15)
        subject.updateQuality()
        XCTAssertEqual(items[0].quality, 18)
    }
    
    func testBackstagePassDoesntGoOver50QualityWhen5OrLessDaysLeft() {
        let items = [Item (name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 5, quality: 46)]
        let subject = GildedRose(items: items)
        subject.updateQuality()
        XCTAssertEqual(items[0].quality, 49)
        subject.updateQuality()
        XCTAssertEqual(items[0].quality, 50)
        subject.updateQuality()
        XCTAssertEqual(items[0].quality, 50)
    }
    
    func testBackstagePassDoesntGoOver50QualityWhen10OrLessDaysLeft() {
        let items = [Item (name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 9, quality: 46)]
        let subject = GildedRose(items: items)
        subject.updateQuality()
        XCTAssertEqual(items[0].quality, 48)
        subject.updateQuality()
        XCTAssertEqual(items[0].quality, 50)
        subject.updateQuality()
        XCTAssertEqual(items[0].quality, 50)
    }
    
    func testBackstagePassQualityGoesTo0WhenSellInReaches0() {
        let items = [Item (name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 2, quality: 10)]
        let subject = GildedRose(items: items)
        subject.updateQuality()
        XCTAssertEqual(items[0].quality, 13)
        subject.updateQuality()
        XCTAssertEqual(items[0].quality, 16)
        subject.updateQuality()
        XCTAssertEqual(items[0].quality, 0)
    }
    
    func testConjuredDecreasesInSellInBy1AtTheEndOfTheDay() {
        let items = [Item (name: "Conjured Mana Cake", sellIn: 20, quality: 10)]
        let subject = GildedRose(items: items)
        subject.updateQuality()
        XCTAssertEqual(items[0].sellIn, 19)
    }
    
    func testConjuredDecreasesInQualityBy2AtTheEndOfTheDay() {
        let items = [Item (name: "Conjured Mana Cake", sellIn: 20, quality: 10)]
        let subject = GildedRose(items: items)
        subject.updateQuality()
        XCTAssertEqual(items[0].quality, 8)
    }
    
    func testConjuredDecreasesInQualityBy4WhenSellInZero() {
        let items = [Item (name: "Conjured Mana Cake", sellIn: 1, quality: 10)]
        let subject = GildedRose(items: items)
        subject.updateQuality()
        XCTAssertEqual(items[0].quality, 8)
        subject.updateQuality()
        XCTAssertEqual(items[0].quality, 4)
        subject.updateQuality()
        XCTAssertEqual(items[0].quality, 0)
        subject.updateQuality()
        XCTAssertEqual(items[0].quality, 0)
    }
}
