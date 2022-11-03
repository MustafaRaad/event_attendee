class URLPaths {
  static String BASE_URL = 'https://event.leftsphere.com/back/';
  static String LOGIN_URL = BASE_URL + 'api/login';
  static String SENDRECIPE = BASE_URL + 'api/ReciptEndPoint/RecipetInfo';
  static String RECIPETLIST = BASE_URL + 'api/ReciptEndPoint/GetRecipetsList';
  static String GROUPEDRECIPETLIST =
      BASE_URL + 'api/ReciptEndPoint/GetGroupedRecipetsList';

  static String RECIPETSTATS =
      BASE_URL + 'api/ReciptEndPoint/GetReceiptsStatistics';
  static String USERINFO = BASE_URL + 'api/SASUsers/GetProfile';
  static String CHECKLOGIN =
      BASE_URL + 'api/identity/Account/CheckIfUserLoggedIn';

  static String NOTIFYLIST =
      BASE_URL + 'api/NotificationEndPoint/GetNotificationList';
  static String SASUSERS = BASE_URL + 'api/SASUsers/Index';
  static String SASACTIVATION = BASE_URL + 'api/SASUsers/GetActivation';
  static String GETCOMMENTTYPE =
      BASE_URL + 'api/ReciptEndPoint/GetCommentsType';
  static String GETRECEIPTTYPE =
      BASE_URL + 'api/ReciptEndPoint/GetReceiptsType';
  static String GETPROFILELIST = BASE_URL + 'api/Profiles/GetProfileList';

  static String GETPAYMENTLIST = BASE_URL + 'api/GSMPayment/GetGSMPaymentsList';
  static String SENDPAYMENT = BASE_URL + 'api/GSMPayment/PostGSMInfo';
  static String COLLECTORLIST =
      BASE_URL + 'api/GSMPayment/GetGSMCollectorsList';
}
