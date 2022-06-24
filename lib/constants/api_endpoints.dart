class APIEndpoint {
  APIEndpoint._();

  // Base URL
  static const String backendURL = "http://localhost:8000";
  static const String baseURL = "http://localhost:8000/api";

  // auth
  static const String login = "/login";
  static const String register = "/register";

  // Messages
  static const String postMessage = "/message/send";
  static const String getMessages = "/messages/all";
}
