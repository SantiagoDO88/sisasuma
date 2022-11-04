class PrettyStrings {
  static String getPrettyName(String name) {
    final words = name.split(" ");
    return "${words[2]} ${words[0]}";
  }

  static String getPrettyDate(DateTime date) {
    return "${date.day} de ${getMonth(date.month)} de ${date.year}";
  }

  static String getMonth(int month) {
    Map<int, String> months = {
      1: "Enero",
      2: "Febrero",
      3: "Marzo",
      4: "Abril",
      5: "Mayo",
      6: "Junio",
      7: "Julio",
      8: "Agosto",
      9: "Septiembre",
      10: "Octubre",
      11: "Noviembre",
      12: "Diciembre",
    };

    return months[month]!;
  }
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}
