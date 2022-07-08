import 'package:api_error_handler_demo/sample_dio_service.dart';
import 'package:rxdart/subjects.dart';

class HomeBloc {
  final _service = SampleDioService();

  final _items = BehaviorSubject<List<String>>.seeded([]);

  Stream<List<String>> get observeItem => _items.stream;

  HomeBloc() {
    _items.addStream(_service.getItems());
  }
}
