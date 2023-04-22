import 'package:flutter/cupertino.dart';

abstract class PostState {}

class PostInitState extends PostState {}

class PostLoadingState extends PostState {}

class PostErrorState extends PostState {}

class PostSuccedState extends PostState {
  final List data;
  PostSuccedState({required this.data});
}
