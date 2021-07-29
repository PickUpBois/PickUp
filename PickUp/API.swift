// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct CreateEventInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - capacity
  ///   - info
  ///   - name
  ///   - startDate
  ///   - status
  ///   - type
  public init(capacity: Int, info: String, name: String, startDate: String, status: String, type: String) {
    graphQLMap = ["capacity": capacity, "info": info, "name": name, "startDate": startDate, "status": status, "type": type]
  }

  public var capacity: Int {
    get {
      return graphQLMap["capacity"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "capacity")
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

  public var name: String {
    get {
      return graphQLMap["name"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
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

  public var status: String {
    get {
      return graphQLMap["status"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "status")
    }
  }

  public var type: String {
    get {
      return graphQLMap["type"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "type")
    }
  }
}

public enum ActionStatus: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case error
  case success
  case usernameAlreadyExists
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "ERROR": self = .error
      case "SUCCESS": self = .success
      case "USERNAME_ALREADY_EXISTS": self = .usernameAlreadyExists
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .error: return "ERROR"
      case .success: return "SUCCESS"
      case .usernameAlreadyExists: return "USERNAME_ALREADY_EXISTS"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: ActionStatus, rhs: ActionStatus) -> Bool {
    switch (lhs, rhs) {
      case (.error, .error): return true
      case (.success, .success): return true
      case (.usernameAlreadyExists, .usernameAlreadyExists): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [ActionStatus] {
    return [
      .error,
      .success,
      .usernameAlreadyExists,
    ]
  }
}

public enum event_attendee_status_enum: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// user has conflict with event
  case conflict
  /// invited to event
  case invited
  /// user is in event
  case ok
  /// owner of event
  case owner
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "conflict": self = .conflict
      case "invited": self = .invited
      case "ok": self = .ok
      case "owner": self = .owner
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .conflict: return "conflict"
      case .invited: return "invited"
      case .ok: return "ok"
      case .owner: return "owner"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: event_attendee_status_enum, rhs: event_attendee_status_enum) -> Bool {
    switch (lhs, rhs) {
      case (.conflict, .conflict): return true
      case (.invited, .invited): return true
      case (.ok, .ok): return true
      case (.owner, .owner): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [event_attendee_status_enum] {
    return [
      .conflict,
      .invited,
      .ok,
      .owner,
    ]
  }
}

public enum notification_type_enum: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// owner has deleted the event
  case deletedEvent
  /// you have been invited to an event
  case eventInvitation
  /// your event has finished
  case finishEvent
  /// somebody accepted your friend request
  case friendRequestAccept
  /// somebody rejected your friend request
  case friendRequestReject
  /// you have received a friend request
  case friendRequestSend
  /// user has joined your event
  case joinedEvent
  /// user has left your event
  case leftEvent
  /// you have been selected mvp
  case selectedMvp
  /// you must vote for mvp
  case voteForMvp
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "deletedEvent": self = .deletedEvent
      case "eventInvitation": self = .eventInvitation
      case "finishEvent": self = .finishEvent
      case "friendRequestAccept": self = .friendRequestAccept
      case "friendRequestReject": self = .friendRequestReject
      case "friendRequestSend": self = .friendRequestSend
      case "joinedEvent": self = .joinedEvent
      case "leftEvent": self = .leftEvent
      case "selectedMvp": self = .selectedMvp
      case "voteForMvp": self = .voteForMvp
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .deletedEvent: return "deletedEvent"
      case .eventInvitation: return "eventInvitation"
      case .finishEvent: return "finishEvent"
      case .friendRequestAccept: return "friendRequestAccept"
      case .friendRequestReject: return "friendRequestReject"
      case .friendRequestSend: return "friendRequestSend"
      case .joinedEvent: return "joinedEvent"
      case .leftEvent: return "leftEvent"
      case .selectedMvp: return "selectedMvp"
      case .voteForMvp: return "voteForMvp"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: notification_type_enum, rhs: notification_type_enum) -> Bool {
    switch (lhs, rhs) {
      case (.deletedEvent, .deletedEvent): return true
      case (.eventInvitation, .eventInvitation): return true
      case (.finishEvent, .finishEvent): return true
      case (.friendRequestAccept, .friendRequestAccept): return true
      case (.friendRequestReject, .friendRequestReject): return true
      case (.friendRequestSend, .friendRequestSend): return true
      case (.joinedEvent, .joinedEvent): return true
      case (.leftEvent, .leftEvent): return true
      case (.selectedMvp, .selectedMvp): return true
      case (.voteForMvp, .voteForMvp): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [notification_type_enum] {
    return [
      .deletedEvent,
      .eventInvitation,
      .finishEvent,
      .friendRequestAccept,
      .friendRequestReject,
      .friendRequestSend,
      .joinedEvent,
      .leftEvent,
      .selectedMvp,
      .voteForMvp,
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
  public init(eventId: Int, team1Members: [String], team1Scores: [Int], team1Win: Bool, team2Members: [String], team2Scores: [Int]) {
    graphQLMap = ["eventId": eventId, "team1_members": team1Members, "team1_scores": team1Scores, "team1_win": team1Win, "team2_members": team2Members, "team2_scores": team2Scores]
  }

  public var eventId: Int {
    get {
      return graphQLMap["eventId"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eventId")
    }
  }

  public var team1Members: [String] {
    get {
      return graphQLMap["team1_members"] as! [String]
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

  public var team2Members: [String] {
    get {
      return graphQLMap["team2_members"] as! [String]
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
}

public struct UpdateUserInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - college
  ///   - firstName
  ///   - lastName
  ///   - photoUrl
  ///   - username
  public init(college: Swift.Optional<String?> = nil, firstName: Swift.Optional<String?> = nil, lastName: Swift.Optional<String?> = nil, photoUrl: Swift.Optional<String?> = nil, username: Swift.Optional<String?> = nil) {
    graphQLMap = ["college": college, "firstName": firstName, "lastName": lastName, "photoUrl": photoUrl, "username": username]
  }

  public var college: Swift.Optional<String?> {
    get {
      return graphQLMap["college"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "college")
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

  public var photoUrl: Swift.Optional<String?> {
    get {
      return graphQLMap["photoUrl"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "photoUrl")
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
}

public enum event_status_enum: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// event is closed
  case closed
  /// event is in progress
  case ip
  /// event is open
  case `open`
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "closed": self = .closed
      case "ip": self = .ip
      case "open": self = .open
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .closed: return "closed"
      case .ip: return "ip"
      case .open: return "open"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: event_status_enum, rhs: event_status_enum) -> Bool {
    switch (lhs, rhs) {
      case (.closed, .closed): return true
      case (.ip, .ip): return true
      case (.open, .open): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [event_status_enum] {
    return [
      .closed,
      .ip,
      .open,
    ]
  }
}

public struct CreateUserInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - college
  ///   - firstName
  ///   - lastName
  ///   - username
  public init(college: Swift.Optional<String?> = nil, firstName: String, lastName: String, username: String) {
    graphQLMap = ["college": college, "firstName": firstName, "lastName": lastName, "username": username]
  }

  public var college: Swift.Optional<String?> {
    get {
      return graphQLMap["college"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "college")
    }
  }

  public var firstName: String {
    get {
      return graphQLMap["firstName"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "firstName")
    }
  }

  public var lastName: String {
    get {
      return graphQLMap["lastName"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lastName")
    }
  }

  public var username: String {
    get {
      return graphQLMap["username"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "username")
    }
  }
}

public enum event_type_enum: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// basketball event
  case basketball
  /// tennis
  case tennis
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "basketball": self = .basketball
      case "tennis": self = .tennis
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .basketball: return "basketball"
      case .tennis: return "tennis"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: event_type_enum, rhs: event_type_enum) -> Bool {
    switch (lhs, rhs) {
      case (.basketball, .basketball): return true
      case (.tennis, .tennis): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [event_type_enum] {
    return [
      .basketball,
      .tennis,
    ]
  }
}

public final class CreateEventMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation CreateEvent($input: CreateEventInput!) {
      createEvent(arg1: $input) {
        __typename
        status
        reason
        id
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
    public static let possibleTypes: [String] = ["mutation_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("createEvent", arguments: ["arg1": GraphQLVariable("input")], type: .nonNull(.object(CreateEvent.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createEvent: CreateEvent) {
      self.init(unsafeResultMap: ["__typename": "mutation_root", "createEvent": createEvent.resultMap])
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
      public static let possibleTypes: [String] = ["ActionResult"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("status", type: .nonNull(.scalar(ActionStatus.self))),
          GraphQLField("reason", type: .scalar(String.self)),
          GraphQLField("id", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(status: ActionStatus, reason: String? = nil, id: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "ActionResult", "status": status, "reason": reason, "id": id])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var status: ActionStatus {
        get {
          return resultMap["status"]! as! ActionStatus
        }
        set {
          resultMap.updateValue(newValue, forKey: "status")
        }
      }

      public var reason: String? {
        get {
          return resultMap["reason"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "reason")
        }
      }

      public var id: String? {
        get {
          return resultMap["id"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }
    }
  }
}

public final class CurrentlyOwnedEventsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query CurrentlyOwnedEvents($userId: String!) {
      events(
        where: {deleted: {_eq: false}, endDate: {_neq: null}, attendees: {id: {_eq: $userId}, status: {_eq: owner}}}
      ) {
        __typename
        invitedAttendees: attendees(where: {status: {_eq: invited}}) {
          __typename
          user {
            __typename
            id
          }
          status
        }
        ...EventDetails
      }
    }
    """

  public let operationName: String = "CurrentlyOwnedEvents"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + EventDetails.fragmentDefinition)
    document.append("\n" + AttendeeDetails.fragmentDefinition)
    document.append("\n" + UserDetails.fragmentDefinition)
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
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("events", arguments: ["where": ["deleted": ["_eq": false], "endDate": ["_neq": nil], "attendees": ["id": ["_eq": GraphQLVariable("userId")], "status": ["_eq": "owner"]]]], type: .nonNull(.list(.nonNull(.object(Event.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(events: [Event]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "events": events.map { (value: Event) -> ResultMap in value.resultMap }])
    }

    /// fetch data from the table: "events"
    public var events: [Event] {
      get {
        return (resultMap["events"] as! [ResultMap]).map { (value: ResultMap) -> Event in Event(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Event) -> ResultMap in value.resultMap }, forKey: "events")
      }
    }

    public struct Event: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["events"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("attendees", alias: "invitedAttendees", arguments: ["where": ["status": ["_eq": "invited"]]], type: .nonNull(.list(.nonNull(.object(InvitedAttendee.selections))))),
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

      /// An array relationship
      public var invitedAttendees: [InvitedAttendee] {
        get {
          return (resultMap["invitedAttendees"] as! [ResultMap]).map { (value: ResultMap) -> InvitedAttendee in InvitedAttendee(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: InvitedAttendee) -> ResultMap in value.resultMap }, forKey: "invitedAttendees")
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

      public struct InvitedAttendee: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["event_attendees"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("user", type: .nonNull(.object(User.selections))),
            GraphQLField("status", type: .scalar(event_attendee_status_enum.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(user: User, status: event_attendee_status_enum? = nil) {
          self.init(unsafeResultMap: ["__typename": "event_attendees", "user": user.resultMap, "status": status])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// An object relationship
        public var user: User {
          get {
            return User(unsafeResultMap: resultMap["user"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "user")
          }
        }

        public var status: event_attendee_status_enum? {
          get {
            return resultMap["status"] as? event_attendee_status_enum
          }
          set {
            resultMap.updateValue(newValue, forKey: "status")
          }
        }

        public struct User: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["users"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: String) {
            self.init(unsafeResultMap: ["__typename": "users", "id": id])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: String {
            get {
              return resultMap["id"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }
        }
      }
    }
  }
}

public final class LeaveEventMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation LeaveEvent($eventId: Int!) {
      leaveEvent(eventId: $eventId) {
        __typename
        reason
        status
      }
    }
    """

  public let operationName: String = "LeaveEvent"

  public var eventId: Int

  public init(eventId: Int) {
    self.eventId = eventId
  }

  public var variables: GraphQLMap? {
    return ["eventId": eventId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["mutation_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("leaveEvent", arguments: ["eventId": GraphQLVariable("eventId")], type: .nonNull(.object(LeaveEvent.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(leaveEvent: LeaveEvent) {
      self.init(unsafeResultMap: ["__typename": "mutation_root", "leaveEvent": leaveEvent.resultMap])
    }

    public var leaveEvent: LeaveEvent {
      get {
        return LeaveEvent(unsafeResultMap: resultMap["leaveEvent"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "leaveEvent")
      }
    }

    public struct LeaveEvent: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["ActionResult"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("reason", type: .scalar(String.self)),
          GraphQLField("status", type: .nonNull(.scalar(ActionStatus.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(reason: String? = nil, status: ActionStatus) {
        self.init(unsafeResultMap: ["__typename": "ActionResult", "reason": reason, "status": status])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var reason: String? {
        get {
          return resultMap["reason"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "reason")
        }
      }

      public var status: ActionStatus {
        get {
          return resultMap["status"]! as! ActionStatus
        }
        set {
          resultMap.updateValue(newValue, forKey: "status")
        }
      }
    }
  }
}

public final class DeleteEventMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation DeleteEvent($eventId: Int!) {
      deleteEvent(eventId: $eventId) {
        __typename
        status
        reason
      }
    }
    """

  public let operationName: String = "DeleteEvent"

  public var eventId: Int

  public init(eventId: Int) {
    self.eventId = eventId
  }

  public var variables: GraphQLMap? {
    return ["eventId": eventId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["mutation_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("deleteEvent", arguments: ["eventId": GraphQLVariable("eventId")], type: .nonNull(.object(DeleteEvent.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(deleteEvent: DeleteEvent) {
      self.init(unsafeResultMap: ["__typename": "mutation_root", "deleteEvent": deleteEvent.resultMap])
    }

    public var deleteEvent: DeleteEvent {
      get {
        return DeleteEvent(unsafeResultMap: resultMap["deleteEvent"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "deleteEvent")
      }
    }

    public struct DeleteEvent: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["ActionResult"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("status", type: .nonNull(.scalar(ActionStatus.self))),
          GraphQLField("reason", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(status: ActionStatus, reason: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "ActionResult", "status": status, "reason": reason])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var status: ActionStatus {
        get {
          return resultMap["status"]! as! ActionStatus
        }
        set {
          resultMap.updateValue(newValue, forKey: "status")
        }
      }

      public var reason: String? {
        get {
          return resultMap["reason"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "reason")
        }
      }
    }
  }
}

public final class SearchUsersQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query SearchUsers($search: String!) {
      search_users(args: {search: $search}) {
        __typename
        id
        username
      }
    }
    """

  public let operationName: String = "SearchUsers"

  public var search: String

  public init(search: String) {
    self.search = search
  }

  public var variables: GraphQLMap? {
    return ["search": search]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("search_users", arguments: ["args": ["search": GraphQLVariable("search")]], type: .nonNull(.list(.nonNull(.object(SearchUser.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(searchUsers: [SearchUser]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "search_users": searchUsers.map { (value: SearchUser) -> ResultMap in value.resultMap }])
    }

    /// execute function "search_users" which returns "users"
    public var searchUsers: [SearchUser] {
      get {
        return (resultMap["search_users"] as! [ResultMap]).map { (value: ResultMap) -> SearchUser in SearchUser(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: SearchUser) -> ResultMap in value.resultMap }, forKey: "search_users")
      }
    }

    public struct SearchUser: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["users"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(String.self))),
          GraphQLField("username", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: String, username: String) {
        self.init(unsafeResultMap: ["__typename": "users", "id": id, "username": username])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: String {
        get {
          return resultMap["id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

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
          ...UserDetails
        }
      }
    }
    """

  public let operationName: String = "GetFriends"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + UserDetails.fragmentDefinition)
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
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("user", arguments: ["id": GraphQLVariable("userId")], type: .object(User.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(user: User? = nil) {
      self.init(unsafeResultMap: ["__typename": "query_root", "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }])
    }

    /// fetch data from the table: "users" using primary key columns
    public var user: User? {
      get {
        return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "user")
      }
    }

    public struct User: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["users"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("friends", type: .list(.nonNull(.object(Friend.selections)))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(friends: [Friend]? = nil) {
        self.init(unsafeResultMap: ["__typename": "users", "friends": friends.flatMap { (value: [Friend]) -> [ResultMap] in value.map { (value: Friend) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// A computed field, executes function "get_friends"
      public var friends: [Friend]? {
        get {
          return (resultMap["friends"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Friend] in value.map { (value: ResultMap) -> Friend in Friend(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Friend]) -> [ResultMap] in value.map { (value: Friend) -> ResultMap in value.resultMap } }, forKey: "friends")
        }
      }

      public struct Friend: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["users"]

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

        public init(id: String, firstName: String, lastName: String, username: String, photoUrl: String? = nil, college: String? = nil, friendStatus: Bool? = nil) {
          self.init(unsafeResultMap: ["__typename": "users", "id": id, "firstName": firstName, "lastName": lastName, "username": username, "photoUrl": photoUrl, "college": college, "friendStatus": friendStatus])
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
    }
  }
}

public final class GetUpcomingEventsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetUpcomingEvents {
      events(where: {status: {_in: [open, ip]}, deleted: {_eq: false}}) {
        __typename
        ...EventDetails
      }
    }
    """

  public let operationName: String = "GetUpcomingEvents"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + EventDetails.fragmentDefinition)
    document.append("\n" + AttendeeDetails.fragmentDefinition)
    document.append("\n" + UserDetails.fragmentDefinition)
    return document
  }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("events", arguments: ["where": ["status": ["_in": ["open", "ip"]], "deleted": ["_eq": false]]], type: .nonNull(.list(.nonNull(.object(Event.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(events: [Event]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "events": events.map { (value: Event) -> ResultMap in value.resultMap }])
    }

    /// fetch data from the table: "events"
    public var events: [Event] {
      get {
        return (resultMap["events"] as! [ResultMap]).map { (value: ResultMap) -> Event in Event(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Event) -> ResultMap in value.resultMap }, forKey: "events")
      }
    }

    public struct Event: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["events"]

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
    mutation AcceptFriendRequest($userId: String!) {
      acceptFriendRequest(friendId: $userId) {
        __typename
        status
        reason
      }
    }
    """

  public let operationName: String = "AcceptFriendRequest"

  public var userId: String

  public init(userId: String) {
    self.userId = userId
  }

  public var variables: GraphQLMap? {
    return ["userId": userId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["mutation_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("acceptFriendRequest", arguments: ["friendId": GraphQLVariable("userId")], type: .nonNull(.object(AcceptFriendRequest.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(acceptFriendRequest: AcceptFriendRequest) {
      self.init(unsafeResultMap: ["__typename": "mutation_root", "acceptFriendRequest": acceptFriendRequest.resultMap])
    }

    public var acceptFriendRequest: AcceptFriendRequest {
      get {
        return AcceptFriendRequest(unsafeResultMap: resultMap["acceptFriendRequest"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "acceptFriendRequest")
      }
    }

    public struct AcceptFriendRequest: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["ActionResult"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("status", type: .nonNull(.scalar(ActionStatus.self))),
          GraphQLField("reason", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(status: ActionStatus, reason: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "ActionResult", "status": status, "reason": reason])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var status: ActionStatus {
        get {
          return resultMap["status"]! as! ActionStatus
        }
        set {
          resultMap.updateValue(newValue, forKey: "status")
        }
      }

      public var reason: String? {
        get {
          return resultMap["reason"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "reason")
        }
      }
    }
  }
}

public final class RejectFriendRequestMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation RejectFriendRequest($userId: String!) {
      rejectFriendRequest(friendId: $userId) {
        __typename
        status
        reason
      }
    }
    """

  public let operationName: String = "RejectFriendRequest"

  public var userId: String

  public init(userId: String) {
    self.userId = userId
  }

  public var variables: GraphQLMap? {
    return ["userId": userId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["mutation_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("rejectFriendRequest", arguments: ["friendId": GraphQLVariable("userId")], type: .nonNull(.object(RejectFriendRequest.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(rejectFriendRequest: RejectFriendRequest) {
      self.init(unsafeResultMap: ["__typename": "mutation_root", "rejectFriendRequest": rejectFriendRequest.resultMap])
    }

    public var rejectFriendRequest: RejectFriendRequest {
      get {
        return RejectFriendRequest(unsafeResultMap: resultMap["rejectFriendRequest"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "rejectFriendRequest")
      }
    }

    public struct RejectFriendRequest: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["ActionResult"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("status", type: .nonNull(.scalar(ActionStatus.self))),
          GraphQLField("reason", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(status: ActionStatus, reason: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "ActionResult", "status": status, "reason": reason])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var status: ActionStatus {
        get {
          return resultMap["status"]! as! ActionStatus
        }
        set {
          resultMap.updateValue(newValue, forKey: "status")
        }
      }

      public var reason: String? {
        get {
          return resultMap["reason"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "reason")
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
      notifications(where: {userId: {_eq: $userId}, status: {_eq: unread}}) {
        __typename
        id
        actor {
          __typename
          ...UserDetails
        }
        event {
          __typename
          ...EventDetails
        }
        createdAt
        type
      }
    }
    """

  public let operationName: String = "GetNotifications"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + UserDetails.fragmentDefinition)
    document.append("\n" + EventDetails.fragmentDefinition)
    document.append("\n" + AttendeeDetails.fragmentDefinition)
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
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("notifications", arguments: ["where": ["userId": ["_eq": GraphQLVariable("userId")], "status": ["_eq": "unread"]]], type: .nonNull(.list(.nonNull(.object(Notification.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(notifications: [Notification]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "notifications": notifications.map { (value: Notification) -> ResultMap in value.resultMap }])
    }

    /// fetch data from the table: "notifications"
    public var notifications: [Notification] {
      get {
        return (resultMap["notifications"] as! [ResultMap]).map { (value: ResultMap) -> Notification in Notification(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Notification) -> ResultMap in value.resultMap }, forKey: "notifications")
      }
    }

    public struct Notification: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["notifications"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("actor", type: .object(Actor.selections)),
          GraphQLField("event", type: .object(Event.selections)),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("type", type: .nonNull(.scalar(notification_type_enum.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, actor: Actor? = nil, event: Event? = nil, createdAt: String, type: notification_type_enum) {
        self.init(unsafeResultMap: ["__typename": "notifications", "id": id, "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }, "event": event.flatMap { (value: Event) -> ResultMap in value.resultMap }, "createdAt": createdAt, "type": type])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// An object relationship
      public var actor: Actor? {
        get {
          return (resultMap["actor"] as? ResultMap).flatMap { Actor(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "actor")
        }
      }

      /// An object relationship
      public var event: Event? {
        get {
          return (resultMap["event"] as? ResultMap).flatMap { Event(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "event")
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

      public var type: notification_type_enum {
        get {
          return resultMap["type"]! as! notification_type_enum
        }
        set {
          resultMap.updateValue(newValue, forKey: "type")
        }
      }

      public struct Actor: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["users"]

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

        public init(id: String, firstName: String, lastName: String, username: String, photoUrl: String? = nil, college: String? = nil, friendStatus: Bool? = nil) {
          self.init(unsafeResultMap: ["__typename": "users", "id": id, "firstName": firstName, "lastName": lastName, "username": username, "photoUrl": photoUrl, "college": college, "friendStatus": friendStatus])
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
        public static let possibleTypes: [String] = ["events"]

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

public final class ReadNotificationMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation ReadNotification($notificationId: Int!) {
      markNotificationAsRead(notificationId: $notificationId) {
        __typename
        status
        reason
      }
    }
    """

  public let operationName: String = "ReadNotification"

  public var notificationId: Int

  public init(notificationId: Int) {
    self.notificationId = notificationId
  }

  public var variables: GraphQLMap? {
    return ["notificationId": notificationId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["mutation_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("markNotificationAsRead", arguments: ["notificationId": GraphQLVariable("notificationId")], type: .nonNull(.object(MarkNotificationAsRead.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(markNotificationAsRead: MarkNotificationAsRead) {
      self.init(unsafeResultMap: ["__typename": "mutation_root", "markNotificationAsRead": markNotificationAsRead.resultMap])
    }

    public var markNotificationAsRead: MarkNotificationAsRead {
      get {
        return MarkNotificationAsRead(unsafeResultMap: resultMap["markNotificationAsRead"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "markNotificationAsRead")
      }
    }

    public struct MarkNotificationAsRead: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["ActionResult"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("status", type: .nonNull(.scalar(ActionStatus.self))),
          GraphQLField("reason", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(status: ActionStatus, reason: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "ActionResult", "status": status, "reason": reason])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var status: ActionStatus {
        get {
          return resultMap["status"]! as! ActionStatus
        }
        set {
          resultMap.updateValue(newValue, forKey: "status")
        }
      }

      public var reason: String? {
        get {
          return resultMap["reason"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "reason")
        }
      }
    }
  }
}

public final class JoinEventMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation JoinEvent($eventId: Int!) {
      joinEvent(eventId: $eventId) {
        __typename
        reason
        status
      }
    }
    """

  public let operationName: String = "JoinEvent"

  public var eventId: Int

  public init(eventId: Int) {
    self.eventId = eventId
  }

  public var variables: GraphQLMap? {
    return ["eventId": eventId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["mutation_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("joinEvent", arguments: ["eventId": GraphQLVariable("eventId")], type: .object(JoinEvent.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(joinEvent: JoinEvent? = nil) {
      self.init(unsafeResultMap: ["__typename": "mutation_root", "joinEvent": joinEvent.flatMap { (value: JoinEvent) -> ResultMap in value.resultMap }])
    }

    public var joinEvent: JoinEvent? {
      get {
        return (resultMap["joinEvent"] as? ResultMap).flatMap { JoinEvent(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "joinEvent")
      }
    }

    public struct JoinEvent: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["ActionResult"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("reason", type: .scalar(String.self)),
          GraphQLField("status", type: .nonNull(.scalar(ActionStatus.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(reason: String? = nil, status: ActionStatus) {
        self.init(unsafeResultMap: ["__typename": "ActionResult", "reason": reason, "status": status])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var reason: String? {
        get {
          return resultMap["reason"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "reason")
        }
      }

      public var status: ActionStatus {
        get {
          return resultMap["status"]! as! ActionStatus
        }
        set {
          resultMap.updateValue(newValue, forKey: "status")
        }
      }
    }
  }
}

public final class AcceptEventInvitationMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation AcceptEventInvitation($eventId: Int!) {
      acceptEventInvitation(eventId: $eventId) {
        __typename
        status
        reason
      }
    }
    """

  public let operationName: String = "AcceptEventInvitation"

  public var eventId: Int

  public init(eventId: Int) {
    self.eventId = eventId
  }

  public var variables: GraphQLMap? {
    return ["eventId": eventId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["mutation_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("acceptEventInvitation", arguments: ["eventId": GraphQLVariable("eventId")], type: .nonNull(.object(AcceptEventInvitation.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(acceptEventInvitation: AcceptEventInvitation) {
      self.init(unsafeResultMap: ["__typename": "mutation_root", "acceptEventInvitation": acceptEventInvitation.resultMap])
    }

    public var acceptEventInvitation: AcceptEventInvitation {
      get {
        return AcceptEventInvitation(unsafeResultMap: resultMap["acceptEventInvitation"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "acceptEventInvitation")
      }
    }

    public struct AcceptEventInvitation: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["ActionResult"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("status", type: .nonNull(.scalar(ActionStatus.self))),
          GraphQLField("reason", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(status: ActionStatus, reason: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "ActionResult", "status": status, "reason": reason])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var status: ActionStatus {
        get {
          return resultMap["status"]! as! ActionStatus
        }
        set {
          resultMap.updateValue(newValue, forKey: "status")
        }
      }

      public var reason: String? {
        get {
          return resultMap["reason"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "reason")
        }
      }
    }
  }
}

public final class DeclineEventInvitationMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation DeclineEventInvitation($eventId: Int!) {
      declineEventInvitation(eventId: $eventId) {
        __typename
        status
        reason
      }
    }
    """

  public let operationName: String = "DeclineEventInvitation"

  public var eventId: Int

  public init(eventId: Int) {
    self.eventId = eventId
  }

  public var variables: GraphQLMap? {
    return ["eventId": eventId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["mutation_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("declineEventInvitation", arguments: ["eventId": GraphQLVariable("eventId")], type: .nonNull(.object(DeclineEventInvitation.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(declineEventInvitation: DeclineEventInvitation) {
      self.init(unsafeResultMap: ["__typename": "mutation_root", "declineEventInvitation": declineEventInvitation.resultMap])
    }

    public var declineEventInvitation: DeclineEventInvitation {
      get {
        return DeclineEventInvitation(unsafeResultMap: resultMap["declineEventInvitation"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "declineEventInvitation")
      }
    }

    public struct DeclineEventInvitation: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["ActionResult"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("status", type: .nonNull(.scalar(ActionStatus.self))),
          GraphQLField("reason", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(status: ActionStatus, reason: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "ActionResult", "status": status, "reason": reason])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var status: ActionStatus {
        get {
          return resultMap["status"]! as! ActionStatus
        }
        set {
          resultMap.updateValue(newValue, forKey: "status")
        }
      }

      public var reason: String? {
        get {
          return resultMap["reason"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "reason")
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
        status
        reason
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
    public static let possibleTypes: [String] = ["mutation_root"]

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
      self.init(unsafeResultMap: ["__typename": "mutation_root", "endEvent": endEvent.resultMap])
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
      public static let possibleTypes: [String] = ["ActionResult"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("status", type: .nonNull(.scalar(ActionStatus.self))),
          GraphQLField("reason", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(status: ActionStatus, reason: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "ActionResult", "status": status, "reason": reason])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var status: ActionStatus {
        get {
          return resultMap["status"]! as! ActionStatus
        }
        set {
          resultMap.updateValue(newValue, forKey: "status")
        }
      }

      public var reason: String? {
        get {
          return resultMap["reason"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "reason")
        }
      }
    }
  }
}

public final class InviteUserToEventMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation InviteUserToEvent($eventId: Int!, $userId: String!) {
      inviteUserToEvent(eventId: $eventId, userId: $userId) {
        __typename
        reason
        status
      }
    }
    """

  public let operationName: String = "InviteUserToEvent"

  public var eventId: Int
  public var userId: String

  public init(eventId: Int, userId: String) {
    self.eventId = eventId
    self.userId = userId
  }

  public var variables: GraphQLMap? {
    return ["eventId": eventId, "userId": userId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["mutation_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("inviteUserToEvent", arguments: ["eventId": GraphQLVariable("eventId"), "userId": GraphQLVariable("userId")], type: .nonNull(.object(InviteUserToEvent.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(inviteUserToEvent: InviteUserToEvent) {
      self.init(unsafeResultMap: ["__typename": "mutation_root", "inviteUserToEvent": inviteUserToEvent.resultMap])
    }

    public var inviteUserToEvent: InviteUserToEvent {
      get {
        return InviteUserToEvent(unsafeResultMap: resultMap["inviteUserToEvent"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "inviteUserToEvent")
      }
    }

    public struct InviteUserToEvent: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["ActionResult"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("reason", type: .scalar(String.self)),
          GraphQLField("status", type: .nonNull(.scalar(ActionStatus.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(reason: String? = nil, status: ActionStatus) {
        self.init(unsafeResultMap: ["__typename": "ActionResult", "reason": reason, "status": status])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var reason: String? {
        get {
          return resultMap["reason"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "reason")
        }
      }

      public var status: ActionStatus {
        get {
          return resultMap["status"]! as! ActionStatus
        }
        set {
          resultMap.updateValue(newValue, forKey: "status")
        }
      }
    }
  }
}

public final class GetEventQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetEvent($eventId: Int!) {
      events_by_pk(id: $eventId) {
        __typename
        id
        invitedAttendees: attendees(where: {status: {_eq: invited}}) {
          __typename
          id
        }
        attendees {
          __typename
          id
        }
      }
    }
    """

  public let operationName: String = "GetEvent"

  public var eventId: Int

  public init(eventId: Int) {
    self.eventId = eventId
  }

  public var variables: GraphQLMap? {
    return ["eventId": eventId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("events_by_pk", arguments: ["id": GraphQLVariable("eventId")], type: .object(EventsByPk.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(eventsByPk: EventsByPk? = nil) {
      self.init(unsafeResultMap: ["__typename": "query_root", "events_by_pk": eventsByPk.flatMap { (value: EventsByPk) -> ResultMap in value.resultMap }])
    }

    /// fetch data from the table: "events" using primary key columns
    public var eventsByPk: EventsByPk? {
      get {
        return (resultMap["events_by_pk"] as? ResultMap).flatMap { EventsByPk(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "events_by_pk")
      }
    }

    public struct EventsByPk: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["events"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("attendees", alias: "invitedAttendees", arguments: ["where": ["status": ["_eq": "invited"]]], type: .nonNull(.list(.nonNull(.object(InvitedAttendee.selections))))),
          GraphQLField("attendees", type: .nonNull(.list(.nonNull(.object(Attendee.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, invitedAttendees: [InvitedAttendee], attendees: [Attendee]) {
        self.init(unsafeResultMap: ["__typename": "events", "id": id, "invitedAttendees": invitedAttendees.map { (value: InvitedAttendee) -> ResultMap in value.resultMap }, "attendees": attendees.map { (value: Attendee) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// An array relationship
      public var invitedAttendees: [InvitedAttendee] {
        get {
          return (resultMap["invitedAttendees"] as! [ResultMap]).map { (value: ResultMap) -> InvitedAttendee in InvitedAttendee(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: InvitedAttendee) -> ResultMap in value.resultMap }, forKey: "invitedAttendees")
        }
      }

      /// An array relationship
      public var attendees: [Attendee] {
        get {
          return (resultMap["attendees"] as! [ResultMap]).map { (value: ResultMap) -> Attendee in Attendee(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Attendee) -> ResultMap in value.resultMap }, forKey: "attendees")
        }
      }

      public struct InvitedAttendee: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["event_attendees"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: String) {
          self.init(unsafeResultMap: ["__typename": "event_attendees", "id": id])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: String {
          get {
            return resultMap["id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }
      }

      public struct Attendee: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["event_attendees"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: String) {
          self.init(unsafeResultMap: ["__typename": "event_attendees", "id": id])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: String {
          get {
            return resultMap["id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }
      }
    }
  }
}

public final class CancelEventInvitationMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation CancelEventInvitation($eventId: Int!, $userId: String!) {
      cancelEventInvitation(eventId: $eventId, userId: $userId) {
        __typename
        status
        reason
      }
    }
    """

  public let operationName: String = "CancelEventInvitation"

  public var eventId: Int
  public var userId: String

  public init(eventId: Int, userId: String) {
    self.eventId = eventId
    self.userId = userId
  }

  public var variables: GraphQLMap? {
    return ["eventId": eventId, "userId": userId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["mutation_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("cancelEventInvitation", arguments: ["eventId": GraphQLVariable("eventId"), "userId": GraphQLVariable("userId")], type: .nonNull(.object(CancelEventInvitation.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(cancelEventInvitation: CancelEventInvitation) {
      self.init(unsafeResultMap: ["__typename": "mutation_root", "cancelEventInvitation": cancelEventInvitation.resultMap])
    }

    public var cancelEventInvitation: CancelEventInvitation {
      get {
        return CancelEventInvitation(unsafeResultMap: resultMap["cancelEventInvitation"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "cancelEventInvitation")
      }
    }

    public struct CancelEventInvitation: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["ActionResult"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("status", type: .nonNull(.scalar(ActionStatus.self))),
          GraphQLField("reason", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(status: ActionStatus, reason: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "ActionResult", "status": status, "reason": reason])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var status: ActionStatus {
        get {
          return resultMap["status"]! as! ActionStatus
        }
        set {
          resultMap.updateValue(newValue, forKey: "status")
        }
      }

      public var reason: String? {
        get {
          return resultMap["reason"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "reason")
        }
      }
    }
  }
}

public final class VoteForMvpMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation VoteForMvp($eventId: Int!, $userId: String!) {
      voteForMvp(eventId: $eventId, userId: $userId) {
        __typename
        status
        reason
      }
    }
    """

  public let operationName: String = "VoteForMvp"

  public var eventId: Int
  public var userId: String

  public init(eventId: Int, userId: String) {
    self.eventId = eventId
    self.userId = userId
  }

  public var variables: GraphQLMap? {
    return ["eventId": eventId, "userId": userId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["mutation_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("voteForMvp", arguments: ["eventId": GraphQLVariable("eventId"), "userId": GraphQLVariable("userId")], type: .nonNull(.object(VoteForMvp.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(voteForMvp: VoteForMvp) {
      self.init(unsafeResultMap: ["__typename": "mutation_root", "voteForMvp": voteForMvp.resultMap])
    }

    public var voteForMvp: VoteForMvp {
      get {
        return VoteForMvp(unsafeResultMap: resultMap["voteForMvp"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "voteForMvp")
      }
    }

    public struct VoteForMvp: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["ActionResult"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("status", type: .nonNull(.scalar(ActionStatus.self))),
          GraphQLField("reason", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(status: ActionStatus, reason: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "ActionResult", "status": status, "reason": reason])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var status: ActionStatus {
        get {
          return resultMap["status"]! as! ActionStatus
        }
        set {
          resultMap.updateValue(newValue, forKey: "status")
        }
      }

      public var reason: String? {
        get {
          return resultMap["reason"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "reason")
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
      updateUser(arg1: $input) {
        __typename
        status
        reason
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
    public static let possibleTypes: [String] = ["mutation_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("updateUser", arguments: ["arg1": GraphQLVariable("input")], type: .nonNull(.object(UpdateUser.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateUser: UpdateUser) {
      self.init(unsafeResultMap: ["__typename": "mutation_root", "updateUser": updateUser.resultMap])
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
      public static let possibleTypes: [String] = ["ActionResult"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("status", type: .nonNull(.scalar(ActionStatus.self))),
          GraphQLField("reason", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(status: ActionStatus, reason: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "ActionResult", "status": status, "reason": reason])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var status: ActionStatus {
        get {
          return resultMap["status"]! as! ActionStatus
        }
        set {
          resultMap.updateValue(newValue, forKey: "status")
        }
      }

      public var reason: String? {
        get {
          return resultMap["reason"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "reason")
        }
      }
    }
  }
}

public final class GetJoinedEventsByStatusQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetJoinedEventsByStatus($userId: String!, $statuses: [event_status_enum!]) {
      events(where: {status: {_in: $statuses}, attendees: {id: {_eq: $userId}}}) {
        __typename
        ...EventDetails
      }
    }
    """

  public let operationName: String = "GetJoinedEventsByStatus"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + EventDetails.fragmentDefinition)
    document.append("\n" + AttendeeDetails.fragmentDefinition)
    document.append("\n" + UserDetails.fragmentDefinition)
    return document
  }

  public var userId: String
  public var statuses: [event_status_enum]?

  public init(userId: String, statuses: [event_status_enum]?) {
    self.userId = userId
    self.statuses = statuses
  }

  public var variables: GraphQLMap? {
    return ["userId": userId, "statuses": statuses]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("events", arguments: ["where": ["status": ["_in": GraphQLVariable("statuses")], "attendees": ["id": ["_eq": GraphQLVariable("userId")]]]], type: .nonNull(.list(.nonNull(.object(Event.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(events: [Event]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "events": events.map { (value: Event) -> ResultMap in value.resultMap }])
    }

    /// fetch data from the table: "events"
    public var events: [Event] {
      get {
        return (resultMap["events"] as! [ResultMap]).map { (value: ResultMap) -> Event in Event(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Event) -> ResultMap in value.resultMap }, forKey: "events")
      }
    }

    public struct Event: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["events"]

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
    query GetUser($userId: String!) {
      user(id: $userId) {
        __typename
        ...UserDetails
        friends {
          __typename
          id
        }
      }
    }
    """

  public let operationName: String = "GetUser"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + UserDetails.fragmentDefinition)
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
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("user", arguments: ["id": GraphQLVariable("userId")], type: .object(User.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(user: User? = nil) {
      self.init(unsafeResultMap: ["__typename": "query_root", "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }])
    }

    /// fetch data from the table: "users" using primary key columns
    public var user: User? {
      get {
        return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "user")
      }
    }

    public struct User: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["users"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(UserDetails.self),
          GraphQLField("friends", type: .list(.nonNull(.object(Friend.selections)))),
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

      /// A computed field, executes function "get_friends"
      public var friends: [Friend]? {
        get {
          return (resultMap["friends"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Friend] in value.map { (value: ResultMap) -> Friend in Friend(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Friend]) -> [ResultMap] in value.map { (value: Friend) -> ResultMap in value.resultMap } }, forKey: "friends")
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

      public struct Friend: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["users"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: String) {
          self.init(unsafeResultMap: ["__typename": "users", "id": id])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: String {
          get {
            return resultMap["id"]! as! String
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
    mutation SendFriendRequest($friendId: String!) {
      sendFriendRequest(friendId: $friendId) {
        __typename
        status
        reason
      }
    }
    """

  public let operationName: String = "SendFriendRequest"

  public var friendId: String

  public init(friendId: String) {
    self.friendId = friendId
  }

  public var variables: GraphQLMap? {
    return ["friendId": friendId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["mutation_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("sendFriendRequest", arguments: ["friendId": GraphQLVariable("friendId")], type: .nonNull(.object(SendFriendRequest.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(sendFriendRequest: SendFriendRequest) {
      self.init(unsafeResultMap: ["__typename": "mutation_root", "sendFriendRequest": sendFriendRequest.resultMap])
    }

    public var sendFriendRequest: SendFriendRequest {
      get {
        return SendFriendRequest(unsafeResultMap: resultMap["sendFriendRequest"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "sendFriendRequest")
      }
    }

    public struct SendFriendRequest: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["ActionResult"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("status", type: .nonNull(.scalar(ActionStatus.self))),
          GraphQLField("reason", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(status: ActionStatus, reason: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "ActionResult", "status": status, "reason": reason])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var status: ActionStatus {
        get {
          return resultMap["status"]! as! ActionStatus
        }
        set {
          resultMap.updateValue(newValue, forKey: "status")
        }
      }

      public var reason: String? {
        get {
          return resultMap["reason"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "reason")
        }
      }
    }
  }
}

public final class RemoveFriendMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation RemoveFriend($userId: String!) {
      removeFriend(friendId: $userId) {
        __typename
        status
        reason
      }
    }
    """

  public let operationName: String = "RemoveFriend"

  public var userId: String

  public init(userId: String) {
    self.userId = userId
  }

  public var variables: GraphQLMap? {
    return ["userId": userId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["mutation_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("removeFriend", arguments: ["friendId": GraphQLVariable("userId")], type: .nonNull(.object(RemoveFriend.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(removeFriend: RemoveFriend) {
      self.init(unsafeResultMap: ["__typename": "mutation_root", "removeFriend": removeFriend.resultMap])
    }

    public var removeFriend: RemoveFriend {
      get {
        return RemoveFriend(unsafeResultMap: resultMap["removeFriend"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "removeFriend")
      }
    }

    public struct RemoveFriend: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["ActionResult"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("status", type: .nonNull(.scalar(ActionStatus.self))),
          GraphQLField("reason", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(status: ActionStatus, reason: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "ActionResult", "status": status, "reason": reason])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var status: ActionStatus {
        get {
          return resultMap["status"]! as! ActionStatus
        }
        set {
          resultMap.updateValue(newValue, forKey: "status")
        }
      }

      public var reason: String? {
        get {
          return resultMap["reason"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "reason")
        }
      }
    }
  }
}

public final class PutDeviceTokenMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation PutDeviceToken($token: String!) {
      putDeviceToken(token: $token) {
        __typename
        status
        reason
        id
      }
    }
    """

  public let operationName: String = "PutDeviceToken"

  public var token: String

  public init(token: String) {
    self.token = token
  }

  public var variables: GraphQLMap? {
    return ["token": token]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["mutation_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("putDeviceToken", arguments: ["token": GraphQLVariable("token")], type: .nonNull(.object(PutDeviceToken.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(putDeviceToken: PutDeviceToken) {
      self.init(unsafeResultMap: ["__typename": "mutation_root", "putDeviceToken": putDeviceToken.resultMap])
    }

    public var putDeviceToken: PutDeviceToken {
      get {
        return PutDeviceToken(unsafeResultMap: resultMap["putDeviceToken"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "putDeviceToken")
      }
    }

    public struct PutDeviceToken: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["ActionResult"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("status", type: .nonNull(.scalar(ActionStatus.self))),
          GraphQLField("reason", type: .scalar(String.self)),
          GraphQLField("id", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(status: ActionStatus, reason: String? = nil, id: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "ActionResult", "status": status, "reason": reason, "id": id])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var status: ActionStatus {
        get {
          return resultMap["status"]! as! ActionStatus
        }
        set {
          resultMap.updateValue(newValue, forKey: "status")
        }
      }

      public var reason: String? {
        get {
          return resultMap["reason"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "reason")
        }
      }

      public var id: String? {
        get {
          return resultMap["id"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }
    }
  }
}

public final class RemoveDeviceTokenMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation RemoveDeviceToken($token: String!) {
      removeDeviceToken(token: $token) {
        __typename
        status
        reason
      }
    }
    """

  public let operationName: String = "RemoveDeviceToken"

  public var token: String

  public init(token: String) {
    self.token = token
  }

  public var variables: GraphQLMap? {
    return ["token": token]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["mutation_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("removeDeviceToken", arguments: ["token": GraphQLVariable("token")], type: .nonNull(.object(RemoveDeviceToken.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(removeDeviceToken: RemoveDeviceToken) {
      self.init(unsafeResultMap: ["__typename": "mutation_root", "removeDeviceToken": removeDeviceToken.resultMap])
    }

    public var removeDeviceToken: RemoveDeviceToken {
      get {
        return RemoveDeviceToken(unsafeResultMap: resultMap["removeDeviceToken"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "removeDeviceToken")
      }
    }

    public struct RemoveDeviceToken: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["ActionResult"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("status", type: .nonNull(.scalar(ActionStatus.self))),
          GraphQLField("reason", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(status: ActionStatus, reason: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "ActionResult", "status": status, "reason": reason])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var status: ActionStatus {
        get {
          return resultMap["status"]! as! ActionStatus
        }
        set {
          resultMap.updateValue(newValue, forKey: "status")
        }
      }

      public var reason: String? {
        get {
          return resultMap["reason"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "reason")
        }
      }
    }
  }
}

public final class CreateUserMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation CreateUser($input: CreateUserInput!) {
      createUser(arg1: $input) {
        __typename
        status
        reason
        id
      }
    }
    """

  public let operationName: String = "CreateUser"

  public var input: CreateUserInput

  public init(input: CreateUserInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["mutation_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("createUser", arguments: ["arg1": GraphQLVariable("input")], type: .nonNull(.object(CreateUser.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createUser: CreateUser) {
      self.init(unsafeResultMap: ["__typename": "mutation_root", "createUser": createUser.resultMap])
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
      public static let possibleTypes: [String] = ["ActionResult"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("status", type: .nonNull(.scalar(ActionStatus.self))),
          GraphQLField("reason", type: .scalar(String.self)),
          GraphQLField("id", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(status: ActionStatus, reason: String? = nil, id: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "ActionResult", "status": status, "reason": reason, "id": id])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var status: ActionStatus {
        get {
          return resultMap["status"]! as! ActionStatus
        }
        set {
          resultMap.updateValue(newValue, forKey: "status")
        }
      }

      public var reason: String? {
        get {
          return resultMap["reason"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "reason")
        }
      }

      public var id: String? {
        get {
          return resultMap["id"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }
    }
  }
}

public struct AttendeeDetails: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment AttendeeDetails on event_attendees {
      __typename
      id
      user {
        __typename
        ...UserDetails
      }
      status
      team {
        __typename
        id
        scores
      }
    }
    """

  public static let possibleTypes: [String] = ["event_attendees"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(String.self))),
      GraphQLField("user", type: .nonNull(.object(User.selections))),
      GraphQLField("status", type: .scalar(event_attendee_status_enum.self)),
      GraphQLField("team", type: .object(Team.selections)),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: String, user: User, status: event_attendee_status_enum? = nil, team: Team? = nil) {
    self.init(unsafeResultMap: ["__typename": "event_attendees", "id": id, "user": user.resultMap, "status": status, "team": team.flatMap { (value: Team) -> ResultMap in value.resultMap }])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: String {
    get {
      return resultMap["id"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  /// An object relationship
  public var user: User {
    get {
      return User(unsafeResultMap: resultMap["user"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "user")
    }
  }

  public var status: event_attendee_status_enum? {
    get {
      return resultMap["status"] as? event_attendee_status_enum
    }
    set {
      resultMap.updateValue(newValue, forKey: "status")
    }
  }

  /// An object relationship
  public var team: Team? {
    get {
      return (resultMap["team"] as? ResultMap).flatMap { Team(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "team")
    }
  }

  public struct User: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["users"]

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

    public init(id: String, firstName: String, lastName: String, username: String, photoUrl: String? = nil, college: String? = nil, friendStatus: Bool? = nil) {
      self.init(unsafeResultMap: ["__typename": "users", "id": id, "firstName": firstName, "lastName": lastName, "username": username, "photoUrl": photoUrl, "college": college, "friendStatus": friendStatus])
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

  public struct Team: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["event_teams"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(Int.self))),
        GraphQLField("scores", type: .scalar(String.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: Int, scores: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "event_teams", "id": id, "scores": scores])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: Int {
      get {
        return resultMap["id"]! as! Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "id")
      }
    }

    public var scores: String? {
      get {
        return resultMap["scores"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "scores")
      }
    }
  }
}

public struct EventDetails: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment EventDetails on events {
      __typename
      id
      name
      info
      capacity
      attendees {
        __typename
        ...AttendeeDetails
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
          ...AttendeeDetails
        }
      }
      mvp {
        __typename
        id
        firstName
        lastName
      }
    }
    """

  public static let possibleTypes: [String] = ["events"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(Int.self))),
      GraphQLField("name", type: .nonNull(.scalar(String.self))),
      GraphQLField("info", type: .nonNull(.scalar(String.self))),
      GraphQLField("capacity", type: .nonNull(.scalar(Int.self))),
      GraphQLField("attendees", type: .nonNull(.list(.nonNull(.object(Attendee.selections))))),
      GraphQLField("startDate", type: .nonNull(.scalar(String.self))),
      GraphQLField("endDate", type: .scalar(String.self)),
      GraphQLField("type", type: .nonNull(.scalar(event_type_enum.self))),
      GraphQLField("status", type: .nonNull(.scalar(event_status_enum.self))),
      GraphQLField("winner", type: .object(Winner.selections)),
      GraphQLField("teams", type: .nonNull(.list(.nonNull(.object(Team.selections))))),
      GraphQLField("mvp", type: .object(Mvp.selections)),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: Int, name: String, info: String, capacity: Int, attendees: [Attendee], startDate: String, endDate: String? = nil, type: event_type_enum, status: event_status_enum, winner: Winner? = nil, teams: [Team], mvp: Mvp? = nil) {
    self.init(unsafeResultMap: ["__typename": "events", "id": id, "name": name, "info": info, "capacity": capacity, "attendees": attendees.map { (value: Attendee) -> ResultMap in value.resultMap }, "startDate": startDate, "endDate": endDate, "type": type, "status": status, "winner": winner.flatMap { (value: Winner) -> ResultMap in value.resultMap }, "teams": teams.map { (value: Team) -> ResultMap in value.resultMap }, "mvp": mvp.flatMap { (value: Mvp) -> ResultMap in value.resultMap }])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: Int {
    get {
      return resultMap["id"]! as! Int
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

  /// An array relationship
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

  public var endDate: String? {
    get {
      return resultMap["endDate"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "endDate")
    }
  }

  public var type: event_type_enum {
    get {
      return resultMap["type"]! as! event_type_enum
    }
    set {
      resultMap.updateValue(newValue, forKey: "type")
    }
  }

  public var status: event_status_enum {
    get {
      return resultMap["status"]! as! event_status_enum
    }
    set {
      resultMap.updateValue(newValue, forKey: "status")
    }
  }

  /// An object relationship
  public var winner: Winner? {
    get {
      return (resultMap["winner"] as? ResultMap).flatMap { Winner(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "winner")
    }
  }

  /// An array relationship
  public var teams: [Team] {
    get {
      return (resultMap["teams"] as! [ResultMap]).map { (value: ResultMap) -> Team in Team(unsafeResultMap: value) }
    }
    set {
      resultMap.updateValue(newValue.map { (value: Team) -> ResultMap in value.resultMap }, forKey: "teams")
    }
  }

  /// An object relationship
  public var mvp: Mvp? {
    get {
      return (resultMap["mvp"] as? ResultMap).flatMap { Mvp(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "mvp")
    }
  }

  public struct Attendee: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["event_attendees"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(AttendeeDetails.self),
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

      public var attendeeDetails: AttendeeDetails {
        get {
          return AttendeeDetails(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }
    }
  }

  public struct Winner: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["event_teams"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(Int.self))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: Int) {
      self.init(unsafeResultMap: ["__typename": "event_teams", "id": id])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: Int {
      get {
        return resultMap["id"]! as! Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "id")
      }
    }
  }

  public struct Team: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["event_teams"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(Int.self))),
        GraphQLField("scores", type: .scalar(String.self)),
        GraphQLField("members", type: .nonNull(.list(.nonNull(.object(Member.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: Int, scores: String? = nil, members: [Member]) {
      self.init(unsafeResultMap: ["__typename": "event_teams", "id": id, "scores": scores, "members": members.map { (value: Member) -> ResultMap in value.resultMap }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: Int {
      get {
        return resultMap["id"]! as! Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "id")
      }
    }

    public var scores: String? {
      get {
        return resultMap["scores"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "scores")
      }
    }

    /// An array relationship
    public var members: [Member] {
      get {
        return (resultMap["members"] as! [ResultMap]).map { (value: ResultMap) -> Member in Member(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Member) -> ResultMap in value.resultMap }, forKey: "members")
      }
    }

    public struct Member: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["event_attendees"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(AttendeeDetails.self),
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

        public var attendeeDetails: AttendeeDetails {
          get {
            return AttendeeDetails(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }

  public struct Mvp: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["users"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(String.self))),
        GraphQLField("firstName", type: .nonNull(.scalar(String.self))),
        GraphQLField("lastName", type: .nonNull(.scalar(String.self))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: String, firstName: String, lastName: String) {
      self.init(unsafeResultMap: ["__typename": "users", "id": id, "firstName": firstName, "lastName": lastName])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: String {
      get {
        return resultMap["id"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "id")
      }
    }

    public var firstName: String {
      get {
        return resultMap["firstName"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "firstName")
      }
    }

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

public struct UserDetails: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment UserDetails on users {
      __typename
      id
      firstName
      lastName
      username
      photoUrl
      college
      friendStatus
    }
    """

  public static let possibleTypes: [String] = ["users"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(String.self))),
      GraphQLField("firstName", type: .nonNull(.scalar(String.self))),
      GraphQLField("lastName", type: .nonNull(.scalar(String.self))),
      GraphQLField("username", type: .nonNull(.scalar(String.self))),
      GraphQLField("photoUrl", type: .scalar(String.self)),
      GraphQLField("college", type: .scalar(String.self)),
      GraphQLField("friendStatus", type: .scalar(Bool.self)),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: String, firstName: String, lastName: String, username: String, photoUrl: String? = nil, college: String? = nil, friendStatus: Bool? = nil) {
    self.init(unsafeResultMap: ["__typename": "users", "id": id, "firstName": firstName, "lastName": lastName, "username": username, "photoUrl": photoUrl, "college": college, "friendStatus": friendStatus])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: String {
    get {
      return resultMap["id"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var firstName: String {
    get {
      return resultMap["firstName"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "firstName")
    }
  }

  public var lastName: String {
    get {
      return resultMap["lastName"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "lastName")
    }
  }

  public var username: String {
    get {
      return resultMap["username"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "username")
    }
  }

  public var photoUrl: String? {
    get {
      return resultMap["photoUrl"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "photoUrl")
    }
  }

  public var college: String? {
    get {
      return resultMap["college"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "college")
    }
  }

  /// A computed field, executes function "friend_status"
  public var friendStatus: Bool? {
    get {
      return resultMap["friendStatus"] as? Bool
    }
    set {
      resultMap.updateValue(newValue, forKey: "friendStatus")
    }
  }
}
