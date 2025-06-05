class EventModel {
  final String eventId;
  final String eventName;
  final String eventNameRaw;
  final String ownerId;
  final String thumbUrl;
  final String thumbUrlLarge;
  final int startTime;
  final String startTimeDisplay;
  final int endTime;
  final String endTimeDisplay;
  final String location;
  final Venue venue;
  final String label;
  final int featured;
  final String eventUrl;
  final String shareUrl;
  final String bannerUrl;
  final double score;
  final List<String> categories;
  final List<String> tags;
  final Tickets tickets;
  final List<dynamic> customParams;

  EventModel({
    required this.eventId,
    required this.eventName,
    required this.eventNameRaw,
    required this.ownerId,
    required this.thumbUrl,
    required this.thumbUrlLarge,
    required this.startTime,
    required this.startTimeDisplay,
    required this.endTime,
    required this.endTimeDisplay,
    required this.location,
    required this.venue,
    required this.label,
    required this.featured,
    required this.eventUrl,
    required this.shareUrl,
    required this.bannerUrl,
    required this.score,
    required this.categories,
    required this.tags,
    required this.tickets,
    required this.customParams,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      eventId: json['event_id'],
      eventName: json['eventname'],
      eventNameRaw: json['eventname_raw'],
      ownerId: json['owner_id'],
      thumbUrl: json['thumb_url'],
      thumbUrlLarge: json['thumb_url_large'],
      startTime: json['start_time'],
      startTimeDisplay: json['start_time_display'],
      endTime: json['end_time'],
      endTimeDisplay: json['end_time_display'],
      location: json['location'],
      venue: Venue.fromJson(json['venue']),
      label: json['label'],
      featured: json['featured'],
      eventUrl: json['event_url'],
      shareUrl: json['share_url'],
      bannerUrl: json['banner_url'],
      score: (json['score'] as num).toDouble(),
      categories: List<String>.from(json['categories']),
      tags: List<String>.from(json['tags']),
      tickets: Tickets.fromJson(json['tickets']),
      customParams: json['custom_params'] ?? [],
    );
  }
}

class Venue {
  final String street;
  final String city;
  final String state;
  final String country;
  final double latitude;
  final double longitude;
  final String fullAddress;

  Venue({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.latitude,
    required this.longitude,
    required this.fullAddress,
  });

  factory Venue.fromJson(Map<String, dynamic> json) {
    return Venue(
      street: json['street'],
      city: json['city'],
      state: json['state'],
      country: json['country'],
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      fullAddress: json['full_address'],
    );
  }
}

class Tickets {
  final bool hasTickets;
  final String ticketUrl;

  Tickets({required this.hasTickets, required this.ticketUrl});

  factory Tickets.fromJson(Map<String, dynamic> json) {
    return Tickets(
      hasTickets: json['has_tickets'],
      ticketUrl: json['ticket_url'],
    );
  }
}
