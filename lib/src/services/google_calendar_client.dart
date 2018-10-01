part of gamendar;

class GoogleCalendarClient {

  static CalendarApi api;
  String _gameTimeCalendarId;
  static const String _GAMENDAR_CALENDAR_NAME = 'Gamendar - Release Dates';

  static final GoogleCalendarClient _singleton = new GoogleCalendarClient._internal();
  factory GoogleCalendarClient() {
    return _singleton;
  }

  GoogleCalendarClient._internal();

  init(GoogleSignInAccount gsa) async {
    final authHeaders = await gsa.authHeaders;
    final httpClient = new GoogleHttpClient(authHeaders);
    api = new CalendarApi(httpClient);
  }

  logout() {
    api = null;
  }

  Future<String> _getCalendarId() async {
    if (_gameTimeCalendarId != null) {
      return _gameTimeCalendarId;
    }

    CalendarList list = await api.calendarList.list();
    if (list.items.any((e) => e.summary == _GAMENDAR_CALENDAR_NAME)) {
      _gameTimeCalendarId = list.items.firstWhere((e) => e.summary == _GAMENDAR_CALENDAR_NAME).id;
      return _gameTimeCalendarId;
    }

    Calendar calendar = new Calendar();
    calendar.summary = _GAMENDAR_CALENDAR_NAME;
    Calendar newCalendar = await api.calendars.insert(calendar);

    return newCalendar.id;
  }

  Future<Event> createEvent(String title, DateTime date, String platform) async {
    debugPrint('$title - $date');

    String calendarId = await _getCalendarId();
    if (calendarId == null) {
      debugPrint('calendarid was null');
      return null;
    }

    Event event = new Event();
    event.summary = '$title released on $platform';
    EventDateTime start = new EventDateTime();
    start.date = date;
    EventDateTime end = new EventDateTime();
    end.date = date.add(new Duration(days: 1));
    event.start = start;
    event.end = end;
    var createdEvent = await api.events.insert(event, calendarId);
    debugPrint(createdEvent.htmlLink);

    return createdEvent;
  }
}
