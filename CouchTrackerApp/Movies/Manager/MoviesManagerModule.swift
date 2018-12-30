import CouchTrackerCore
import UIKit

enum MoviesManagerModule {
  static func setupModule() -> BaseView {
    guard let view = R.storyboard.moviesManager().instantiateInitialViewController() as? UINavigationController else {
      fatalError("Initial view controller from MoviesManager storyboard should be an UINavigationController")
    }

    guard let moviesManagerView = view.topViewController as? MoviesManagerViewController else {
      fatalError("MoviesManager storyboard should have a MoviesManagerView")
    }

    let creator = MoviesManageriOSModuleCreator()
    let dataSource = MoviesManagerDefaultDataSource(creator: creator, userDefaults: UserDefaults.standard)
    let presenter = MoviesManagerDefaultPresenter(dataSource: dataSource)

    moviesManagerView.presenter = presenter

    return view
  }
}
