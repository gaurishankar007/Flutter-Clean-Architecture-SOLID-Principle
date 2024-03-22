String get baseUrl => "";

// /// <===== Assets =====>
String get publicUrl => "$baseUrl/public";
// String get profileUrl => "$publicUrl/profiles";

/// <===== End Points =====>
String get apiUrl => "$baseUrl/api";
String get authUrl => "$apiUrl/auth";

/// Auth
String get signInUrl => "$authUrl/login";
String get signUpUrl => "$authUrl/register";
