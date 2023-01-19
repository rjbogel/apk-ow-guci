class BaseApi {
  String _getApiHost() {
    return 'https://frost.skom.id/';
  }

  String _getAuthHost() {
    return _getApiHost();
  }

  String getRestUrl() {
    return '${_getApiHost()}api/guci/';
  }

  String getApiUrl() {
    return '${_getApiHost()}api/guci/v2/';
  }

  String getAuthUrl() {
    return '${_getAuthHost()}jwt/';
  }

  String getFileUrl() {
    return '${_getAuthHost()}files/image/guci/';
  }
}
