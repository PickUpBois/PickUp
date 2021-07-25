// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public enum event_type_enum: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// basketball type
  case basketball
  /// tennis type
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

public enum event_attendee_status_enum: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// user has conflicting events
  case conflict
  /// user invited to event
  case invited
  /// user has joined event
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
  /// owner has deleted this event
  case deletedEvent
  /// invited to event
  case eventInvitation
  /// owner needs to finish started event
  case finishEvent
  /// user is friend
  case friend
  /// user accepted your friend request
  case friendRequestAccept
  /// user rejected your friend request
  case friendRequestReject
  /// received friend requests
  case friendRequestSend
  /// user has joined your event
  case joinedEvent
  /// user has left your event
  case leftEvent
  /// user has read notification
  case read
  /// you have been selected mvp in event
  case selectedMvp
  /// user has not read notification
  case unread
  /// vote for event mvp
  case voteForMvp
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "deletedEvent": self = .deletedEvent
      case "eventInvitation": self = .eventInvitation
      case "finishEvent": self = .finishEvent
      case "friend": self = .friend
      case "friendRequestAccept": self = .friendRequestAccept
      case "friendRequestReject": self = .friendRequestReject
      case "friendRequestSend": self = .friendRequestSend
      case "joinedEvent": self = .joinedEvent
      case "leftEvent": self = .leftEvent
      case "read": self = .read
      case "selectedMvp": self = .selectedMvp
      case "unread": self = .unread
      case "voteForMvp": self = .voteForMvp
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .deletedEvent: return "deletedEvent"
      case .eventInvitation: return "eventInvitation"
      case .finishEvent: return "finishEvent"
      case .friend: return "friend"
      case .friendRequestAccept: return "friendRequestAccept"
      case .friendRequestReject: return "friendRequestReject"
      case .friendRequestSend: return "friendRequestSend"
      case .joinedEvent: return "joinedEvent"
      case .leftEvent: return "leftEvent"
      case .read: return "read"
      case .selectedMvp: return "selectedMvp"
      case .unread: return "unread"
      case .voteForMvp: return "voteForMvp"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: notification_type_enum, rhs: notification_type_enum) -> Bool {
    switch (lhs, rhs) {
      case (.deletedEvent, .deletedEvent): return true
      case (.eventInvitation, .eventInvitation): return true
      case (.finishEvent, .finishEvent): return true
      case (.friend, .friend): return true
      case (.friendRequestAccept, .friendRequestAccept): return true
      case (.friendRequestReject, .friendRequestReject): return true
      case (.friendRequestSend, .friendRequestSend): return true
      case (.joinedEvent, .joinedEvent): return true
      case (.leftEvent, .leftEvent): return true
      case (.read, .read): return true
      case (.selectedMvp, .selectedMvp): return true
      case (.unread, .unread): return true
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
      .friend,
      .friendRequestAccept,
      .friendRequestReject,
      .friendRequestSend,
      .joinedEvent,
      .leftEvent,
      .read,
      .selectedMvp,
      .unread,
      .voteForMvp,
    ]
  }
}

public struct EndEventInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - eventId
  ///   - resultInfo
  ///   - team1Members
  ///   - team1Scores
  ///   - team1Win
  ///   - team2Members
  ///   - team2Scores
  ///   - team2Win
  public init(eventId: String, resultInfo: Swift.Optional<String?> = nil, team1Members: [GraphQLID], team1Scores: [Int], team1Win: Bool, team2Members: [GraphQLID], team2Scores: [Int], team2Win: Bool) {
    graphQLMap = ["eventId": eventId, "resultInfo": resultInfo, "team1_members": team1Members, "team1_scores": team1Scores, "team1_win": team1Win, "team2_members": team2Members, "team2_scores": team2Scores, "team2_win": team2Win]
  }

  public var eventId: String {
    get {
      return graphQLMap["eventId"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eventId")
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
}

public struct UpdateUserInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - college
  ///   - firstName
  ///   - id
  ///   - lastName
  ///   - photoUrl
  ///   - username
  public init(college: Swift.Optional<String?> = nil, firstName: Swift.Optional<String?> = nil, id: GraphQLID, lastName: Swift.Optional<String?> = nil, photoUrl: Swift.Optional<String?> = nil, username: Swift.Optional<String?> = nil) {
    graphQLMap = ["college": college, "firstName": firstName, "id": id, "lastName": lastName, "photoUrl": photoUrl, "username": username]
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

  public var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
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
  /// Event is open
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
  ///   - firstName: first name of user
  ///   - id: id of user
  ///   - lastName: last name of user
  ///   - username: username of user
  public init(firstName: String, id: GraphQLID, lastName: String, username: String) {
    graphQLMap = ["firstName": firstName, "id": id, "lastName": lastName, "username": username]
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

  /// id of user
  public var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
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

  /// username of user
  public var username: String {
    get {
      return graphQLMap["username"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "username")
    }
  }
}

public final class CreateEventMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation CreateEvent($userId: String!, $name: String!, $info: String!, $capacity: Int!, $type: event_type_enum) {
      insert_events_one(
        object: {attendees: {data: {id: $userId, status: owner}}, capacity: $capacity, name: $name, type: $type, info: $info}
      ) {
        __typename
        id
      }
    }
    """

  public let operationName: String = "CreateEvent"

  public var userId: String
  public var name: String
  public var info: String
  public var capacity: Int
  public var type: event_type_enum?

  public init(userId: String, name: String, info: String, capacity: Int, type: event_type_enum? = nil) {
    self.userId = userId
    self.name = name
    self.info = info
    self.capacity = capacity
    self.type = type
  }

  public var variables: GraphQLMap? {
    return ["userId": userId, "name": name, "info": info, "capacity": capacity, "type": type]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["mutation_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("insert_events_one", arguments: ["object": ["attendees": ["data": ["id": GraphQLVariable("userId"), "status": "owner"]], "capacity": GraphQLVariable("capacity"), "name": GraphQLVariable("name"), "type": GraphQLVariable("type"), "info": GraphQLVariable("info")]], type: .object(InsertEventsOne.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(insertEventsOne: InsertEventsOne? = nil) {
      self.init(unsafeResultMap: ["__typename": "mutation_root", "insert_events_one": insertEventsOne.flatMap { (value: InsertEventsOne) -> ResultMap in value.resultMap }])
    }

    /// insert a single row into the table: "events"
    public var insertEventsOne: InsertEventsOne? {
      get {
        return (resultMap["insert_events_one"] as? ResultMap).flatMap { InsertEventsOne(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "insert_events_one")
      }
    }

    public struct InsertEventsOne: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["events"]

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
        self.init(unsafeResultMap: ["__typename": "events", "id": id])
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
    mutation LeaveEvent($userId: ID!, $eventId: ID!) {
      leaveEvent(userId: $userId, eventId: $eventId) {
        __typename
        id
      }
    }
    """

  public let operationName: String = "LeaveEvent"

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
    public static let possibleTypes: [String] = ["mutation_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("leaveEvent", arguments: ["userId": GraphQLVariable("userId"), "eventId": GraphQLVariable("eventId")], type: .object(LeaveEvent.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(leaveEvent: LeaveEvent? = nil) {
      self.init(unsafeResultMap: ["__typename": "mutation_root", "leaveEvent": leaveEvent.flatMap { (value: LeaveEvent) -> ResultMap in value.resultMap }])
    }

    public var leaveEvent: LeaveEvent? {
      get {
        return (resultMap["leaveEvent"] as? ResultMap).flatMap { LeaveEvent(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "leaveEvent")
      }
    }

    public struct LeaveEvent: GraphQLSelectionSet {
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

public final class DeleteEventMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation DeleteEvent($userId: ID!, $eventId: ID!) {
      deleteEvent(userId: $userId, eventId: $eventId) {
        __typename
        id
      }
    }
    """

  public let operationName: String = "DeleteEvent"

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
    public static let possibleTypes: [String] = ["mutation_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("deleteEvent", arguments: ["userId": GraphQLVariable("userId"), "eventId": GraphQLVariable("eventId")], type: .object(DeleteEvent.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(deleteEvent: DeleteEvent? = nil) {
      self.init(unsafeResultMap: ["__typename": "mutation_root", "deleteEvent": deleteEvent.flatMap { (value: DeleteEvent) -> ResultMap in value.resultMap }])
    }

    public var deleteEvent: DeleteEvent? {
      get {
        return (resultMap["deleteEvent"] as? ResultMap).flatMap { DeleteEvent(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "deleteEvent")
      }
    }

    public struct DeleteEvent: GraphQLSelectionSet {
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
    public static let possibleTypes: [String] = ["query_root"]

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
      self.init(unsafeResultMap: ["__typename": "query_root", "searchUsers": searchUsers.map { (value: SearchUser) -> ResultMap in value.resultMap }])
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
            GraphQLField("id", type: .nonNull(.scalar(String.self))),
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

        public init(id: String, username: String, firstName: String, lastName: String, photoUrl: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "users", "id": id, "username": username, "firstName": firstName, "lastName": lastName, "photoUrl": photoUrl])
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

public final class GetUpcomingEventsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetUpcomingEvents {
      events(where: {status: {_eq: open}}) {
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
        GraphQLField("events", arguments: ["where": ["status": ["_eq": "open"]]], type: .nonNull(.list(.nonNull(.object(Event.selections))))),
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
    mutation AcceptFriendRequest($userId: ID!, $friendId: ID!) {
      acceptFriendRequest(user_id: $userId, friend_id: $friendId) {
        __typename
        id
      }
    }
    """

  public let operationName: String = "AcceptFriendRequest"

  public var userId: GraphQLID
  public var friendId: GraphQLID

  public init(userId: GraphQLID, friendId: GraphQLID) {
    self.userId = userId
    self.friendId = friendId
  }

  public var variables: GraphQLMap? {
    return ["userId": userId, "friendId": friendId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["mutation_root"]

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
      self.init(unsafeResultMap: ["__typename": "mutation_root", "acceptFriendRequest": acceptFriendRequest.flatMap { (value: AcceptFriendRequest) -> ResultMap in value.resultMap }])
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
    mutation RejectFriendRequest($userId: ID!, $friendId: ID!) {
      rejectFriendRequest(user_id: $userId, friend_id: $friendId) {
        __typename
        id
      }
    }
    """

  public let operationName: String = "RejectFriendRequest"

  public var userId: GraphQLID
  public var friendId: GraphQLID

  public init(userId: GraphQLID, friendId: GraphQLID) {
    self.userId = userId
    self.friendId = friendId
  }

  public var variables: GraphQLMap? {
    return ["userId": userId, "friendId": friendId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["mutation_root"]

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
      self.init(unsafeResultMap: ["__typename": "mutation_root", "rejectFriendRequest": rejectFriendRequest.flatMap { (value: RejectFriendRequest) -> ResultMap in value.resultMap }])
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
          GraphQLField("id", type: .nonNull(.scalar(String.self))),
          GraphQLField("notifications", type: .list(.nonNull(.object(Notification.selections)))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: String, notifications: [Notification]? = nil) {
        self.init(unsafeResultMap: ["__typename": "users", "id": id, "notifications": notifications.flatMap { (value: [Notification]) -> [ResultMap] in value.map { (value: Notification) -> ResultMap in value.resultMap } }])
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

      /// A computed field, executes function "get_notifications"
      public var notifications: [Notification]? {
        get {
          return (resultMap["notifications"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Notification] in value.map { (value: ResultMap) -> Notification in Notification(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Notification]) -> [ResultMap] in value.map { (value: Notification) -> ResultMap in value.resultMap } }, forKey: "notifications")
        }
      }

      public struct Notification: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["notifications"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
            GraphQLField("type", type: .nonNull(.scalar(notification_type_enum.self))),
            GraphQLField("actor", type: .object(Actor.selections)),
            GraphQLField("event", type: .object(Event.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(createdAt: String, type: notification_type_enum, actor: Actor? = nil, event: Event? = nil) {
          self.init(unsafeResultMap: ["__typename": "notifications", "createdAt": createdAt, "type": type, "actor": actor.flatMap { (value: Actor) -> ResultMap in value.resultMap }, "event": event.flatMap { (value: Event) -> ResultMap in value.resultMap }])
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

        public var type: notification_type_enum {
          get {
            return resultMap["type"]! as! notification_type_enum
          }
          set {
            resultMap.updateValue(newValue, forKey: "type")
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

          public init(id: String, firstName: String, lastName: String, username: String, photoUrl: String? = nil, college: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "users", "id": id, "firstName": firstName, "lastName": lastName, "username": username, "photoUrl": photoUrl, "college": college])
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
    public static let possibleTypes: [String] = ["mutation_root"]

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
      self.init(unsafeResultMap: ["__typename": "mutation_root", "markNotificationAsRead": markNotificationAsRead.flatMap { (value: MarkNotificationAsRead) -> ResultMap in value.resultMap }])
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
    public static let possibleTypes: [String] = ["mutation_root"]

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
      self.init(unsafeResultMap: ["__typename": "mutation_root", "joinEvent": joinEvent.resultMap])
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
    public static let possibleTypes: [String] = ["mutation_root"]

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
      self.init(unsafeResultMap: ["__typename": "mutation_root", "acceptEventInvitation": acceptEventInvitation.flatMap { (value: AcceptEventInvitation) -> ResultMap in value.resultMap }])
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
    public static let possibleTypes: [String] = ["mutation_root"]

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
      self.init(unsafeResultMap: ["__typename": "mutation_root", "declineEventInvitation": declineEventInvitation.flatMap { (value: DeclineEventInvitation) -> ResultMap in value.resultMap }])
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

public final class InviteUserMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation InviteUser($actorId: ID!, $eventId: ID!, $userId: ID!) {
      inviteUserToEvent(actorId: $actorId, eventId: $eventId, userId: $userId) {
        __typename
        id
      }
    }
    """

  public let operationName: String = "InviteUser"

  public var actorId: GraphQLID
  public var eventId: GraphQLID
  public var userId: GraphQLID

  public init(actorId: GraphQLID, eventId: GraphQLID, userId: GraphQLID) {
    self.actorId = actorId
    self.eventId = eventId
    self.userId = userId
  }

  public var variables: GraphQLMap? {
    return ["actorId": actorId, "eventId": eventId, "userId": userId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["mutation_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("inviteUserToEvent", arguments: ["actorId": GraphQLVariable("actorId"), "eventId": GraphQLVariable("eventId"), "userId": GraphQLVariable("userId")], type: .object(InviteUserToEvent.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(inviteUserToEvent: InviteUserToEvent? = nil) {
      self.init(unsafeResultMap: ["__typename": "mutation_root", "inviteUserToEvent": inviteUserToEvent.flatMap { (value: InviteUserToEvent) -> ResultMap in value.resultMap }])
    }

    public var inviteUserToEvent: InviteUserToEvent? {
      get {
        return (resultMap["inviteUserToEvent"] as? ResultMap).flatMap { InviteUserToEvent(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "inviteUserToEvent")
      }
    }

    public struct InviteUserToEvent: GraphQLSelectionSet {
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

public final class GetEventQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetEvent($eventId: ID!) {
      getEvent(eventId: $eventId) {
        __typename
        id
        invitedAttendees {
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

  public var eventId: GraphQLID

  public init(eventId: GraphQLID) {
    self.eventId = eventId
  }

  public var variables: GraphQLMap? {
    return ["eventId": eventId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("getEvent", arguments: ["eventId": GraphQLVariable("eventId")], type: .nonNull(.object(GetEvent.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getEvent: GetEvent) {
      self.init(unsafeResultMap: ["__typename": "query_root", "getEvent": getEvent.resultMap])
    }

    public var getEvent: GetEvent {
      get {
        return GetEvent(unsafeResultMap: resultMap["getEvent"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "getEvent")
      }
    }

    public struct GetEvent: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Event"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("invitedAttendees", type: .nonNull(.list(.nonNull(.object(InvitedAttendee.selections))))),
          GraphQLField("attendees", type: .nonNull(.list(.nonNull(.object(Attendee.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, invitedAttendees: [InvitedAttendee], attendees: [Attendee]) {
        self.init(unsafeResultMap: ["__typename": "Event", "id": id, "invitedAttendees": invitedAttendees.map { (value: InvitedAttendee) -> ResultMap in value.resultMap }, "attendees": attendees.map { (value: Attendee) -> ResultMap in value.resultMap }])
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

      public var invitedAttendees: [InvitedAttendee] {
        get {
          return (resultMap["invitedAttendees"] as! [ResultMap]).map { (value: ResultMap) -> InvitedAttendee in InvitedAttendee(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: InvitedAttendee) -> ResultMap in value.resultMap }, forKey: "invitedAttendees")
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

      public struct InvitedAttendee: GraphQLSelectionSet {
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

      public struct Attendee: GraphQLSelectionSet {
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

public final class CancelEventInvitationMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation CancelEventInvitation($actorId: ID!, $eventId: ID!, $userId: ID!) {
      cancelEventInvitation(actorId: $actorId, eventId: $eventId, userId: $userId) {
        __typename
        id
      }
    }
    """

  public let operationName: String = "CancelEventInvitation"

  public var actorId: GraphQLID
  public var eventId: GraphQLID
  public var userId: GraphQLID

  public init(actorId: GraphQLID, eventId: GraphQLID, userId: GraphQLID) {
    self.actorId = actorId
    self.eventId = eventId
    self.userId = userId
  }

  public var variables: GraphQLMap? {
    return ["actorId": actorId, "eventId": eventId, "userId": userId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["mutation_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("cancelEventInvitation", arguments: ["actorId": GraphQLVariable("actorId"), "eventId": GraphQLVariable("eventId"), "userId": GraphQLVariable("userId")], type: .object(CancelEventInvitation.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(cancelEventInvitation: CancelEventInvitation? = nil) {
      self.init(unsafeResultMap: ["__typename": "mutation_root", "cancelEventInvitation": cancelEventInvitation.flatMap { (value: CancelEventInvitation) -> ResultMap in value.resultMap }])
    }

    public var cancelEventInvitation: CancelEventInvitation? {
      get {
        return (resultMap["cancelEventInvitation"] as? ResultMap).flatMap { CancelEventInvitation(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "cancelEventInvitation")
      }
    }

    public struct CancelEventInvitation: GraphQLSelectionSet {
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
    public static let possibleTypes: [String] = ["mutation_root"]

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
      self.init(unsafeResultMap: ["__typename": "mutation_root", "voteForMvp": voteForMvp.flatMap { (value: VoteForMvp) -> ResultMap in value.resultMap }])
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
    public static let possibleTypes: [String] = ["mutation_root"]

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

public final class GetJoinedEventsByStatusQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetJoinedEventsByStatus($userId: String!, $status: event_status_enum!) {
      events(where: {status: {_eq: $status}, attendees: {id: {_eq: $userId}}}) {
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
  public var status: event_status_enum

  public init(userId: String, status: event_status_enum) {
    self.userId = userId
    self.status = status
  }

  public var variables: GraphQLMap? {
    return ["userId": userId, "status": status]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("events", arguments: ["where": ["status": ["_eq": GraphQLVariable("status")], "attendees": ["id": ["_eq": GraphQLVariable("userId")]]]], type: .nonNull(.list(.nonNull(.object(Event.selections))))),
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
        id
        firstName
        goatScore
        lastName
        photoUrl
        username
      }
    }
    """

  public let operationName: String = "GetUser"

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
          GraphQLField("id", type: .nonNull(.scalar(String.self))),
          GraphQLField("firstName", type: .nonNull(.scalar(String.self))),
          GraphQLField("goatScore", type: .nonNull(.scalar(Int.self))),
          GraphQLField("lastName", type: .nonNull(.scalar(String.self))),
          GraphQLField("photoUrl", type: .scalar(String.self)),
          GraphQLField("username", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: String, firstName: String, goatScore: Int, lastName: String, photoUrl: String? = nil, username: String) {
        self.init(unsafeResultMap: ["__typename": "users", "id": id, "firstName": firstName, "goatScore": goatScore, "lastName": lastName, "photoUrl": photoUrl, "username": username])
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

      public var goatScore: Int {
        get {
          return resultMap["goatScore"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "goatScore")
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

      public var photoUrl: String? {
        get {
          return resultMap["photoUrl"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "photoUrl")
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

public final class SendFriendRequestMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation SendFriendRequest($userId: ID!, $friendId: ID!) {
      sendFriendRequest(user_id: $userId, friend_id: $friendId) {
        __typename
        id
      }
    }
    """

  public let operationName: String = "SendFriendRequest"

  public var userId: GraphQLID
  public var friendId: GraphQLID

  public init(userId: GraphQLID, friendId: GraphQLID) {
    self.userId = userId
    self.friendId = friendId
  }

  public var variables: GraphQLMap? {
    return ["userId": userId, "friendId": friendId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["mutation_root"]

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
      self.init(unsafeResultMap: ["__typename": "mutation_root", "sendFriendRequest": sendFriendRequest.flatMap { (value: SendFriendRequest) -> ResultMap in value.resultMap }])
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

public final class RemoveFriendMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation RemoveFriend($userId: ID!, $friendId: ID!) {
      removeFriend(userId: $userId, friendId: $friendId) {
        __typename
        id
      }
    }
    """

  public let operationName: String = "RemoveFriend"

  public var userId: GraphQLID
  public var friendId: GraphQLID

  public init(userId: GraphQLID, friendId: GraphQLID) {
    self.userId = userId
    self.friendId = friendId
  }

  public var variables: GraphQLMap? {
    return ["userId": userId, "friendId": friendId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["mutation_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("removeFriend", arguments: ["userId": GraphQLVariable("userId"), "friendId": GraphQLVariable("friendId")], type: .object(RemoveFriend.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(removeFriend: RemoveFriend? = nil) {
      self.init(unsafeResultMap: ["__typename": "mutation_root", "removeFriend": removeFriend.flatMap { (value: RemoveFriend) -> ResultMap in value.resultMap }])
    }

    public var removeFriend: RemoveFriend? {
      get {
        return (resultMap["removeFriend"] as? ResultMap).flatMap { RemoveFriend(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "removeFriend")
      }
    }

    public struct RemoveFriend: GraphQLSelectionSet {
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

public final class PutDeviceTokenMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation PutDeviceToken($userId: ID!, $token: String!) {
      putDeviceToken(userId: $userId, token: $token) {
        __typename
        id
      }
    }
    """

  public let operationName: String = "PutDeviceToken"

  public var userId: GraphQLID
  public var token: String

  public init(userId: GraphQLID, token: String) {
    self.userId = userId
    self.token = token
  }

  public var variables: GraphQLMap? {
    return ["userId": userId, "token": token]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["mutation_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("putDeviceToken", arguments: ["userId": GraphQLVariable("userId"), "token": GraphQLVariable("token")], type: .object(PutDeviceToken.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(putDeviceToken: PutDeviceToken? = nil) {
      self.init(unsafeResultMap: ["__typename": "mutation_root", "putDeviceToken": putDeviceToken.flatMap { (value: PutDeviceToken) -> ResultMap in value.resultMap }])
    }

    public var putDeviceToken: PutDeviceToken? {
      get {
        return (resultMap["putDeviceToken"] as? ResultMap).flatMap { PutDeviceToken(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "putDeviceToken")
      }
    }

    public struct PutDeviceToken: GraphQLSelectionSet {
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

public final class RemoveDeviceTokenMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation RemoveDeviceToken($userId: ID!, $token: String!) {
      removeDeviceToken(userId: $userId, token: $token) {
        __typename
        id
      }
    }
    """

  public let operationName: String = "RemoveDeviceToken"

  public var userId: GraphQLID
  public var token: String

  public init(userId: GraphQLID, token: String) {
    self.userId = userId
    self.token = token
  }

  public var variables: GraphQLMap? {
    return ["userId": userId, "token": token]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["mutation_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("removeDeviceToken", arguments: ["userId": GraphQLVariable("userId"), "token": GraphQLVariable("token")], type: .object(RemoveDeviceToken.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(removeDeviceToken: RemoveDeviceToken? = nil) {
      self.init(unsafeResultMap: ["__typename": "mutation_root", "removeDeviceToken": removeDeviceToken.flatMap { (value: RemoveDeviceToken) -> ResultMap in value.resultMap }])
    }

    public var removeDeviceToken: RemoveDeviceToken? {
      get {
        return (resultMap["removeDeviceToken"] as? ResultMap).flatMap { RemoveDeviceToken(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "removeDeviceToken")
      }
    }

    public struct RemoveDeviceToken: GraphQLSelectionSet {
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
    public static let possibleTypes: [String] = ["mutation_root"]

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

public struct AttendeeDetails: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment AttendeeDetails on event_attendees {
      __typename
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
      GraphQLField("user", type: .nonNull(.object(User.selections))),
      GraphQLField("status", type: .scalar(event_attendee_status_enum.self)),
      GraphQLField("team", type: .object(Team.selections)),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(user: User, status: event_attendee_status_enum? = nil, team: Team? = nil) {
    self.init(unsafeResultMap: ["__typename": "event_attendees", "user": user.resultMap, "status": status, "team": team.flatMap { (value: Team) -> ResultMap in value.resultMap }])
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

    public init(id: String, firstName: String, lastName: String, username: String, photoUrl: String? = nil, college: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "users", "id": id, "firstName": firstName, "lastName": lastName, "username": username, "photoUrl": photoUrl, "college": college])
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
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: String, firstName: String, lastName: String, username: String, photoUrl: String? = nil, college: String? = nil) {
    self.init(unsafeResultMap: ["__typename": "users", "id": id, "firstName": firstName, "lastName": lastName, "username": username, "photoUrl": photoUrl, "college": college])
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
}
