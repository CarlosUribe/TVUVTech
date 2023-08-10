//
//  MainDataModel.swift
//  TechChallengeTVUN
//
//  Created by Carlos Uribe on 05/08/23.
//

import Foundation

// MARK: - MainDataModel
class MainDataModel: Codable {
    let data: DataClass

    init(data: DataClass) {
        self.data = data
    }
}

// MARK: - DataClass
class DataClass: Codable {
    let uiPage: UIPage

    init(uiPage: UIPage) {
        self.uiPage = uiPage
    }
}

// MARK: - UIPage
class UIPage: Codable {
    let urlPath: URLPath
    let pageName: String
    let pageContentAvailability: Availability
    let pageAnalyticsMetadata: PageAnalyticsMetadata
    let uiModules: UIModules

    init(urlPath: URLPath, pageName: String, pageContentAvailability: Availability, pageAnalyticsMetadata: PageAnalyticsMetadata, uiModules: UIModules) {
        self.urlPath = urlPath
        self.pageName = pageName
        self.pageContentAvailability = pageContentAvailability
        self.pageAnalyticsMetadata = pageAnalyticsMetadata
        self.uiModules = uiModules
    }
}

// MARK: - PageAnalyticsMetadata
class PageAnalyticsMetadata: Codable {
    let keyValues: [KeyValue]

    init(keyValues: [KeyValue]) {
        self.keyValues = keyValues
    }
}

// MARK: - KeyValue
class KeyValue: Codable {
    let key, value: String

    init(key: String, value: String) {
        self.key = key
        self.value = value
    }
}

// MARK: - Availability
class Availability: Codable {
    let isBlocked: Bool
    let reason: Reason?

    init(isBlocked: Bool, reason: Reason?) {
        self.isBlocked = isBlocked
        self.reason = reason
    }
}

enum Reason: String, Codable {
    case beforeStartDate = "BEFORE_START_DATE"
    case requiresSubscription = "REQUIRES_SUBSCRIPTION"
}

// MARK: - UIModules
class UIModules: Codable {
    let totalCount: Int
    let pageInfo: PageInfo
    let edges: [UIModulesEdge]

    init(totalCount: Int, pageInfo: PageInfo, edges: [UIModulesEdge]) {
        self.totalCount = totalCount
        self.pageInfo = pageInfo
        self.edges = edges
    }
}

// MARK: - UIModulesEdge
class UIModulesEdge: Codable {
    let cursor: String
    let node: PurpleNode

    init(cursor: String, node: PurpleNode) {
        self.cursor = cursor
        self.node = node
    }
}

// MARK: - PurpleNode
class PurpleNode: Codable {
    let trackingMetadataJSON: TrackingMetadataJSON
    let trackingID, title, moduleType: String
    let scrollingTimeSeconds: JSONNull?
    let contents: Contents?
    let id, treatment: String?
    let caption: JSONNull?
    let landscapeFillImage, portraitFillImage: LandscapeFillImage?
    let sportID: JSONNull?
    let isLive: Bool?
    let leagueID: JSONNull?
    let sportsEventCarouselType: String?

    enum CodingKeys: String, CodingKey {
        case trackingMetadataJSON = "trackingMetadataJson"
        case trackingID = "trackingId"
        case title, moduleType, scrollingTimeSeconds, contents, id, treatment, caption, landscapeFillImage, portraitFillImage
        case sportID = "sportId"
        case isLive
        case leagueID = "leagueId"
        case sportsEventCarouselType
    }

    init(trackingMetadataJSON: TrackingMetadataJSON, trackingID: String, title: String, moduleType: String, scrollingTimeSeconds: JSONNull?, contents: Contents?, id: String?, treatment: String?, caption: JSONNull?, landscapeFillImage: LandscapeFillImage?, portraitFillImage: LandscapeFillImage?, sportID: JSONNull?, isLive: Bool?, leagueID: JSONNull?, sportsEventCarouselType: String?) {
        self.trackingMetadataJSON = trackingMetadataJSON
        self.trackingID = trackingID
        self.title = title
        self.moduleType = moduleType
        self.scrollingTimeSeconds = scrollingTimeSeconds
        self.contents = contents
        self.id = id
        self.treatment = treatment
        self.caption = caption
        self.landscapeFillImage = landscapeFillImage
        self.portraitFillImage = portraitFillImage
        self.sportID = sportID
        self.isLive = isLive
        self.leagueID = leagueID
        self.sportsEventCarouselType = sportsEventCarouselType
    }
}

// MARK: - Contents
class Contents: Codable {
    let totalCount: Int
    let pageInfo: PageInfo
    let edges: [ContentsEdge]

    init(totalCount: Int, pageInfo: PageInfo, edges: [ContentsEdge]) {
        self.totalCount = totalCount
        self.pageInfo = pageInfo
        self.edges = edges
    }
}

// MARK: - ContentsEdge
class ContentsEdge: Codable {
    let cursor: String
    let node: FluffyNode

    init(cursor: String, node: FluffyNode) {
        self.cursor = cursor
        self.node = node
    }
}

// MARK: - FluffyNode
class FluffyNode: Codable {
    let clickTrackingJSON: ClickTrackingJSON
    let landscapeFillImage, portraitFillImage, mobileFillImage, logoImage: LandscapeFillImage?
    let textTitle: JSONNull?
    let heroTargetContentType: String?
    let heroTarget: HeroTarget?
    let sponsorMetadata: JSONNull?
    let image: LandscapeFillImage?
    let video: Video?
    let channelID: String?
    let channel: Channel?
    let schedule: Schedule?
    let stream: Stream?
    let tournamentLogo, tournamentCardBackground, tournamentSplashBackground, localTeamLogo: LandscapeFillImage?
    let awayTeamLogo: LandscapeFillImage?
    let sportsEventID: String?
    let sportsEvent: SportsEvent?
    let compositeImageLink: String?

    enum CodingKeys: String, CodingKey {
        case clickTrackingJSON = "clickTrackingJson"
        case landscapeFillImage, portraitFillImage, mobileFillImage, logoImage, textTitle, heroTargetContentType, heroTarget, sponsorMetadata, image, video
        case channelID = "channelId"
        case channel, schedule, stream, tournamentLogo, tournamentCardBackground, tournamentSplashBackground, localTeamLogo, awayTeamLogo
        case sportsEventID = "sportsEventId"
        case sportsEvent, compositeImageLink
    }

    init(clickTrackingJSON: ClickTrackingJSON, landscapeFillImage: LandscapeFillImage?, portraitFillImage: LandscapeFillImage?, mobileFillImage: LandscapeFillImage?, logoImage: LandscapeFillImage?, textTitle: JSONNull?, heroTargetContentType: String?, heroTarget: HeroTarget?, sponsorMetadata: JSONNull?, image: LandscapeFillImage?, video: Video?, channelID: String?, channel: Channel?, schedule: Schedule?, stream: Stream?, tournamentLogo: LandscapeFillImage?, tournamentCardBackground: LandscapeFillImage?, tournamentSplashBackground: LandscapeFillImage?, localTeamLogo: LandscapeFillImage?, awayTeamLogo: LandscapeFillImage?, sportsEventID: String?, sportsEvent: SportsEvent?, compositeImageLink: String?) {
        self.clickTrackingJSON = clickTrackingJSON
        self.landscapeFillImage = landscapeFillImage
        self.portraitFillImage = portraitFillImage
        self.mobileFillImage = mobileFillImage
        self.logoImage = logoImage
        self.textTitle = textTitle
        self.heroTargetContentType = heroTargetContentType
        self.heroTarget = heroTarget
        self.sponsorMetadata = sponsorMetadata
        self.image = image
        self.video = video
        self.channelID = channelID
        self.channel = channel
        self.schedule = schedule
        self.stream = stream
        self.tournamentLogo = tournamentLogo
        self.tournamentCardBackground = tournamentCardBackground
        self.tournamentSplashBackground = tournamentSplashBackground
        self.localTeamLogo = localTeamLogo
        self.awayTeamLogo = awayTeamLogo
        self.sportsEventID = sportsEventID
        self.sportsEvent = sportsEvent
        self.compositeImageLink = compositeImageLink
    }
}

// MARK: - LandscapeFillImage
class LandscapeFillImage: Codable {
    let mediaType: MediaType
    let filePath: String
    let link: String
    let imageRole: ImageRole

    init(mediaType: MediaType, filePath: String, link: String, imageRole: ImageRole) {
        self.mediaType = mediaType
        self.filePath = filePath
        self.link = link
        self.imageRole = imageRole
    }
}

enum ImageRole: String, Codable {
    case channelLogo = "CHANNEL_LOGO"
    case heroPoster = "HERO_POSTER"
    case horizontalHero = "HORIZONTAL_HERO"
    case horizontalPoster = "HORIZONTAL_POSTER"
    case miscellaneous = "MISCELLANEOUS"
    case snapshot = "SNAPSHOT"
    case squarePoster = "SQUARE_POSTER"
    case teamLogo = "TEAM_LOGO"
    case tournamentCardBackground = "TOURNAMENT_CARD_BACKGROUND"
    case tournamentLogo = "TOURNAMENT_LOGO"
    case tournamentSplashBackground = "TOURNAMENT_SPLASH_BACKGROUND"
    case verticalHero = "VERTICAL_HERO"
    case verticalPoster = "VERTICAL_POSTER"
}

enum MediaType: String, Codable {
    case imageJPEG = "image/jpeg"
    case imagePNG = "image/png"
}

// MARK: - Channel
class Channel: Codable {
    let channelAvailability: Availability
    let badges: [JSONAny]
    let trackingMetadata: ChannelTrackingMetadata

    init(channelAvailability: Availability, badges: [JSONAny], trackingMetadata: ChannelTrackingMetadata) {
        self.channelAvailability = channelAvailability
        self.badges = badges
        self.trackingMetadata = trackingMetadata
    }
}

// MARK: - ChannelTrackingMetadata
class ChannelTrackingMetadata: Codable {
    let sharedMetadataJSON: PurpleSharedMetadataJSON
    let advertisingMetadataJSON: VideoTypeData
    let analyticsMetadataJSON: AnalyticsMetadataJSON
    let advertisingMetadata: AdvertisingMetadata

    enum CodingKeys: String, CodingKey {
        case sharedMetadataJSON = "sharedMetadataJson"
        case advertisingMetadataJSON = "advertisingMetadataJson"
        case analyticsMetadataJSON = "analyticsMetadataJson"
        case advertisingMetadata
    }

    init(sharedMetadataJSON: PurpleSharedMetadataJSON, advertisingMetadataJSON: VideoTypeData, analyticsMetadataJSON: AnalyticsMetadataJSON, advertisingMetadata: AdvertisingMetadata) {
        self.sharedMetadataJSON = sharedMetadataJSON
        self.advertisingMetadataJSON = advertisingMetadataJSON
        self.analyticsMetadataJSON = analyticsMetadataJSON
        self.advertisingMetadata = advertisingMetadata
    }
}

// MARK: - AdvertisingMetadata
class AdvertisingMetadata: Codable {
    let adUnit: String
    let adConfiguration: AdConfiguration

    init(adUnit: String, adConfiguration: AdConfiguration) {
        self.adUnit = adUnit
        self.adConfiguration = adConfiguration
    }
}

// MARK: - AdConfiguration
class AdConfiguration: Codable {
    let serverURL: String
    let env: Env
    let impl: Impl
    let correlator, tfcd, npa, gdfpReq: String
    let sz: Sz
    let unviewedPositionStart: String
    let vadType: VadType
    let vpa: String
    let url, descriptionURL: String
    let vconp, ssReq, vpi, iu: String
    let custParams: String

    enum CodingKeys: String, CodingKey {
        case serverURL = "server_url"
        case env, impl, correlator, tfcd, npa
        case gdfpReq = "gdfp_req"
        case sz
        case unviewedPositionStart = "unviewed_position_start"
        case vadType = "vad_type"
        case vpa, url
        case descriptionURL = "description_url"
        case vconp
        case ssReq = "ss_req"
        case vpi, iu
        case custParams = "cust_params"
    }

    init(serverURL: String, env: Env, impl: Impl, correlator: String, tfcd: String, npa: String, gdfpReq: String, sz: Sz, unviewedPositionStart: String, vadType: VadType, vpa: String, url: String, descriptionURL: String, vconp: String, ssReq: String, vpi: String, iu: String, custParams: String) {
        self.serverURL = serverURL
        self.env = env
        self.impl = impl
        self.correlator = correlator
        self.tfcd = tfcd
        self.npa = npa
        self.gdfpReq = gdfpReq
        self.sz = sz
        self.unviewedPositionStart = unviewedPositionStart
        self.vadType = vadType
        self.vpa = vpa
        self.url = url
        self.descriptionURL = descriptionURL
        self.vconp = vconp
        self.ssReq = ssReq
        self.vpi = vpi
        self.iu = iu
        self.custParams = custParams
    }
}

enum Env: String, Codable {
    case vp = "vp"
}

enum Impl: String, Codable {
    case s = "s"
}

enum Sz: String, Codable {
    case the640X480 = "640x480"
}

enum VadType: String, Codable {
    case linear = "linear"
}

// MARK: - VideoTypeData
class VideoTypeData: Codable {

    init() {
    }
}

// MARK: - AnalyticsMetadataJSON
class AnalyticsMetadataJSON: Codable {
    let channelNumber: String
    let channelVideoScheduleStartDate: String
    let channelVideoScheduleEndDate: String

    enum CodingKeys: String, CodingKey {
        case channelNumber = "channel_number"
        case channelVideoScheduleStartDate = "channel_video_schedule_start_date"
        case channelVideoScheduleEndDate = "channel_video_schedule_end_date"
    }

    init(channelNumber: String, channelVideoScheduleStartDate: String, channelVideoScheduleEndDate: String) {
        self.channelNumber = channelNumber
        self.channelVideoScheduleStartDate = channelVideoScheduleStartDate
        self.channelVideoScheduleEndDate = channelVideoScheduleEndDate
    }
}

// MARK: - PurpleSharedMetadataJSON
class PurpleSharedMetadataJSON: Codable {
    let streamType: StreamType
    let channelID, channelTitle, channelAdsKey: String
    let contentGroup: ContentGroup
    let epgChannelType: EpgChannelType
    let isEpg: String
    let navigationSection: NavigationSection
    let carouselID, carouselTitle, isRecommendation: String
    let videoGenres: VideoContentVerticalUnion?
    let videoGenresFirst, videoTitle: String?
    let videoLanguage: Language?
    let videoIDExternal: String?
    let videoContentVertical, videoSupplier: VideoContentVerticalUnion?
    let videoType: String?
    let videoRating: RatingValueEnum?
    let videoContentGenres: VideoContentGenresEnum?

    enum CodingKeys: String, CodingKey {
        case streamType = "stream_type"
        case channelID = "channel_id"
        case channelTitle = "channel_title"
        case channelAdsKey = "channel_ads_key"
        case contentGroup = "content_group"
        case epgChannelType = "epg_channel_type"
        case isEpg = "is_epg"
        case navigationSection = "navigation_section"
        case carouselID = "carousel_id"
        case carouselTitle = "carousel_title"
        case isRecommendation = "is_recommendation"
        case videoGenres = "video_genres"
        case videoGenresFirst = "video_genres_first"
        case videoTitle = "video_title"
        case videoLanguage = "video_language"
        case videoIDExternal = "video_id_external"
        case videoContentVertical = "video_content_vertical"
        case videoSupplier = "video_supplier"
        case videoType = "video_type"
        case videoRating = "video_rating"
        case videoContentGenres = "video_content_genres"
    }

    init(streamType: StreamType, channelID: String, channelTitle: String, channelAdsKey: String, contentGroup: ContentGroup, epgChannelType: EpgChannelType, isEpg: String, navigationSection: NavigationSection, carouselID: String, carouselTitle: String, isRecommendation: String, videoGenres: VideoContentVerticalUnion?, videoGenresFirst: String?, videoTitle: String?, videoLanguage: Language?, videoIDExternal: String?, videoContentVertical: VideoContentVerticalUnion?, videoSupplier: VideoContentVerticalUnion?, videoType: String?, videoRating: RatingValueEnum?, videoContentGenres: VideoContentGenresEnum?) {
        self.streamType = streamType
        self.channelID = channelID
        self.channelTitle = channelTitle
        self.channelAdsKey = channelAdsKey
        self.contentGroup = contentGroup
        self.epgChannelType = epgChannelType
        self.isEpg = isEpg
        self.navigationSection = navigationSection
        self.carouselID = carouselID
        self.carouselTitle = carouselTitle
        self.isRecommendation = isRecommendation
        self.videoGenres = videoGenres
        self.videoGenresFirst = videoGenresFirst
        self.videoTitle = videoTitle
        self.videoLanguage = videoLanguage
        self.videoIDExternal = videoIDExternal
        self.videoContentVertical = videoContentVertical
        self.videoSupplier = videoSupplier
        self.videoType = videoType
        self.videoRating = videoRating
        self.videoContentGenres = videoContentGenres
    }
}

enum ContentGroup: String, Codable {
    case firstPartyPromo = "first_party, promo"
    case premium = "premium"
    case promo = "promo"
    case promoPromoUs = "promo, promo_us"
}

enum EpgChannelType: String, Codable {
    case fast = "FAST"
    case game = "GAME"
}

enum NavigationSection: String, Codable {
    case ondemand2 = "ondemand2"
}

enum StreamType: String, Codable {
    case live = "live"
}

enum VideoContentGenresEnum: String, Codable {
    case sports = "sports"
}

enum VideoContentVerticalUnion: Codable {
    case string(String)
    case stringArray([String])

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([String].self) {
            self = .stringArray(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(VideoContentVerticalUnion.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for VideoContentVerticalUnion"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let x):
            try container.encode(x)
        case .stringArray(let x):
            try container.encode(x)
        }
    }
}

enum Language: String, Codable {
    case es = "es"
}

enum RatingValueEnum: String, Codable {
    case tv14 = "TV-14"
    case tvMa = "TV-MA"
    case tvPG = "TV-PG"
    case tvY7 = "TV-Y7"
}

// MARK: - ClickTrackingJSON
class ClickTrackingJSON: Codable {
    let uiContentID, uiContentTitle: String
    let uiContentType: UIContentTypeEnum
    let uiContentGroup: ContentGroup

    enum CodingKeys: String, CodingKey {
        case uiContentID = "ui_content_id"
        case uiContentTitle = "ui_content_title"
        case uiContentType = "ui_content_type"
        case uiContentGroup = "ui_content_group"
    }

    init(uiContentID: String, uiContentTitle: String, uiContentType: UIContentTypeEnum, uiContentGroup: ContentGroup) {
        self.uiContentID = uiContentID
        self.uiContentTitle = uiContentTitle
        self.uiContentType = uiContentType
        self.uiContentGroup = uiContentGroup
    }
}

enum UIContentTypeEnum: String, Codable {
    case epgChannel = "EPGChannel"
    case extra = "EXTRA"
    case movie = "MOVIE"
    case series = "SERIES"
    case sportsGame = "SportsGame"
}

// MARK: - HeroTarget
class HeroTarget: Codable {
    let id: String
    let videoType: UIContentTypeEnum
    let dateReleased, dateModified: String
    let contentUsage: JSONNull?
    let ratings: [Rating]
    let title, description: String
    let genres, badges: [String]
    let imageAssets: [LandscapeFillImage]
    let vodAvailability: Availability
    let videoTypeData: VideoTypeData

    init(id: String, videoType: UIContentTypeEnum, dateReleased: String, dateModified: String, contentUsage: JSONNull?, ratings: [Rating], title: String, description: String, genres: [String], badges: [String], imageAssets: [LandscapeFillImage], vodAvailability: Availability, videoTypeData: VideoTypeData) {
        self.id = id
        self.videoType = videoType
        self.dateReleased = dateReleased
        self.dateModified = dateModified
        self.contentUsage = contentUsage
        self.ratings = ratings
        self.title = title
        self.description = description
        self.genres = genres
        self.badges = badges
        self.imageAssets = imageAssets
        self.vodAvailability = vodAvailability
        self.videoTypeData = videoTypeData
    }
}

// MARK: - Rating
class Rating: Codable {
    let ratingValue: RatingValueEnum
    let ratingSubValues: [RatingSubValue]

    init(ratingValue: RatingValueEnum, ratingSubValues: [RatingSubValue]) {
        self.ratingValue = ratingValue
        self.ratingSubValues = ratingSubValues
    }
}

enum RatingSubValue: String, Codable {
    case d = "D"
    case fv = "FV"
    case l = "L"
    case s = "S"
    case v = "V"
}

// MARK: - Schedule
class Schedule: Codable {
    let id, title: String
    let startDate: String
    let endDate: String
    let imageAssets: [JSONAny]
    let vodAvailable: Bool
    let video: JSONNull?
    let trackingMetadata: ChannelTrackingMetadata

    init(id: String, title: String, startDate: String, endDate: String, imageAssets: [JSONAny], vodAvailable: Bool, video: JSONNull?, trackingMetadata: ChannelTrackingMetadata) {
        self.id = id
        self.title = title
        self.startDate = startDate
        self.endDate = endDate
        self.imageAssets = imageAssets
        self.vodAvailable = vodAvailable
        self.video = video
        self.trackingMetadata = trackingMetadata
    }
}

// MARK: - SportsEvent
class SportsEvent: Codable {
    let id, name: String
    let badges: [String]
    let tournament: AwayTeam
    let vodAvailability: Availability
    let playbackData: SportsEventPlaybackData
    let localTeam, awayTeam: AwayTeam

    init(id: String, name: String, badges: [String], tournament: AwayTeam, vodAvailability: Availability, playbackData: SportsEventPlaybackData, localTeam: AwayTeam, awayTeam: AwayTeam) {
        self.id = id
        self.name = name
        self.badges = badges
        self.tournament = tournament
        self.vodAvailability = vodAvailability
        self.playbackData = playbackData
        self.localTeam = localTeam
        self.awayTeam = awayTeam
    }
}

// MARK: - AwayTeam
class AwayTeam: Codable {
    let id, name: String
    let imageAssets: [LandscapeFillImage]
    let tournamentType: TournamentType?

    init(id: String, name: String, imageAssets: [LandscapeFillImage], tournamentType: TournamentType?) {
        self.id = id
        self.name = name
        self.imageAssets = imageAssets
        self.tournamentType = tournamentType
    }
}

enum TournamentType: String, Codable {
    case league = "LEAGUE"
}

// MARK: - SportsEventPlaybackData
class SportsEventPlaybackData: Codable {
    let stream: Stream
    let kickoffDate, scheduledStartTime, scheduledEndTime, streamID: String
    let trackingMetadata: PlaybackDataTrackingMetadata

    enum CodingKeys: String, CodingKey {
        case stream, kickoffDate, scheduledStartTime, scheduledEndTime
        case streamID = "streamId"
        case trackingMetadata
    }

    init(stream: Stream, kickoffDate: String, scheduledStartTime: String, scheduledEndTime: String, streamID: String, trackingMetadata: PlaybackDataTrackingMetadata) {
        self.stream = stream
        self.kickoffDate = kickoffDate
        self.scheduledStartTime = scheduledStartTime
        self.scheduledEndTime = scheduledEndTime
        self.streamID = streamID
        self.trackingMetadata = trackingMetadata
    }
}

// MARK: - Stream
class Stream: Codable {
    let mcpID: String

    enum CodingKeys: String, CodingKey {
        case mcpID = "mcpId"
    }

    init(mcpID: String) {
        self.mcpID = mcpID
    }
}

// MARK: - PlaybackDataTrackingMetadata
class PlaybackDataTrackingMetadata: Codable {
    let advertisingMetadata: AdvertisingMetadata
    let sharedMetadataJSON: FluffySharedMetadataJSON
    let advertisingMetadataJSON, analyticsMetadataJSON: VideoTypeData

    enum CodingKeys: String, CodingKey {
        case advertisingMetadata
        case sharedMetadataJSON = "sharedMetadataJson"
        case advertisingMetadataJSON = "advertisingMetadataJson"
        case analyticsMetadataJSON = "analyticsMetadataJson"
    }

    init(advertisingMetadata: AdvertisingMetadata, sharedMetadataJSON: FluffySharedMetadataJSON, advertisingMetadataJSON: VideoTypeData, analyticsMetadataJSON: VideoTypeData) {
        self.advertisingMetadata = advertisingMetadata
        self.sharedMetadataJSON = sharedMetadataJSON
        self.advertisingMetadataJSON = advertisingMetadataJSON
        self.analyticsMetadataJSON = analyticsMetadataJSON
    }
}

// MARK: - FluffySharedMetadataJSON
class FluffySharedMetadataJSON: Codable {
    let streamType: StreamType
    let sportsEventID, sportsEventMCPID: String
    let videoType: VideoType
    let contentGroup: ContentGroup
    let isEpg: String
    let navigationSection: NavigationSection
    let carouselID, carouselTitle, isRecommendation, sportsEventTitle: String
    let sportsHomeTeam, sportsAwayTeam: String
    let sportsID: SportsID
    let sportsTitle: SportsTitle
    let sportsLeagueID, sportsLeagueName: String
    let videoContentVertical, videoGenres, videoGenresFirst: VideoContentGenresEnum
    let videoIsKids: String
    let videoRating: PurpleVideoRating
    let sportsPckg: String?

    enum CodingKeys: String, CodingKey {
        case streamType = "stream_type"
        case sportsEventID = "sports_event_id"
        case sportsEventMCPID = "sports_event_mcp_id"
        case videoType = "video_type"
        case contentGroup = "content_group"
        case isEpg = "is_epg"
        case navigationSection = "navigation_section"
        case carouselID = "carousel_id"
        case carouselTitle = "carousel_title"
        case isRecommendation = "is_recommendation"
        case sportsEventTitle = "sports_event_title"
        case sportsHomeTeam = "sports_home_team"
        case sportsAwayTeam = "sports_away_team"
        case sportsID = "sports_id"
        case sportsTitle = "sports_title"
        case sportsLeagueID = "sports_league_id"
        case sportsLeagueName = "sports_league_name"
        case videoContentVertical = "video_content_vertical"
        case videoGenres = "video_genres"
        case videoGenresFirst = "video_genres_first"
        case videoIsKids = "video_is_kids"
        case videoRating = "video_rating"
        case sportsPckg = "sports_pckg"
    }

    init(streamType: StreamType, sportsEventID: String, sportsEventMCPID: String, videoType: VideoType, contentGroup: ContentGroup, isEpg: String, navigationSection: NavigationSection, carouselID: String, carouselTitle: String, isRecommendation: String, sportsEventTitle: String, sportsHomeTeam: String, sportsAwayTeam: String, sportsID: SportsID, sportsTitle: SportsTitle, sportsLeagueID: String, sportsLeagueName: String, videoContentVertical: VideoContentGenresEnum, videoGenres: VideoContentGenresEnum, videoGenresFirst: VideoContentGenresEnum, videoIsKids: String, videoRating: PurpleVideoRating, sportsPckg: String?) {
        self.streamType = streamType
        self.sportsEventID = sportsEventID
        self.sportsEventMCPID = sportsEventMCPID
        self.videoType = videoType
        self.contentGroup = contentGroup
        self.isEpg = isEpg
        self.navigationSection = navigationSection
        self.carouselID = carouselID
        self.carouselTitle = carouselTitle
        self.isRecommendation = isRecommendation
        self.sportsEventTitle = sportsEventTitle
        self.sportsHomeTeam = sportsHomeTeam
        self.sportsAwayTeam = sportsAwayTeam
        self.sportsID = sportsID
        self.sportsTitle = sportsTitle
        self.sportsLeagueID = sportsLeagueID
        self.sportsLeagueName = sportsLeagueName
        self.videoContentVertical = videoContentVertical
        self.videoGenres = videoGenres
        self.videoGenresFirst = videoGenresFirst
        self.videoIsKids = videoIsKids
        self.videoRating = videoRating
        self.sportsPckg = sportsPckg
    }
}

enum SportsID: String, Codable {
    case soccer = "SOCCER"
}

enum SportsTitle: String, Codable {
    case baseball = "Baseball"
    case liveEvents = "Live Events"
    case soccer = "Soccer"
}

enum PurpleVideoRating: String, Codable {
    case unrated = "unrated"
}

enum VideoType: String, Codable {
    case liveevent = "liveevent"
}

// MARK: - Video
class Video: Codable {
    let id: String
    let videoType: UIContentTypeEnum
    let dateModified, dateReleased: String
    let copyrightYear: Int
    let contentUsage: JSONNull?
    let ratings: [Rating]
    let language: Language?
    let title, description: String
    let genres: [String]
    let contributors: [Contributor]
    let imageAssets: [LandscapeFillImage]
    let badges: [String]
    let vodAvailability: Availability
    let videoTypeData: VideoVideoTypeData

    init(id: String, videoType: UIContentTypeEnum, dateModified: String, dateReleased: String, copyrightYear: Int, contentUsage: JSONNull?, ratings: [Rating], language: Language?, title: String, description: String, genres: [String], contributors: [Contributor], imageAssets: [LandscapeFillImage], badges: [String], vodAvailability: Availability, videoTypeData: VideoVideoTypeData) {
        self.id = id
        self.videoType = videoType
        self.dateModified = dateModified
        self.dateReleased = dateReleased
        self.copyrightYear = copyrightYear
        self.contentUsage = contentUsage
        self.ratings = ratings
        self.language = language
        self.title = title
        self.description = description
        self.genres = genres
        self.contributors = contributors
        self.imageAssets = imageAssets
        self.badges = badges
        self.vodAvailability = vodAvailability
        self.videoTypeData = videoTypeData
    }
}

// MARK: - Contributor
class Contributor: Codable {
    let name: String
    let roles: [Role]

    init(name: String, roles: [Role]) {
        self.name = name
        self.roles = roles
    }
}

enum Role: String, Codable {
    case actor = "ACTOR"
    case director = "DIRECTOR"
    case producer = "PRODUCER"
}

// MARK: - VideoVideoTypeData
class VideoVideoTypeData: Codable {
    let playbackData: VideoTypeDataPlaybackData?
    let extraType: String?
    let parents: [Parent]?

    init(playbackData: VideoTypeDataPlaybackData?, extraType: String?, parents: [Parent]?) {
        self.playbackData = playbackData
        self.extraType = extraType
        self.parents = parents
    }
}

// MARK: - Parent
class Parent: Codable {
    let title, id: String

    init(title: String, id: String) {
        self.title = title
        self.id = id
    }
}

// MARK: - VideoTypeDataPlaybackData
class VideoTypeDataPlaybackData: Codable {
    let stream: Stream
    let streamMetadata: StreamMetadata

    init(stream: Stream, streamMetadata: StreamMetadata) {
        self.stream = stream
        self.streamMetadata = streamMetadata
    }
}

// MARK: - StreamMetadata
class StreamMetadata: Codable {
    let duration: Int
    let introStartPosition, introEndPosition, outroStartPosition: Int?
    let introSkippable, outroSkippable: Bool?

    init(duration: Int, introStartPosition: Int?, introEndPosition: Int?, outroStartPosition: Int?, introSkippable: Bool?, outroSkippable: Bool?) {
        self.duration = duration
        self.introStartPosition = introStartPosition
        self.introEndPosition = introEndPosition
        self.outroStartPosition = outroStartPosition
        self.introSkippable = introSkippable
        self.outroSkippable = outroSkippable
    }
}

// MARK: - PageInfo
class PageInfo: Codable {
    let hasPreviousPage, hasNextPage: Bool
    let startCursor, endCursor: String

    init(hasPreviousPage: Bool, hasNextPage: Bool, startCursor: String, endCursor: String) {
        self.hasPreviousPage = hasPreviousPage
        self.hasNextPage = hasNextPage
        self.startCursor = startCursor
        self.endCursor = endCursor
    }
}

// MARK: - TrackingMetadataJSON
class TrackingMetadataJSON: Codable {
    let uiModuleID, uiModuleTitle: String
    let uiNavigationSection: URLPath
    let uiIsRecommendation: Bool
    let uiObjectType: String

    enum CodingKeys: String, CodingKey {
        case uiModuleID = "ui_module_id"
        case uiModuleTitle = "ui_module_title"
        case uiNavigationSection = "ui_navigation_section"
        case uiIsRecommendation = "ui_is_recommendation"
        case uiObjectType = "ui_object_type"
    }

    init(uiModuleID: String, uiModuleTitle: String, uiNavigationSection: URLPath, uiIsRecommendation: Bool, uiObjectType: String) {
        self.uiModuleID = uiModuleID
        self.uiModuleTitle = uiModuleTitle
        self.uiNavigationSection = uiNavigationSection
        self.uiIsRecommendation = uiIsRecommendation
        self.uiObjectType = uiObjectType
    }
}

enum URLPath: String, Codable {
    case ondemand2 = "/ondemand2"
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public func hash(into hasher: inout Hasher) {
        // No-op
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
