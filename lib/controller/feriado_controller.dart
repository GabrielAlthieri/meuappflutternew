import 'package:meuapp/model/feriado_model.dart';
import 'package:meuapp/model/feriado_repository.dart';
import 'package:intl/intl.dart';

class FeriadoController {
  FeriadoRepository repository = FeriadoRepository();

  Future<List<FeriadoEntity>> getCourses() async {
    List<FeriadoEntity> list = [];
    list = await repository.getAll();
    //poderia aqui filtrar, formatar, regras
    return list;
  }
/*
  postNewCourse(FeriadoEntity courseEntity) async {
    try {
      await repository.postNewCourse(courseEntity);
    } catch (e) {
      rethrow;
    }
  }

  deleteCourse(String id) async {
    try {
      await repository.deleteCourse(id);
    } catch (e) {
      rethrow;
    }
  }

  putUpdateCourse(FeriadoEntity courseEntity) async {
    try {
      await repository.putUpdateCourse(courseEntity);
    } catch (e) {
      rethrow;
    }
  }

  dateTimeFormatToStringPtBr(DateTime date) {
    var outputFormat = DateFormat('dd/MM/yyyy');
    return outputFormat.format(date);
  }*/

  ptBrDateStringToApiFormat(String date) {
    //12/08/2024
    String year = date.substring(6, 10);
    String month = date.substring(3, 5);
    String day = date.substring(0, 2);

    return '$year-$month-${day}T00:00:00.000Z';

    //2024-08-12T00:00:00.000Z
  }
}
