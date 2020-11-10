class Event {
  String description;
  String type;
  String date;
  String time;

  Event(String thisDescription, String thisType, String thisDate, String thisTime) {
    description = thisDescription;
    type = thisType;
    date = thisDate;
    time = thisTime;
  }
}

class PendingRequestsModel{
  String type;
  String event;
  String description;
  String date;
  String location;
  String email;

  PendingRequestsModel( String thisType, String thisEvent, String thisDescription, String thisDate, String thisLocation, String thisEmail) {
    type = thisType;
    event = thisEvent;
    description = thisDescription;
    date = thisDate;
    location = thisLocation;
    email = thisEmail;
  }
}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}

class ChatModel{
  String name;
  String text;
  String time;
  String gender;

  ChatModel( String thisName, String thisText, String thisTime, String thisGender) {
    name = thisName;
    text = thisText;
    time = thisTime;
    gender = thisGender;
  }
}


class RequestModel{
  String name;
  String number;
  String gender;

  RequestModel( String thisName, String thisNumber,  String thisGender) {
    name = thisName;
    number = thisNumber;
    gender = thisGender;
  }
}

class ShopDetails {
  String name;
  String number;
  String address;
  String owner;
  int stars;
  String image;
  ShopDetails(String thisName, String thisNumber, String thisAddress,
      String thisOwner, int thisStars, String thisImage) {
    name = thisName;
    number = thisNumber;
    address = thisAddress;
    owner = thisOwner;
    stars = thisStars;
    image = thisImage;
  }
}
