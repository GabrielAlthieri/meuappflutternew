import 'dart:convert';

import 'package:meuapp/core/constants.dart';
import 'package:meuapp/model/feriado_model.dart';
import 'package:http/http.dart' as http;

class FeriadoRepository {
  final Uri url = Uri.parse("$urlBaseApi/feriados");

  Future<List<FeriadoEntity>> getAll() async {
    List<FeriadoEntity> courseList = [];

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      for (var course in json) {
        courseList.add(FeriadoEntity.fromJson(course));
      }
    }
    return courseList;
  }
/*
  postNewCourse(FeriadoEntity FeriadoEntity) async {
    final json = jsonEncode(FeriadoEntity.toJson(FeriadoEntity));
    var response = await http.post(url, body: json);
    if (response.statusCode != 201) {
      throw "Problemas ao inserir seus dados";
    }
  }

  deleteCourse(String id) async {
    final url = '$urlBaseApi/courses/$id';
    var response = await http.delete(Uri.parse(url));
    if (response.statusCode != 200) {
      throw 'Problemas ao excluir seus dados';
    }
  }

  putUpdateCourse(FeriadoEntity FeriadoEntity) async {
    final url = '$urlBaseApi/courses/${FeriadoEntity.id}';
    final json = jsonEncode(FeriadoEntity.toJson(FeriadoEntity));
    var response = await http.put(Uri.parse(url), body: json);
    if (response.statusCode != 200) {
      throw 'Problemas ao atualizar seus dados';
    }
  } */
}
