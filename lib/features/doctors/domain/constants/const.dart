List<String> Docfields1 = [
  "Middle Name",
  "Phone Number",
  "Section",
  "Description",

];
List<String> Docfields2({
  required bool isEditing}) {
  return
    [
      "Session durtion",
      "Days in advance",
      if(isEditing)"Working Hour"
  ];
}

Map<String, dynamic> Work_Days = {
  "monday": [],
  "tuesday": [],
  "wednesday": [],
  "thursday": [],
  "friday": [],
  "saturday": [],
  "sunday": [],
};



