class HistoryService {
  Map historyMap = new Map();

  CheckDates({String year, String month, String day}) {
    if (historyMap[year] != null) {
      if (historyMap[year].Months[month] != null) {
        if (historyMap[year].Months[month].Days[day] =! null) {

        }
      }
    }
  }
}