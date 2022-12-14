class NetworkConfiguration {
  NetworkConfiguration._privateConstructor();
  static final NetworkConfiguration _instance =
      NetworkConfiguration._privateConstructor();
  factory NetworkConfiguration() => _instance;

  String address = 'http://185.119.58.234:5050';
  Map controllersMap = {
    'client': '/controllers/client',
    'order': "/controllers/order",
    'active_orders': '/controllers/active_orders_by_user_id',
    'history_orders': '/controllers/history_orders_by_user_id',
    'coffes': "/controllers/coffes",
    'coffe': "/controllers/coffe",
    'coffehouse': "/controllers/coffehouse",
    'upload_file': "/upload_file",
    'auth': '/security/auth',
    'coffe_get': '/coffehouse/get_coffe',
    'coffe_delete': '/coffehouse/delete_coffe',
  };
}
