import RealmSwift
import TraktSwift

final class ShowEntityRealm: Object {
  @objc private dynamic var identifier = 0
  @objc private dynamic var backingIds: ShowIdsRealm?
  @objc dynamic var title: String?
  @objc dynamic var overview: String?
  @objc dynamic var network: String?
  let genres = List<GenreRealm>()
  @objc dynamic var status: String?
  @objc dynamic var firstAired: Date?

  var ids: ShowIdsRealm? {
    get {
      return backingIds
    }
    set {
      backingIds = newValue
      if let newValueHash = newValue?.hashValue {
        identifier = newValueHash
      }
    }
  }

  override static func primaryKey() -> String? {
    return "identifier"
  }

  override static func ignoredProperties() -> [String] {
    return ["backingIds"]
  }

  func toEntity() -> ShowEntity {
    guard let showIds = self.ids?.toEntity() else {
      Swift.fatalError("How could this be saved on Realm without primary key?!")
    }

    return ShowEntity(ids: showIds,
                      title: self.title,
                      overview: self.overview,
                      network: self.network,
                      genres: self.genres.map { $0.toEntity() },
                      status: Status(rawValue: self.status ?? ""),
                      firstAired: self.firstAired)
  }
}

extension ShowEntity {
  func toRealm() -> ShowEntityRealm {
    let entity = ShowEntityRealm()

    entity.ids = self.ids.toRealm()
    entity.title = self.title
    entity.overview = self.overview
    entity.network = self.network
    entity.status = self.status?.rawValue
    entity.firstAired = self.firstAired

    if let realmGenres = self.genres?.map({ $0.toRealm() }) {
      entity.genres.append(objectsIn: realmGenres)
    }

    return entity
  }
}
