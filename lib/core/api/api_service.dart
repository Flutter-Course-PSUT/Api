import 'package:api/core/constant/api_constant.dart';
import 'package:api/core/constant/endpoint.dart';
import 'package:api/core/model/login/request_login.dart';
import 'package:api/core/model/login/response_login.dart';
import 'package:api/core/model/update_user/request_update_user.dart';
import 'package:api/core/model/user/response_user.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstant.apiconstant)
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;

  @GET(Endpoint.getUser)
  Future<List<ResponseUser>> getUser();

  @GET(Endpoint.userById)
  Future<ResponseUser> getUserById({@Path('id') required String id});

  @DELETE(Endpoint.userById)
  Future<bool> deleteUser({@Path('id') required String id});

  @POST(Endpoint.login)
  Future<ResponseLogin> login({@Body() required RequestLogin requestLogin});

  @PUT(Endpoint.userById)
  Future<bool> updateUser({
    @Body() required RequestUpdateUser requestUpdateUser,
  });
}
