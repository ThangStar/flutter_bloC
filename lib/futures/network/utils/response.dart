class Success {
  String body;
  int statusCode;

  Success({required this.body, this.statusCode = 201});
}

class Failure {
  String body;
  int statusCode;

  Failure({required this.body, this.statusCode = 101});
}
