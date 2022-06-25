class APIEndpoint {
  APIEndpoint._();

  // Base URL
  static const String backendURL = String.fromEnvironment(
    "BACKEND_URL",
    defaultValue: "http://localhost:8000",
  );
  static const String baseURL = "$backendURL/api";

  // auth
  static const String login = "/login";
  static const String register = "/register";

  // Messages
  static const String postMessage = "/message/send";
  static const String getMessages = "/messages/all";
}
