import 'package:flutter/foundation.dart';

import '../constants/enums/view_state.dart';

class BaseViewModel extends ChangeNotifier {
  // Data:
  ViewState _state = ViewState.idle;
  String _errorMessage = '';

  // Getters:
  ViewState get state => _state;
  String get errorMessage => _errorMessage;

  // Setters:
  set state(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  set errorMessage(String message) {
    _errorMessage = message;
    notifyListeners();
  }
}
