import ComposableArchitecture
import CouchTrackerCore
import TraktSwift

struct GenresAPIClient {
    var genres: (GenreType) -> Effect<[Genre], Error>
}

extension GenresAPIClient {
    static func live(trakt: TraktProvider, client: HTTPClient) -> GenresAPIClient {
        var cache = [GenreType: [Genre]]()

        return .init(
            genres: { genreType in
                if let cachedValue = cache[genreType] {
                    return .init(value: cachedValue)
                }

                return requestGenres(client: client, genreType: genreType)
                    .handleEvents(
                        receiveOutput: { genres in
                            cache[genreType] = genres
                        }
                    ).eraseToEffect()
            }
        )
    }
}

private func requestGenres(
    client: HTTPClient,
    genreType: GenreType
) -> Effect<[Genre], Error> {
    .none
}