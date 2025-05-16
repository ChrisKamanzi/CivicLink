String categorizeComplaint(String complaintText) {
  Map<String, String> categoryRules = {
    "agriculture": "MINAGRI",
    "farming": "MINAGRI",
    "livestock": "MINAGRI",
    "irrigation": "MINAGRI",
    "Fertilizers ": "MINAGRI",

    "schools": "MINEDUC",
    "teachers": "MINEDUC",
    "exams": "MINEDUC",
    "Tvet": "MINEDUC",
    "e-Learning": "MINEDUC",

    "diplomacy": "MINAFET",
    "Embassies": "MINAFET",
    "consular services": "MINAFET",
    "passport": "MINAFET",
    "Embassies": "MINAFET",

  };

  for (var entry in categoryRules.entries) {
    if (complaintText.toLowerCase().contains(entry.key)) {
      return entry.value;
    }
  }

  return "General Complaints Office";
}
