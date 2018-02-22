import RxSwift
import TraktSwift

public protocol ShowEpisodeDataSource: class {
	func updateWatched(show: WatchedShowEntity) throws
}

public protocol ShowEpisodeNetwork: class {
	func addToHistory(items: SyncItems) -> Single<SyncResponse>
	func removeFromHistory(items: SyncItems) -> Single<SyncResponse>
}

public protocol ShowEpisodeRepository: class {
	func addToHistory(of show: WatchedShowEntity, episode: EpisodeEntity) -> Single<SyncResult>
	func removeFromHistory(of show: WatchedShowEntity, episode: EpisodeEntity) -> Single<SyncResult>
}

public protocol ShowEpisodeInteractor: class {
	func fetchImageURL(for episode: EpisodeImageInput) -> Single<URL>
	func toggleWatch(for episode: EpisodeEntity, of show: WatchedShowEntity) -> Single<SyncResult>
}

public protocol ShowEpisodePresenter: class {
	init(view: ShowEpisodeView, interactor: ShowEpisodeInteractor, show: WatchedShowEntity)

	func viewDidLoad()
	func handleWatch()
}

public protocol ShowEpisodeView: class {
	var presenter: ShowEpisodePresenter! { get set }

	func showEmptyView()
	func showEpisodeImage(with url: URL)
	func show(viewModel: ShowEpisodeViewModel)
}