import '../constant/type_def.dart';

class ApiVariables {
  static const String _scheme = "https";
  static const String _host = "api-cashlock.lve-co.com";

  static Uri _mainUri({required String path, QueryParams? queryParam}) {
    Uri uri = Uri(
        scheme: _scheme,
        host: _host,
        path: "api/$path",
        queryParameters: queryParam);
    return uri;
  }

  static Uri _adminUri({required String path}) {
    return _mainUri(path: "admin/$path");
  }

  static Uri _auth({required String path, QueryParams? queryParam}) {
    return _mainUri(path: "auth/admin/1/$path", queryParam: queryParam);
  }

  static Uri _resturant({required String path, QueryParams? queryParam}) {
    return _mainUri(path: "dashboard/resturant/$path", queryParam: queryParam);
  }

  static Uri indexResturants({ QueryParams? queryParam}) {
    return _resturant(path: "index",queryParam: queryParam);
  }
  static Uri activeIndexResturants({ int? resturantId}) {
    return _resturant(path: "$resturantId/activeresturant");
  }
  static Uri unActiveIndexResturants({ int? resturantId}) {
    return _resturant(path: "$resturantId/unactiveresturant");
  }
   static Uri createResturant() {
    return _resturant(path: "store");
  }
   static Uri updateResturants({int? resturantId }) {
    return _resturant(path: "$resturantId/update");
  }
   
   static Uri uploadImage() {
    return _mainUri(path: "mediaUpload");
  }
  static Uri login() => _auth(path: "login");
  static Uri logout() => _auth(path: "logout");
}
