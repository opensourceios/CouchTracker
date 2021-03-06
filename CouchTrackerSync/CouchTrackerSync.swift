import RxSwift

#if DEBUG
public var Current = SyncEnvironment.live
#else
public let Current = SyncEnvironment.live
#endif

var trakt: Trakt = { badTrakt! }() // swiftlint:disable:this force_unwrapping
private var badTrakt: Trakt?

public func setupSyncModule(trakt: Trakt) -> (SyncOptions) -> Observable<Show> {
  badTrakt = trakt
  return { options in
    startSync(options)
  }
}
