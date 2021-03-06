import CouchTrackerAppTestable
import CouchTrackerCore
import KIF

final class AppStartupEnglishUSTests: KIFTestCase {
  func testChangeTabs_enUS() {
    tester().waitForView(withAccessibilityLabel: "Ok")
    tester().tapView(withAccessibilityLabel: "Ok")

    tester().tapView(withAccessibilityLabel: "Shows")
    tester().tapView(withAccessibilityLabel: "Settings")
    tester().tapView(withAccessibilityLabel: "Movies")
  }
}
