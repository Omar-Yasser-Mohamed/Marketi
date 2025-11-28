import 'package:injectable/injectable.dart';
import 'package:marketi/features/home/domain/repos/home_repo.dart';

@LazySingleton(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {}
