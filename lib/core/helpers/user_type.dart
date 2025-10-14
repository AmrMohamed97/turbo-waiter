class UserType {
  static UserType? _instance;
  // Avoid self instance
  UserType._();
  static UserType get instance => _instance ??= UserType._();

  bool userLogged = false;
  void setUserLogged(bool val) {
    userLogged = val;
  }

 void  logOut() {
    userLogged = false;
  }

  static   String convertDate(String? date, {bool isArabic = false}) {
    if (date == null || date.isEmpty) return '';
    try {
      // Parse the ISO date string
      DateTime dateTime = DateTime.parse(date);

      // Get day and month
      int day = dateTime.day;
      int month = dateTime.month;

      // Get month name based on language
      String monthName = isArabic
          ? _monthsArabic[month - 1]
          : _monthsEnglish[month - 1];

      return '$day $monthName';
    } catch (e) {
      return '';
    }
  }

    static const List<String> _monthsEnglish = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  // Arabic month names
  static const List<String> _monthsArabic = [
    'يناير',
    'فبراير',
    'مارس',
    'أبريل',
    'مايو',
    'يونيو',
    'يوليو',
    'أغسطس',
    'سبتمبر',
    'أكتوبر',
    'نوفمبر',
    'ديسمبر',
  ];

}


