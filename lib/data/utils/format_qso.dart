String formatQSODate(String date) =>
    '${date.substring(0, 4)}-${date.substring(4, 6)}-${date.substring(6, 8)}';

String formatQSOTime(String time) =>
    '${time.substring(0, 2)}:${time.substring(2, 4)}${time.length > 4 ? time.substring(4, 6) : ''}';
