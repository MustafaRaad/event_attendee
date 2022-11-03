class BaseAPI{
    static String base = "https://event.leftsphere.com/back"; 
    static var api = base + "/api/v1";
    var customersPath = api + "/customers";
    var authPath = api + "/auth"; 
   // more routes
   Map<String,String> headers = {                           
       "Content-Type": "application/json; charset=UTF-8" };       
                                      
}
