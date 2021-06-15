// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct CreateEventInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - name
  ///   - info
  ///   - startDate
  ///   - endDate
  ///   - capacity
  ///   - attendees: attendees to event
  ///   - type
  ///   - status
  public init(name: String, info: String, startDate: String, endDate: Swift.Optional<String?> = nil, capacity: Int, attendees: [GraphQLID], type: EventType, status: EventStatus) {
    graphQLMap = ["name": name, "info": info, "startDate": startDate, "endDate": endDate, "capacity": capacity, "attendees": attendees, "type": type, "status": status]
  }

  public var name: String {
    get {
      return graphQLMap["name"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
    }
  }

  public var info: String {
    get {
      return graphQLMap["info"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "info")
    }
  }

  public var startDate: String {
    get {
      return graphQLMap["startDate"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "startDate")
    }
  }

  public var endDate: Swift.Optional<String?> {
    get {
      return graphQLMap["endDate"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "endDate")
    }
  }

  public var capacity: Int {
    get {
      return graphQLMap["capacity"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "capacity")
    }
  }

  /// attendees to event
  public var attendees: [GraphQLID] {
    get {
      return graphQLMap["attendees"] as! [GraphQLID]
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "attendees")
    }
  }

  public var type: EventType {
    get {
      return graphQLMap["type"] as! EventType
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "type")
    }
  }

  public var status: EventStatus {
    get {
      return graphQLMap["status"] as! EventStatus
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "status")
    }
  }
}

public enum EventType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case tennis
  case basketball
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "tennis": self = .tennis
      case "basketball": self = .basketball
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .tennis: return "tennis"
      case .basketball: return "basketball"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: EventType, rhs: EventType) -> Bool {
    switch (lhs, rhs) {
      case (.tennis, .tennis): return true
      case (.basketball, .basketball): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [EventType] {
    return [
      .tennis,
      .basketball,
    ]
  }
}

public enum EventStatus: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case `open`
  case closed
  case ip
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "open": self = .open
      case "closed": self = .closed
      case "ip": self = .ip
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .open: return "open"
      case .closed: return "closed"
      case .ip: return "ip"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: EventStatus, rhs: EventStatus) -> Bool {
    switch (lhs, rhs) {
      case (.open, .open): return true
      case (.closed, .closed): return true
      case (.ip, .ip): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [EventStatus] {
    return [
      .open,
      .closed,
      .ip,
    ]
  }
}

public enum NotificationType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case friendRequestSend
  case friendRequestAccept
  case friendRequestReject
  case eventInvitation
  case finishEvent
  case voteForMvp
  case selectedMvp
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "friendRequestSend": self = .friendRequestSend
      case "friendRequestAccept": self = .friendRequestAccept
      case "friendRequestReject": self = .friendRequestReject
      case "eventInvitation": self = .eventInvitation
      case "finishEvent": self = .finishEvent
      case "voteForMvp": self = .voteForMvp
      case "selectedMvp": self = .selectedMvp
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .friendRequestSend: return "friendRequestSend"
      case .friendRequestAccept: return "friendRequestAccept"
      case .friendRequestReject: return "friendRequestReject"
      case .eventInvitation: return "eventInvitation"
      case .finishEvent: return "finishEvent"
      case .voteForMvp: return "voteForMvp"
      case .selectedMvp: return "selectedMvp"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: NotificationType, rhs: NotificationType) -> Bool {
    switch (lhs, rhs) {
      case (.friendRequestSend, .friendRequestSend): return true
      case (.friendRequestAccept, .friendRequestAccept): return true
      case (.friendRequestReject, .friendRequestReject): return true
      case (.eventInvitation, .eventInvitation): return true
      case (.finishEvent, .finishEvent): return true
      case (.voteForMvp, .voteForMvp): return true
      case (.selectedMvp, .selectedMvp): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [NotificationType] {
    return [
      .friendRequestSend,
      .friendRequestAccept,
      .friendRequestReject,
      .eventInvitation,
      .finishEvent,
      .voteForMvp,
      .selectedMvp,
    ]
  }
}

public struct EndEventInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - eventId
  ///   - team1Members
  ///   - team1Scores
  ///   - team1Win
  ///   - team2Members
  ///   - team2Scores
  ///   - team2Win
  ///   - resultInfo
  public init(eventId: String, team1Members: [GraphQLID], team1Scores: [Int], team1Win: Bool, team2Members: [GraphQLID], team2Scores: [Int], team2Win: Bool, resultInfo: Swift.Optional<String?> = nil) {
    graphQLMap = ["eventId": eventId, "team1_members": team1Members, "team1_scores": team1Scores, "team1_win": team1Win, "team2_members": team2Members, "team2_scores": team2Scores, "team2_win": team2Win, "resultInfo": resultInfo]
  }

  public var eventId: String {
    get {
      return graphQLMap["eventId"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eventId")
    }
  }

  public var team1Members: [GraphQLID] {
    get {
      return graphQLMap["team1_members"] as! [GraphQLID]
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "team1_members")
    }
  }

  public var team1Scores: [Int] {
    get {
      return graphQLMap["team1_scores"] as! [Int]
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "team1_scores")
    }
  }

  public var team1Win: Bool {
    get {
      return graphQLMap["team1_win"] as! Bool
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "team1_win")
    }
  }

  public var team2Members: [GraphQLID] {
    get {
      return graphQLMap["team2_members"] as! [GraphQLID]
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "team2_members")
    }
  }

  public var team2Scores: [Int] {
    get {
      return graphQLMap["team2_scores"] as! [Int]
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "team2_scores")
    }
  }

  public var team2Win: Bool {
    get {
      return graphQLMap["team2_win"] as! Bool
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "team2_win")
    }
  }

  public var resultInfo: Swift.Optional<String?> {
    get {
      return graphQLMap["resultInfo"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "resultInfo")
    }
  }
}

public struct UpdateUserInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - id
  ///   - firstName
  ///   - lastName
  ///   - college
  ///   - username
  ///   - photoUrl
  public init(id: GraphQLID, firstName: Swift.Optional<String?> = nil, lastName: Swift.Optional<String?> = nil, college: Swift.Optional<String?> = nil, username: Swift.Optional<String?> = nil, photoUrl: Swift.Optional<String?> = nil) {
    graphQLMap = ["id": id, "firstName": firstName, "lastName": lastName, "college": college, "username": username, "photoUrl": photoUrl]
  }

  public var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var firstName: Swift.Optional<String?> {
    get {
      return graphQLMap["firstName"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "firstName")
    }
  }

  public var lastName: Swift.Optional<String?> {
    get {
      return graphQLMap["lastName"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lastName")
    }
  }

  public var college: Swift.Optional<String?> {
    get {
      return graphQLMap["college"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "college")
    }
  }

  public var username: Swift.Optional<String?> {
    get {
      return graphQLMap["username"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "username")
    }
  }

  public var photoUrl: Swift.Optional<String?> {
    get {
      return graphQLMap["photoUrl"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "photoUrl")
    }
  }
}

public enum FriendStatus: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case friend
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "friend": self = .friend
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .friend: return "friend"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: FriendStatus, rhs: FriendStatus) -> Bool {
    switch (lhs, rhs) {
      case (.friend, .friend): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [FriendStatus] {
    return [
      .friend,
    ]
  }
}

public struct CreateUserInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - id: id of user
  ///   - username: username of user
  ///   - firstName: first name of user
  ///   - lastName: last name of user
  public init(id: GraphQLID, username: String, firstName: String, lastName: String) {
    graphQLMap = ["id": id, "username": username, "firstName": firstName, "lastName": lastName]
  }

  /// id of user
  public var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  /// username of user
  public var username: String {
    get {
      return graphQLMap["username"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "username")
    }
  }

  /// first name of user
  public var firstName: String {
    get {
      return graphQLMap["firstName"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "firstName")
    }
  }

  /// last name of user
  public var lastName: String {
    get {
      return graphQLMap["lastName"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lastName")
    }
  }
}

public enum EventAttendeeStatus: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case owner
  case invited
  case ok
  case conflict
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "owner": self = .owner
      case "invited": self = .invited
      case "ok": self = .ok
      case "conflict": self = .conflict
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .owner: return "owner"
      case .invited: return "invited"
      case .ok: return "ok"
      case .conflict: return "conflict"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: EventAttendeeStatus, rhs: EventAttendeeStatus) -> Bool {
    switch (lhs, rhs) {
      case (.owner, .owner): return true
      case (.invited, .invited): return true
      case (.ok, .ok): return true
      case (.conflict, .conflict): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [EventAttendeeStatus] {
    return [
      .owner,
      .invited,
      .ok,
      .conflict,
    ]
  }
}

public final class CreateEventMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation CreateEvent($input: CreateEventInput!) {
      createEvent(createEventInput: $input) {
        __typename
        name
      }
    }
    """

  public let operationName: String = "CreateEvent"

  public var input: CreateEventInput

  public init(input: CreateEventInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("createEvent", arguments: ["createEventInput": GraphQLVariable("input")], type: .nonNull(.object(CreateEvent.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createEvent: CreateEvent) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createEvent": createEvent.resultMap])
    }

    public var createEvent: CreateEvent {
      get {
        return CreateEvent(unsafeResultMap: resultMap["createEvent"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "createEvent")
      }
    }

    public struct CreateEvent: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Event"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String) {
        self.init(unsafeResultMap: ["__typename": "Event", "name": name])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }
    }
  }
}

public final class SearchUsersQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query SearchUsers($query: String!) {
      searchUsers(query: $query) {
        __typename
        id
        username
      }
    }
    """

  public let operationName: String = "SearchUsers"

  public var query: String

  public init(query: String) {
    self.query = query
  }

  public var variables: GraphQLMap? {
    return ["query": query]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("searchUsers", arguments: ["query": GraphQLVariable("query")], type: .nonNull(.list(.nonNull(.object(SearchUser.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(searchUsers: [SearchUser]) {
      self.init(unsafeResultMap: ["__typename": "Query", "searchUsers": searchUsers.map { (value: SearchUser) -> ResultMap in value.resultMap }])
    }

    public var searchUsers: [SearchUser] {
      get {
        return (resultMap["searchUsers"] as! [ResultMap]).map { (value: ResultMap) -> SearchUser in SearchUser(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: SearchUser) -> ResultMap in value.resultMap }, forKey: "searchUsers")
      }
    }

    public struct SearchUser: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("username", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, username: String) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "username": username])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// ID of user
      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// username of user
      public var username: String {
        get {
          return resultMap["username"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "username")
        }
      }
    }
  }
}

public final class GetFriendsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetFriends($userId: String!) {
      user(id: $userId) {
        __typename
        friends {
          __typename
          id
          username
          firstName
          lastName
          photoUrl
        }
      }
    }
    """

  public let operationName: String = "GetFriends"

  public var userId: String

  public init(userId: String) {
    self.userId = userId
  }

  public var variables: GraphQLMap? {
    return ["userId": userId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("user", arguments: ["id": GraphQLVariable("userId")], type: .nonNull(.object(User.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(user: User) {
      self.init(unsafeResultMap: ["__typename": "Query", "user": user.resultMap])
    }

    public var user: User {
      get {
        return User(unsafeResultMap: resultMap["user"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "user")
      }
    }

    public struct User: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("friends", type: .nonNull(.list(.nonNull(.object(Friend.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(friends: [Friend]) {
        self.init(unsafeResultMap: ["__typename": "User", "friends": friends.map { (value: Friend) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var friends: [Friend] {
        get {
          return (resultMap["friends"] as! [ResultMap]).map { (value: ResultMap) -> Friend in Friend(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Friend) -> ResultMap in value.resultMap }, forKey: "friends")
        }
      }

      public struct Friend: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["User"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("username", type: .nonNull(.scalar(String.self))),
            GraphQLField("firstName", type: .nonNull(.scalar(String.self))),
            GraphQLField("lastName", type: .nonNull(.scalar(String.self))),
            GraphQLField("photoUrl", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, username: String, firstName: String, lastName: String, photoUrl: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "User", "id": id, "username": username, "firstName": firstName, "lastName": lastName, "photoUrl": photoUrl])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// ID of user
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        /// username of user
        public var username: String {
          get {
            return resultMap["username"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "username")
          }
        }

        /// first name of user
        public var firstName: String {
          get {
            return resultMap["firstName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "firstName")
          }
        }

        /// last name of user
        public var lastName: String {
          get {
            return resultMap["lastName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "lastName")
          }
        }

        /// photo url of user
        public var photoUrl: String? {
          get {
            return resultMap["photoUrl"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "photoUrl")
          }
        }
      }
    }
  }
}

public final class QueryEventsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query QueryEvents($userId: String, $type: EventType, $status: EventStatus) {
      queryEvents(userId: $userId, type: $type, status: $status) {
        __typename
        ...EventDetails
      }
    }
    """

  public let operationName: String = "QueryEvents"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + EventDetails.fragmentDefinition)
    document.append("\n" + UserDetails.fragmentDefinition)
    return document
  }

  public var userId: String?
  public var type: EventType?
  public var status: EventStatus?

  public init(userId: String? = nil, type: EventType? = nil, status: EventStatus? = nil) {
    self.userId = userId
    self.type = type
    self.status = status
  }

  public var variables: GraphQLMap? {
    return ["userId": userId, "type": type, "status": status]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("queryEvents", arguments: ["userId": GraphQLVariable("userId"), "type": GraphQLVariable("type"), "status": GraphQLVariable("status")], type: .nonNull(.list(.nonNull(.object(QueryEvent.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(queryEvents: [QueryEvent]) {
      self.init(unsafeResultMap: ["__typename": "Query", "queryEvents": queryEvents.map { (value: QueryEvent) -> ResultMap in value.resultMap }])
    }

    public var queryEvents: [QueryEvent] {
      get {
        return (resultMap["queryEvents"] as! [ResultMap]).map { (value: ResultMap) -> QueryEvent in QueryEvent(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: QueryEvent) -> ResultMap in value.resultMap }, forKey: "queryEvents")
      }
    }

    public struct QueryEvent: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Event"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(EventDetails.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var eventDetails: EventDetails {
          get {
            return EventDetails(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class AcceptFriendRequestMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation AcceptFriendRequest($userId: String!, $friendId: String!) {
      acceptFriendRequest(user_id: $userId, friend_id: $friendId) {
        __typename
        id
      }
    }
    """

  public let operationName: String = "AcceptFriendRequest"

  public var userId: String
  public var friendId: String

  public init(userId: String, friendId: String) {
    self.userId = userId
    self.friendId = friendId
  }

  public var variables: GraphQLMap? {
    return ["userId": userId, "friendId": friendId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("acceptFriendRequest", arguments: ["user_id": GraphQLVariable("userId"), "friend_id": GraphQLVariable("friendId")], type: .object(AcceptFriendRequest.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(acceptFriendRequest: AcceptFriendRequest? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "acceptFriendRequest": acceptFriendRequest.flatMap { (value: AcceptFriendRequest) -> ResultMap in value.resultMap }])
    }

    public var acceptFriendRequest: AcceptFriendRequest? {
      get {
        return (resultMap["acceptFriendRequest"] as? ResultMap).flatMap { AcceptFriendRequest(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "acceptFriendRequest")
      }
    }

    public struct AcceptFriendRequest: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// ID of user
      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }
    }
  }
}

public final class RejectFriendRequestMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation RejectFriendRequest($userId: String!, $friendId: String!) {
      rejectFriendRequest(user_id: $userId, friend_id: $friendId) {
        __typename
        id
      }
    }
    """

  public let operationName: String = "RejectFriendRequest"

  public var userId: String
  public var friendId: String

  public init(userId: String, friendId: String) {
    self.userId = userId
    self.friendId = friendId
  }

  public var variables: GraphQLMap? {
    return ["userId": userId, "friendId": friendId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("rejectFriendRequest", arguments: ["user_id": GraphQLVariable("userId"), "friend_id": GraphQLVariable("friendId")], type: .object(RejectFriendRequest.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(rejectFriendRequest: RejectFriendRequest? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "rejectFriendRequest": rejectFriendRequest.flatMap { (value: RejectFriendRequest) -> ResultMap in value.resultMap }])
    }

    public var rejectFriendRequest: RejectFriendRequest? {
      get {
        return (resultMap["rejectFriendRequest"] as? ResultMap).flatMap { RejectFriendRequest(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "rejectFriendRequest")
      }
    }

    public struct RejectFriendRequest: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// ID of user
      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }
    }
  }
}

public final class GetNotificationsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetNotifications($userId: String!) {
      user(id: $userId) {
        __typename
        id
        notifications {
          __typename
          id
          createdAt
          type
          actor {
            __typename
            ...UserDetails
          }
          event {
            __typename
            ...EventDetails
          }
        }
      }
    }
    """

  public let operationName: String = "GetNotifications"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + UserDetails.fragmentDefinition)
    document.append("\n" + EventDetails.fragmentDefinition)
    return document
  }

  public var userId: String

  public init(userId: String) {
    self.userId = userId
  }

  public var variables: GraphQLMap? {
    return ["userId": userId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("user", arguments: ["id": GraphQLVariable("userId")], type: .nonNull(.object(User.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(user: User) {
      self.init(unsafeResultMap: ["__typename": "Query", "user": user.resultMap])
    }

    public var user: User {
      get {
        return User(unsafeResultMap: resultMap["user"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "user")
      }
    }

    public struct User: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("notifications", type: .nonNull(.list(.nonNull(.object(Notification.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, notifications: [Notification]) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "notifications": notifications.map { (value: Notification) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// ID of user
      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var notifications: [Notification] {
        get {
          return (resultMap["notifications"] as! [ResultMap]).map { (value: ResultMap) -> Notification in Notification(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Notification) -> ResultMap in value.resultMap }, forKey: "notifications")
        }
      }

      public struct Notification: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Notification"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
            GraphQLField("type", type: .nonNull(.scalar(NotificationType.self))),
            GraphQLField("actor", type: .object(Actor.selections)),
            GraphQLField("event", type: .object(Event.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, createdAt: String, type: NotificationType, actor: Actor? = nil, event: Event? = nil) {
          self.init(unsafeResultMap: ["__typename": "Notification", "id": id, "createdAt": createdAt, "type": type, "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }, "event": event.flatMap { (value: Event) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var createdAt: String {
          get {
            return resultMap["createdAt"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var type: NotificationType {
          get {
            return resultMap["type"]! as! NotificationType
          }
          set {
            resultMap.updateValue(newValue, forKey: "type")
          }
        }

        public var actor: Actor? {
          get {
            return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "actor")
          }
        }

        public var event: Event? {
          get {
            return (resultMap["event"] as? ResultMap).flatMap { Event(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "event")
          }
        }

        public struct Actor: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["User"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLFragmentSpread(UserDetails.self),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, firstName: String, lastName: String, username: String, photoUrl: String? = nil, college: String? = nil, eventAttendeeStatus: EventAttendeeStatus? = nil) {
            self.init(unsafeResultMap: ["__typename": "User", "id": id, "firstName": firstName, "lastName": lastName, "username": username, "photoUrl": photoUrl, "college": college, "eventAttendeeStatus": eventAttendeeStatus])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var userDetails: UserDetails {
              get {
                return UserDetails(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }
        }

        public struct Event: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Event"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLFragmentSpread(EventDetails.self),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var eventDetails: EventDetails {
              get {
                return EventDetails(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }
        }
      }
    }
  }
}

public final class ReadNotificationMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation ReadNotification($id: ID!) {
      markNotificationAsRead(id: $id) {
        __typename
        id
      }
    }
    """

  public let operationName: String = "ReadNotification"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("markNotificationAsRead", arguments: ["id": GraphQLVariable("id")], type: .object(MarkNotificationAsRead.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(markNotificationAsRead: MarkNotificationAsRead? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "markNotificationAsRead": markNotificationAsRead.flatMap { (value: MarkNotificationAsRead) -> ResultMap in value.resultMap }])
    }

    public var markNotificationAsRead: MarkNotificationAsRead? {
      get {
        return (resultMap["markNotificationAsRead"] as? ResultMap).flatMap { MarkNotificationAsRead(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "markNotificationAsRead")
      }
    }

    public struct MarkNotificationAsRead: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Notification"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID) {
        self.init(unsafeResultMap: ["__typename": "Notification", "id": id])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }
    }
  }
}

public final class JoinEventMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation JoinEvent($userId: ID!, $eventId: ID!) {
      joinEvent(userId: $userId, eventId: $eventId) {
        __typename
        id
      }
    }
    """

  public let operationName: String = "JoinEvent"

  public var userId: GraphQLID
  public var eventId: GraphQLID

  public init(userId: GraphQLID, eventId: GraphQLID) {
    self.userId = userId
    self.eventId = eventId
  }

  public var variables: GraphQLMap? {
    return ["userId": userId, "eventId": eventId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("joinEvent", arguments: ["userId": GraphQLVariable("userId"), "eventId": GraphQLVariable("eventId")], type: .nonNull(.object(JoinEvent.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(joinEvent: JoinEvent) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "joinEvent": joinEvent.resultMap])
    }

    public var joinEvent: JoinEvent {
      get {
        return JoinEvent(unsafeResultMap: resultMap["joinEvent"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "joinEvent")
      }
    }

    public struct JoinEvent: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Event"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID) {
        self.init(unsafeResultMap: ["__typename": "Event", "id": id])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// id of event
      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }
    }
  }
}

public final class AcceptEventInvitationMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation AcceptEventInvitation($eventId: ID!, $userId: ID!) {
      acceptEventInvitation(eventId: $eventId, userId: $userId) {
        __typename
        id
      }
    }
    """

  public let operationName: String = "AcceptEventInvitation"

  public var eventId: GraphQLID
  public var userId: GraphQLID

  public init(eventId: GraphQLID, userId: GraphQLID) {
    self.eventId = eventId
    self.userId = userId
  }

  public var variables: GraphQLMap? {
    return ["eventId": eventId, "userId": userId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("acceptEventInvitation", arguments: ["eventId": GraphQLVariable("eventId"), "userId": GraphQLVariable("userId")], type: .object(AcceptEventInvitation.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(acceptEventInvitation: AcceptEventInvitation? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "acceptEventInvitation": acceptEventInvitation.flatMap { (value: AcceptEventInvitation) -> ResultMap in value.resultMap }])
    }

    public var acceptEventInvitation: AcceptEventInvitation? {
      get {
        return (resultMap["acceptEventInvitation"] as? ResultMap).flatMap { AcceptEventInvitation(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "acceptEventInvitation")
      }
    }

    public struct AcceptEventInvitation: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Event"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID) {
        self.init(unsafeResultMap: ["__typename": "Event", "id": id])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// id of event
      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }
    }
  }
}

public final class DeclineEventInvitationMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation DeclineEventInvitation($eventId: ID!, $userId: ID!) {
      declineEventInvitation(eventId: $eventId, userId: $userId) {
        __typename
        id
      }
    }
    """

  public let operationName: String = "DeclineEventInvitation"

  public var eventId: GraphQLID
  public var userId: GraphQLID

  public init(eventId: GraphQLID, userId: GraphQLID) {
    self.eventId = eventId
    self.userId = userId
  }

  public var variables: GraphQLMap? {
    return ["eventId": eventId, "userId": userId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("declineEventInvitation", arguments: ["eventId": GraphQLVariable("eventId"), "userId": GraphQLVariable("userId")], type: .object(DeclineEventInvitation.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(declineEventInvitation: DeclineEventInvitation? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "declineEventInvitation": declineEventInvitation.flatMap { (value: DeclineEventInvitation) -> ResultMap in value.resultMap }])
    }

    public var declineEventInvitation: DeclineEventInvitation? {
      get {
        return (resultMap["declineEventInvitation"] as? ResultMap).flatMap { DeclineEventInvitation(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "declineEventInvitation")
      }
    }

    public struct DeclineEventInvitation: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Event"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID) {
        self.init(unsafeResultMap: ["__typename": "Event", "id": id])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// id of event
      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }
    }
  }
}

public final class EndEventMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation EndEvent($input: EndEventInput!) {
      endEvent(input: $input) {
        __typename
        id
      }
    }
    """

  public let operationName: String = "EndEvent"

  public var input: EndEventInput

  public init(input: EndEventInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("endEvent", arguments: ["input": GraphQLVariable("input")], type: .nonNull(.object(EndEvent.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(endEvent: EndEvent) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "endEvent": endEvent.resultMap])
    }

    public var endEvent: EndEvent {
      get {
        return EndEvent(unsafeResultMap: resultMap["endEvent"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "endEvent")
      }
    }

    public struct EndEvent: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Event"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID) {
        self.init(unsafeResultMap: ["__typename": "Event", "id": id])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// id of event
      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }
    }
  }
}

public final class VoteForMvpMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation VoteForMVP($eventId: ID!, $voterId: ID!, $voteeId: ID!) {
      voteForMvp(eventId: $eventId, voterId: $voterId, voteeId: $voteeId) {
        __typename
        id
      }
    }
    """

  public let operationName: String = "VoteForMVP"

  public var eventId: GraphQLID
  public var voterId: GraphQLID
  public var voteeId: GraphQLID

  public init(eventId: GraphQLID, voterId: GraphQLID, voteeId: GraphQLID) {
    self.eventId = eventId
    self.voterId = voterId
    self.voteeId = voteeId
  }

  public var variables: GraphQLMap? {
    return ["eventId": eventId, "voterId": voterId, "voteeId": voteeId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("voteForMvp", arguments: ["eventId": GraphQLVariable("eventId"), "voterId": GraphQLVariable("voterId"), "voteeId": GraphQLVariable("voteeId")], type: .object(VoteForMvp.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(voteForMvp: VoteForMvp? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "voteForMvp": voteForMvp.flatMap { (value: VoteForMvp) -> ResultMap in value.resultMap }])
    }

    public var voteForMvp: VoteForMvp? {
      get {
        return (resultMap["voteForMvp"] as? ResultMap).flatMap { VoteForMvp(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "voteForMvp")
      }
    }

    public struct VoteForMvp: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Event"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID) {
        self.init(unsafeResultMap: ["__typename": "Event", "id": id])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// id of event
      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }
    }
  }
}

public final class UpdateUserMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation UpdateUser($input: UpdateUserInput!) {
      updateUser(updateUserInput: $input) {
        __typename
        id
        firstName
        lastName
        username
        college
        photoUrl
      }
    }
    """

  public let operationName: String = "UpdateUser"

  public var input: UpdateUserInput

  public init(input: UpdateUserInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("updateUser", arguments: ["updateUserInput": GraphQLVariable("input")], type: .nonNull(.object(UpdateUser.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateUser: UpdateUser) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "updateUser": updateUser.resultMap])
    }

    public var updateUser: UpdateUser {
      get {
        return UpdateUser(unsafeResultMap: resultMap["updateUser"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "updateUser")
      }
    }

    public struct UpdateUser: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("firstName", type: .nonNull(.scalar(String.self))),
          GraphQLField("lastName", type: .nonNull(.scalar(String.self))),
          GraphQLField("username", type: .nonNull(.scalar(String.self))),
          GraphQLField("college", type: .scalar(String.self)),
          GraphQLField("photoUrl", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, firstName: String, lastName: String, username: String, college: String? = nil, photoUrl: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "firstName": firstName, "lastName": lastName, "username": username, "college": college, "photoUrl": photoUrl])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// ID of user
      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// first name of user
      public var firstName: String {
        get {
          return resultMap["firstName"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "firstName")
        }
      }

      /// last name of user
      public var lastName: String {
        get {
          return resultMap["lastName"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "lastName")
        }
      }

      /// username of user
      public var username: String {
        get {
          return resultMap["username"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "username")
        }
      }

      /// name of college
      public var college: String? {
        get {
          return resultMap["college"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "college")
        }
      }

      /// photo url of user
      public var photoUrl: String? {
        get {
          return resultMap["photoUrl"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "photoUrl")
        }
      }
    }
  }
}

public final class GetUserEventsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetUserEvents($userId: String!, $status: EventStatus!) {
      userEvents(userId: $userId, status: $status) {
        __typename
        ...EventDetails
      }
    }
    """

  public let operationName: String = "GetUserEvents"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + EventDetails.fragmentDefinition)
    document.append("\n" + UserDetails.fragmentDefinition)
    return document
  }

  public var userId: String
  public var status: EventStatus

  public init(userId: String, status: EventStatus) {
    self.userId = userId
    self.status = status
  }

  public var variables: GraphQLMap? {
    return ["userId": userId, "status": status]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("userEvents", arguments: ["userId": GraphQLVariable("userId"), "status": GraphQLVariable("status")], type: .nonNull(.list(.nonNull(.object(UserEvent.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(userEvents: [UserEvent]) {
      self.init(unsafeResultMap: ["__typename": "Query", "userEvents": userEvents.map { (value: UserEvent) -> ResultMap in value.resultMap }])
    }

    public var userEvents: [UserEvent] {
      get {
        return (resultMap["userEvents"] as! [ResultMap]).map { (value: ResultMap) -> UserEvent in UserEvent(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: UserEvent) -> ResultMap in value.resultMap }, forKey: "userEvents")
      }
    }

    public struct UserEvent: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Event"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(EventDetails.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var eventDetails: EventDetails {
          get {
            return EventDetails(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class GetUserQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetUser($id: String!, $authId: String!) {
      user(id: $id) {
        __typename
        id
        firstName
        lastName
        username
        college
        photoUrl
        friendStatus(user_id: $authId)
        goatScore
        friends {
          __typename
          id
        }
      }
    }
    """

  public let operationName: String = "GetUser"

  public var id: String
  public var authId: String

  public init(id: String, authId: String) {
    self.id = id
    self.authId = authId
  }

  public var variables: GraphQLMap? {
    return ["id": id, "authId": authId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("user", arguments: ["id": GraphQLVariable("id")], type: .nonNull(.object(User.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(user: User) {
      self.init(unsafeResultMap: ["__typename": "Query", "user": user.resultMap])
    }

    public var user: User {
      get {
        return User(unsafeResultMap: resultMap["user"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "user")
      }
    }

    public struct User: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("firstName", type: .nonNull(.scalar(String.self))),
          GraphQLField("lastName", type: .nonNull(.scalar(String.self))),
          GraphQLField("username", type: .nonNull(.scalar(String.self))),
          GraphQLField("college", type: .scalar(String.self)),
          GraphQLField("photoUrl", type: .scalar(String.self)),
          GraphQLField("friendStatus", arguments: ["user_id": GraphQLVariable("authId")], type: .scalar(FriendStatus.self)),
          GraphQLField("goatScore", type: .nonNull(.scalar(Int.self))),
          GraphQLField("friends", type: .nonNull(.list(.nonNull(.object(Friend.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, firstName: String, lastName: String, username: String, college: String? = nil, photoUrl: String? = nil, friendStatus: FriendStatus? = nil, goatScore: Int, friends: [Friend]) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "firstName": firstName, "lastName": lastName, "username": username, "college": college, "photoUrl": photoUrl, "friendStatus": friendStatus, "goatScore": goatScore, "friends": friends.map { (value: Friend) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// ID of user
      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// first name of user
      public var firstName: String {
        get {
          return resultMap["firstName"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "firstName")
        }
      }

      /// last name of user
      public var lastName: String {
        get {
          return resultMap["lastName"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "lastName")
        }
      }

      /// username of user
      public var username: String {
        get {
          return resultMap["username"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "username")
        }
      }

      /// name of college
      public var college: String? {
        get {
          return resultMap["college"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "college")
        }
      }

      /// photo url of user
      public var photoUrl: String? {
        get {
          return resultMap["photoUrl"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "photoUrl")
        }
      }

      /// Friend status of user
      public var friendStatus: FriendStatus? {
        get {
          return resultMap["friendStatus"] as? FriendStatus
        }
        set {
          resultMap.updateValue(newValue, forKey: "friendStatus")
        }
      }

      public var goatScore: Int {
        get {
          return resultMap["goatScore"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "goatScore")
        }
      }

      public var friends: [Friend] {
        get {
          return (resultMap["friends"] as! [ResultMap]).map { (value: ResultMap) -> Friend in Friend(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Friend) -> ResultMap in value.resultMap }, forKey: "friends")
        }
      }

      public struct Friend: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["User"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID) {
          self.init(unsafeResultMap: ["__typename": "User", "id": id])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// ID of user
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }
      }
    }
  }
}

public final class SendFriendRequestMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation SendFriendRequest($userId: String!, $friendId: String!) {
      sendFriendRequest(user_id: $userId, friend_id: $friendId) {
        __typename
        id
      }
    }
    """

  public let operationName: String = "SendFriendRequest"

  public var userId: String
  public var friendId: String

  public init(userId: String, friendId: String) {
    self.userId = userId
    self.friendId = friendId
  }

  public var variables: GraphQLMap? {
    return ["userId": userId, "friendId": friendId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("sendFriendRequest", arguments: ["user_id": GraphQLVariable("userId"), "friend_id": GraphQLVariable("friendId")], type: .object(SendFriendRequest.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(sendFriendRequest: SendFriendRequest? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "sendFriendRequest": sendFriendRequest.flatMap { (value: SendFriendRequest) -> ResultMap in value.resultMap }])
    }

    public var sendFriendRequest: SendFriendRequest? {
      get {
        return (resultMap["sendFriendRequest"] as? ResultMap).flatMap { SendFriendRequest(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "sendFriendRequest")
      }
    }

    public struct SendFriendRequest: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// ID of user
      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }
    }
  }
}

public final class CreateUserMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation CreateUser($createUserInput: CreateUserInput!) {
      createUser(createUserInput: $createUserInput) {
        __typename
        id
        firstName
        lastName
        username
        college
      }
    }
    """

  public let operationName: String = "CreateUser"

  public var createUserInput: CreateUserInput

  public init(createUserInput: CreateUserInput) {
    self.createUserInput = createUserInput
  }

  public var variables: GraphQLMap? {
    return ["createUserInput": createUserInput]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("createUser", arguments: ["createUserInput": GraphQLVariable("createUserInput")], type: .nonNull(.object(CreateUser.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createUser: CreateUser) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createUser": createUser.resultMap])
    }

    public var createUser: CreateUser {
      get {
        return CreateUser(unsafeResultMap: resultMap["createUser"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "createUser")
      }
    }

    public struct CreateUser: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("firstName", type: .nonNull(.scalar(String.self))),
          GraphQLField("lastName", type: .nonNull(.scalar(String.self))),
          GraphQLField("username", type: .nonNull(.scalar(String.self))),
          GraphQLField("college", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, firstName: String, lastName: String, username: String, college: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "firstName": firstName, "lastName": lastName, "username": username, "college": college])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// ID of user
      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// first name of user
      public var firstName: String {
        get {
          return resultMap["firstName"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "firstName")
        }
      }

      /// last name of user
      public var lastName: String {
        get {
          return resultMap["lastName"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "lastName")
        }
      }

      /// username of user
      public var username: String {
        get {
          return resultMap["username"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "username")
        }
      }

      /// name of college
      public var college: String? {
        get {
          return resultMap["college"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "college")
        }
      }
    }
  }
}

public struct EventDetails: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment EventDetails on Event {
      __typename
      id
      name
      info
      capacity
      attendees {
        __typename
        ...UserDetails
      }
      startDate
      endDate
      type
      status
      winner {
        __typename
        id
      }
      teams {
        __typename
        id
        scores
        members {
          __typename
          id
        }
      }
      mvp {
        __typename
        id
      }
    }
    """

  public static let possibleTypes: [String] = ["Event"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("name", type: .nonNull(.scalar(String.self))),
      GraphQLField("info", type: .nonNull(.scalar(String.self))),
      GraphQLField("capacity", type: .nonNull(.scalar(Int.self))),
      GraphQLField("attendees", type: .nonNull(.list(.nonNull(.object(Attendee.selections))))),
      GraphQLField("startDate", type: .nonNull(.scalar(String.self))),
      GraphQLField("endDate", type: .scalar(String.self)),
      GraphQLField("type", type: .nonNull(.scalar(EventType.self))),
      GraphQLField("status", type: .nonNull(.scalar(EventStatus.self))),
      GraphQLField("winner", type: .object(Winner.selections)),
      GraphQLField("teams", type: .list(.nonNull(.object(Team.selections)))),
      GraphQLField("mvp", type: .object(Mvp.selections)),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, name: String, info: String, capacity: Int, attendees: [Attendee], startDate: String, endDate: String? = nil, type: EventType, status: EventStatus, winner: Winner? = nil, teams: [Team]? = nil, mvp: Mvp? = nil) {
    self.init(unsafeResultMap: ["__typename": "Event", "id": id, "name": name, "info": info, "capacity": capacity, "attendees": attendees.map { (value: Attendee) -> ResultMap in value.resultMap }, "startDate": startDate, "endDate": endDate, "type": type, "status": status, "winner": winner.flatMap { (value: Winner) -> ResultMap in value.resultMap }, "teams": teams.flatMap { (value: [Team]) -> [ResultMap] in value.map { (value: Team) -> ResultMap in value.resultMap } }, "mvp": mvp.flatMap { (value: Mvp) -> ResultMap in value.resultMap }])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  /// id of event
  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var name: String {
    get {
      return resultMap["name"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "name")
    }
  }

  public var info: String {
    get {
      return resultMap["info"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "info")
    }
  }

  public var capacity: Int {
    get {
      return resultMap["capacity"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "capacity")
    }
  }

  /// users who attended or will attend the event
  public var attendees: [Attendee] {
    get {
      return (resultMap["attendees"] as! [ResultMap]).map { (value: ResultMap) -> Attendee in Attendee(unsafeResultMap: value) }
    }
    set {
      resultMap.updateValue(newValue.map { (value: Attendee) -> ResultMap in value.resultMap }, forKey: "attendees")
    }
  }

  public var startDate: String {
    get {
      return resultMap["startDate"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "startDate")
    }
  }

  /// end time of event
  public var endDate: String? {
    get {
      return resultMap["endDate"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "endDate")
    }
  }

  public var type: EventType {
    get {
      return resultMap["type"]! as! EventType
    }
    set {
      resultMap.updateValue(newValue, forKey: "type")
    }
  }

  public var status: EventStatus {
    get {
      return resultMap["status"]! as! EventStatus
    }
    set {
      resultMap.updateValue(newValue, forKey: "status")
    }
  }

  public var winner: Winner? {
    get {
      return (resultMap["winner"] as? ResultMap).flatMap { Winner(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "winner")
    }
  }

  public var teams: [Team]? {
    get {
      return (resultMap["teams"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Team] in value.map { (value: ResultMap) -> Team in Team(unsafeResultMap: value) } }
    }
    set {
      resultMap.updateValue(newValue.flatMap { (value: [Team]) -> [ResultMap] in value.map { (value: Team) -> ResultMap in value.resultMap } }, forKey: "teams")
    }
  }

  public var mvp: Mvp? {
    get {
      return (resultMap["mvp"] as? ResultMap).flatMap { Mvp(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "mvp")
    }
  }

  public struct Attendee: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["User"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(UserDetails.self),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, firstName: String, lastName: String, username: String, photoUrl: String? = nil, college: String? = nil, eventAttendeeStatus: EventAttendeeStatus? = nil) {
      self.init(unsafeResultMap: ["__typename": "User", "id": id, "firstName": firstName, "lastName": lastName, "username": username, "photoUrl": photoUrl, "college": college, "eventAttendeeStatus": eventAttendeeStatus])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(unsafeResultMap: resultMap)
      }
      set {
        resultMap += newValue.resultMap
      }
    }

    public struct Fragments {
      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var userDetails: UserDetails {
        get {
          return UserDetails(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }
    }
  }

  public struct Winner: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["EventTeam"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID) {
      self.init(unsafeResultMap: ["__typename": "EventTeam", "id": id])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return resultMap["id"]! as! GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "id")
      }
    }
  }

  public struct Team: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["EventTeam"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("scores", type: .nonNull(.list(.nonNull(.scalar(Int.self))))),
        GraphQLField("members", type: .nonNull(.list(.nonNull(.object(Member.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, scores: [Int], members: [Member]) {
      self.init(unsafeResultMap: ["__typename": "EventTeam", "id": id, "scores": scores, "members": members.map { (value: Member) -> ResultMap in value.resultMap }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return resultMap["id"]! as! GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "id")
      }
    }

    public var scores: [Int] {
      get {
        return resultMap["scores"]! as! [Int]
      }
      set {
        resultMap.updateValue(newValue, forKey: "scores")
      }
    }

    public var members: [Member] {
      get {
        return (resultMap["members"] as! [ResultMap]).map { (value: ResultMap) -> Member in Member(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Member) -> ResultMap in value.resultMap }, forKey: "members")
      }
    }

    public struct Member: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// ID of user
      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }
    }
  }

  public struct Mvp: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["User"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID) {
      self.init(unsafeResultMap: ["__typename": "User", "id": id])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// ID of user
    public var id: GraphQLID {
      get {
        return resultMap["id"]! as! GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "id")
      }
    }
  }
}

public struct UserDetails: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment UserDetails on User {
      __typename
      id
      firstName
      lastName
      username
      photoUrl
      college
      eventAttendeeStatus
    }
    """

  public static let possibleTypes: [String] = ["User"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("firstName", type: .nonNull(.scalar(String.self))),
      GraphQLField("lastName", type: .nonNull(.scalar(String.self))),
      GraphQLField("username", type: .nonNull(.scalar(String.self))),
      GraphQLField("photoUrl", type: .scalar(String.self)),
      GraphQLField("college", type: .scalar(String.self)),
      GraphQLField("eventAttendeeStatus", type: .scalar(EventAttendeeStatus.self)),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, firstName: String, lastName: String, username: String, photoUrl: String? = nil, college: String? = nil, eventAttendeeStatus: EventAttendeeStatus? = nil) {
    self.init(unsafeResultMap: ["__typename": "User", "id": id, "firstName": firstName, "lastName": lastName, "username": username, "photoUrl": photoUrl, "college": college, "eventAttendeeStatus": eventAttendeeStatus])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  /// ID of user
  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  /// first name of user
  public var firstName: String {
    get {
      return resultMap["firstName"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "firstName")
    }
  }

  /// last name of user
  public var lastName: String {
    get {
      return resultMap["lastName"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "lastName")
    }
  }

  /// username of user
  public var username: String {
    get {
      return resultMap["username"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "username")
    }
  }

  /// photo url of user
  public var photoUrl: String? {
    get {
      return resultMap["photoUrl"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "photoUrl")
    }
  }

  /// name of college
  public var college: String? {
    get {
      return resultMap["college"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "college")
    }
  }

  public var eventAttendeeStatus: EventAttendeeStatus? {
    get {
      return resultMap["eventAttendeeStatus"] as? EventAttendeeStatus
    }
    set {
      resultMap.updateValue(newValue, forKey: "eventAttendeeStatus")
    }
  }
}
