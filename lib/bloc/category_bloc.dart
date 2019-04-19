import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:personal_budget/bloc/blocs.dart';
import 'package:personal_budget/models/category.dart';
import 'package:personal_budget/data/category_repository.dart';

/// CategoryBloc
class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  /// CategoryRepository
  final CategoryRepository categoryRepository;

  /// CategoryBloc constructor
  CategoryBloc({@required this.categoryRepository});

  @override
  CategoryState get initialState => CategoryEmpty();

  @override
  Stream<CategoryState> mapEventToState(
      CategoryState currentState, CategoryEvent event) async* {
    if (event is FetchCategory) {
      yield CategoryLoading();
      try {
        final categories = await categoryRepository.getCategories();
            
        yield CategoryLoaded(categories: categories);
      } on Exception catch (e) {
        print(e.toString());
        yield CategoryError();
      }
    }
    if (event is AddCategory) {
      yield CategoryLoading();
      try {
        final category = await categoryRepository.addCategory(event.category);
        yield CategorySaved(category: category);
      } on Exception catch (e) {
        print(e.toString());
        yield CategoryError();
      }
    }
    if (event is UpdateCategory) {
      yield CategoryLoading();
      try {
        final category =
            await categoryRepository.updateCategory(event.category);
        yield CategorySaved(category: category);
      } on Exception catch (e) {
        print(e.toString());
        yield CategoryError();
      }
    }
    if (event is DeleteCategory) {
      yield CategoryLoading();
      try {
        final category =
            await categoryRepository.deleteCategory(event.category);
        yield CategoryDeleted(category: category);
      } on Exception catch (e) {
        print(e.toString());
        yield CategoryError();
      }
    }
  }
}
