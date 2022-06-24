import 'package:arishti_chatroom/models/user_model.dart';
import 'package:mobx/mobx.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  @observable
  User? _currentUser;

  @observable
  bool _isLoggedIn = false;

  User? get currentUser => _currentUser;
  bool get isLoggedIn => _isLoggedIn;

  _UserStore() {
    _isLoggedIn = false;
  }

  @action
  login(User user) {
    _currentUser = user;
    _isLoggedIn = true;
  }

  @action
  logout() {
    _currentUser = null;
    _isLoggedIn = false;
  }
}
