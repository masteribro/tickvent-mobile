/// Default base url for the current MFB implementation
const String kApiBaseUrl = "https://staging.tickvent.ng/api/v1";
// "https://staging-regent-mfb.moneta.ng/api/v1/";

/// Default access keys for JSON objects returned from the backend
const String dataKey = "data";
const String errorKey = "error";
const String errors = "errors";
const String userDetailsKey = "user details";
const String messageKey = "message";

///TODO: change this later
const String errorMessage =
    "Failed to connect to server. Kindly try again later.";
const String defaultAccountErrorMessage =
    "Something went wrong, Cross check your Account Number";

/// Api Status Codes
const int kDefaultSuccessCode = 200;
const int kDefaultSuccessCreatedCode = 201;
const int kStatusUnAuthorized = 401;
const int kStatusNetworkProblem = 500;
const List<String> kStatusSuccessResponse = ["00", "200" "201"];
const String kStatusOperationFailed = "100";
const String kStatusOtherErrors = "101";

/// Internal Error Codes
const String kStatusDataInvalid = "102";
const String kStatusConnectingToServerError = "400";
const String kStatusNetworkError = "500";
const String kStatusWhileProcessingErrors = "412";
const int kStatusTimeout = 504;
const int kStatusUnreachable = 600;
const int kStatusError = 999;

/// USABLE
const String regentBankCode = "090125";
