import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:personal_budget/bloc/blocs.dart';
import 'package:personal_budget/models/category.dart';
import 'package:personal_budget/data/category_repository.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository categoryRepository;

  CategoryBloc({@required this.categoryRepository});

  @override
  CategoryState get initialState => CategoryEmpty();

  @override
  Stream<CategoryState> mapEventToState(
      CategoryState currentState, CategoryEvent event) async* {
    if (event is FetchCategory) {
      yield CategoryLoading();
      try {
        final List<Map> categoriesMap =
            await categoryRepository.getCategories();
        final List<Category> categories =
            categoriesMap.map((item) => Category.fromJson(item)).toList();
        yield CategoryLoaded(categories: categories);
      } catch (e) {
        print(e.toString());
        yield CategoryError();
      }
    }
    if (event is AddCategory) {
      yield CategoryLoading();
      try {
        final category = categoryRepository.addCategory(event.category);
        yield CategorySaved(category: category);
      } catch (e) {
        yield CategoryError();
      }
    }
    if (event is UpdateCategory) {
      yield CategoryLoading();
      try {
        final category = categoryRepository.updateCategory(event.category);
        yield CategorySaved(category: category);
      } catch (e) {
        yield CategoryError();
      }
    }
    if (event is DeleteCategory) {
      yield CategoryLoading();
      try {
        final category = categoryRepository.deleteCategory(event.category);
        yield CategoryDeleted(category: category);
      } catch (e) {
        yield CategoryError();
      }
    }
  }
}
