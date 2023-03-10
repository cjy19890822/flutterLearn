import 'package:test01/httpUtils/request_config.dart';
import 'package:test01/httpUtils/ApiException.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:test01/httpUtils/loading.dart';


Future request(Function() block,  {bool showLoading = true, bool Function(ApiException)? onError, }) async{
  try {
    await loading(block, isShowLoading:  showLoading);
  } catch (e) {
    handleException(ApiException.from(e), onError: onError);
  }
  return;
}

bool handleException(ApiException exception, {bool Function(ApiException)? onError}){

  if(onError?.call(exception) == true){
    return true;
  }

  if(exception.code == 401 ){
    ///todo to login
    return true;
  }
  EasyLoading.showError(exception.message ?? ApiException.unknownException);

  return false;
}