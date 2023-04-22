import 'package:codigo6_states/bloc/posts/post_event.dart';
import 'package:codigo6_states/bloc/posts/post_state.dart';
import 'package:codigo6_states/services/remote/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitState()) {
    //PostInitState es el estado inicial
    ApiService apiService = ApiService();
    on<GetPostEvent>((event, emit) async {
      print("Evento 1");
      emit(PostLoadingState());
      List posts = await apiService.getPosts();
      emit(PostSuccedState(data: posts));
      print(posts);
    });
    // on<Event2>((event, emit) {
    //   print("Evento 2");
    //   print(event);
    //   print(emit);
    //   //Se emiten las clases hijas
    //   emit(PostLoadingState());
    // });
    // on<Event3>((event, emit) {
    //   print("Evento 3");
    //   emit(PostErrorState());
    // });
    // on<Event4>((event, emit) {
    //   print("Evento 4");
    //   emit(PostSuccedState());
    // });
    // on<Event5>((event, emit) {
    //   print("Evento 5");
    // });
  }
}
