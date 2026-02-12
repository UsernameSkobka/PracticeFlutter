import 'package:dio/dio.dart';
import 'package:flutter_application_8/album_model.dart';
import 'package:retrofit/retrofit.dart';
part 'rest_album_provider.g.dart';
@RestApi(baseUrl: "https://jsonplaceholder.typicode.com/posts")
abstract class RestAlbumProvider {
  factory RestAlbumProvider(Dio dio, {String baseUrl}) = _RestAlbumProvider;
  @GET("")
  Future<List<AlbumModel>> fetchAlbums();
  @POST("")
  Future<HttpResponse<void>> createAlbum(@Body() AlbumModel album);
}