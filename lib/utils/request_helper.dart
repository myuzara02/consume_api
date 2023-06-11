class RequestHelper {
  static Map<String, String> basicHeader() {
    return {
      "accept": "application/json",
      "content-type": "application/json",
    };
  }
}