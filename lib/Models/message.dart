class Message {
  String message, myID, destinationId;
  Message({
    required this.destinationId,
    required this.message,
    required this.myID,
  });
   factory Message.fromJson(jsonData) {
    return Message(
      message: jsonData['message'],
      myID: jsonData['myID'],
      destinationId: jsonData['destinationId'],
    );
  }
}