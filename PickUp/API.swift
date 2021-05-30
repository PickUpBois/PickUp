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
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "open": self = .open
      case "closed": self = .closed
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .open: return "open"
      case .closed: return "closed"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: EventStatus, rhs: EventStatus) -> Bool {
    switch (lhs, rhs) {
      case (.open, .open): return true
      case (.closed, .closed): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [EventStatus] {
    return [
      .open,
      .closed,
    ]
  }
}

public enum NotificationType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case friendRequestSend
  case friendRequestAccept
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "friendRequestSend": self = .friendRequestSend
      case "friendRequestAccept": self = .friendRequestAccept
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .friendRequestSend: return "friendRequestSend"
      case .friendRequestAccept: return "friendRequestAccept"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: NotificationType, rhs: NotificationType) -> Bool {
    switch (lhs, rhs) {
      case (.friendRequestSend, .friendRequestSend): return true
      case (.friendRequestAccept, .friendRequestAccept): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [NotificationType] {
    return [
      .friendRequestSend,
      .friendRequestAccept,
    ]
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

public final class QueryEventsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query QueryEvents($userId: String, $type: EventType, $status: EventStatus) {
      queryEvents(userId: $userId, type: $type, status: $status) {
        __typename
        id
        name
        info
        capacity
        attendees {
          __typename
          id
          firstName
          lastName
          username
          college
          photoUrl
        }
        startDate
        endDate
        type
        status
      }
    }
    """

  public let operationName: String = "QueryEvents"

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
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("info", type: .nonNull(.scalar(String.self))),
          GraphQLField("capacity", type: .nonNull(.scalar(Int.self))),
          GraphQLField("attendees", type: .nonNull(.list(.nonNull(.object(Attendee.selections))))),
          GraphQLField("startDate", type: .nonNull(.scalar(String.self))),
          GraphQLField("endDate", type: .scalar(String.self)),
          GraphQLField("type", type: .nonNull(.scalar(EventType.self))),
          GraphQLField("status", type: .nonNull(.scalar(EventStatus.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String, info: String, capacity: Int, attendees: [Attendee], startDate: String, endDate: String? = nil, type: EventType, status: EventStatus) {
        self.init(unsafeResultMap: ["__typename": "Event", "id": id, "name": name, "info": info, "capacity": capacity, "attendees": attendees.map { (value: Attendee) -> ResultMap in value.resultMap }, "startDate": startDate, "endDate": endDate, "type": type, "status": status])
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

      public struct Attendee: GraphQLSelectionSet {
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

public final class GetFriendRequestsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetFriendRequests($userId: String!) {
      user(id: $userId) {
        __typename
        friendRequests {
          __typename
          createdAt
          user {
            __typename
            id
            username
            firstName
            lastName
          }
        }
      }
    }
    """

  public let operationName: String = "GetFriendRequests"

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
          GraphQLField("friendRequests", type: .nonNull(.list(.nonNull(.object(FriendRequest.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(friendRequests: [FriendRequest]) {
        self.init(unsafeResultMap: ["__typename": "User", "friendRequests": friendRequests.map { (value: FriendRequest) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var friendRequests: [FriendRequest] {
        get {
          return (resultMap["friendRequests"] as! [ResultMap]).map { (value: ResultMap) -> FriendRequest in FriendRequest(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: FriendRequest) -> ResultMap in value.resultMap }, forKey: "friendRequests")
        }
      }

      public struct FriendRequest: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["FriendRequest"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
            GraphQLField("user", type: .nonNull(.object(User.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(createdAt: String, user: User) {
          self.init(unsafeResultMap: ["__typename": "FriendRequest", "createdAt": createdAt, "user": user.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
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
              GraphQLField("username", type: .nonNull(.scalar(String.self))),
              GraphQLField("firstName", type: .nonNull(.scalar(String.self))),
              GraphQLField("lastName", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, username: String, firstName: String, lastName: String) {
            self.init(unsafeResultMap: ["__typename": "User", "id": id, "username": username, "firstName": firstName, "lastName": lastName])
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
          ... on FriendRequest {
            user {
              __typename
              id
              firstName
              lastName
              username
            }
          }
        }
      }
    }
    """

  public let operationName: String = "GetNotifications"

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
        public static let possibleTypes: [String] = ["InfoNotification", "FriendRequest"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLTypeCase(
              variants: ["FriendRequest": AsFriendRequest.selections],
              default: [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
                GraphQLField("type", type: .nonNull(.scalar(NotificationType.self))),
              ]
            )
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public static func makeInfoNotification(id: GraphQLID, createdAt: String, type: NotificationType) -> Notification {
          return Notification(unsafeResultMap: ["__typename": "InfoNotification", "id": id, "createdAt": createdAt, "type": type])
        }

        public static func makeFriendRequest(id: GraphQLID, createdAt: String, type: NotificationType, user: AsFriendRequest.User) -> Notification {
          return Notification(unsafeResultMap: ["__typename": "FriendRequest", "id": id, "createdAt": createdAt, "type": type, "user": user.resultMap])
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

        public var asFriendRequest: AsFriendRequest? {
          get {
            if !AsFriendRequest.possibleTypes.contains(__typename) { return nil }
            return AsFriendRequest(unsafeResultMap: resultMap)
          }
          set {
            guard let newValue = newValue else { return }
            resultMap = newValue.resultMap
          }
        }

        public struct AsFriendRequest: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["FriendRequest"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
              GraphQLField("type", type: .nonNull(.scalar(NotificationType.self))),
              GraphQLField("user", type: .nonNull(.object(User.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, createdAt: String, type: NotificationType, user: User) {
            self.init(unsafeResultMap: ["__typename": "FriendRequest", "id": id, "createdAt": createdAt, "type": type, "user": user.resultMap])
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
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: GraphQLID, firstName: String, lastName: String, username: String) {
              self.init(unsafeResultMap: ["__typename": "User", "id": id, "firstName": firstName, "lastName": lastName, "username": username])
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
          }
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
        id
        name
        info
        startDate
        endDate
        capacity
        type
        status
        attendees {
          __typename
          id
          firstName
          lastName
          username
          photoUrl
          college
        }
      }
    }
    """

  public let operationName: String = "GetUserEvents"

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
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("info", type: .nonNull(.scalar(String.self))),
          GraphQLField("startDate", type: .nonNull(.scalar(String.self))),
          GraphQLField("endDate", type: .scalar(String.self)),
          GraphQLField("capacity", type: .nonNull(.scalar(Int.self))),
          GraphQLField("type", type: .nonNull(.scalar(EventType.self))),
          GraphQLField("status", type: .nonNull(.scalar(EventStatus.self))),
          GraphQLField("attendees", type: .nonNull(.list(.nonNull(.object(Attendee.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String, info: String, startDate: String, endDate: String? = nil, capacity: Int, type: EventType, status: EventStatus, attendees: [Attendee]) {
        self.init(unsafeResultMap: ["__typename": "Event", "id": id, "name": name, "info": info, "startDate": startDate, "endDate": endDate, "capacity": capacity, "type": type, "status": status, "attendees": attendees.map { (value: Attendee) -> ResultMap in value.resultMap }])
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

      public var capacity: Int {
        get {
          return resultMap["capacity"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "capacity")
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

      /// users who attended or will attend the event
      public var attendees: [Attendee] {
        get {
          return (resultMap["attendees"] as! [ResultMap]).map { (value: ResultMap) -> Attendee in Attendee(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Attendee) -> ResultMap in value.resultMap }, forKey: "attendees")
        }
      }

      public struct Attendee: GraphQLSelectionSet {
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
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, firstName: String, lastName: String, username: String, photoUrl: String? = nil, college: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "User", "id": id, "firstName": firstName, "lastName": lastName, "username": username, "photoUrl": photoUrl, "college": college])
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
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, firstName: String, lastName: String, username: String, college: String? = nil, photoUrl: String? = nil, friendStatus: FriendStatus? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "firstName": firstName, "lastName": lastName, "username": username, "college": college, "photoUrl": photoUrl, "friendStatus": friendStatus])
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
