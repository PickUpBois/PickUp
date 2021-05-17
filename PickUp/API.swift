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
    query GetUser($id: String!) {
      user(id: $id) {
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

  public let operationName: String = "GetUser"

  public var id: String

  public init(id: String) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
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
