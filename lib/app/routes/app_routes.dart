part of './app_pages.dart';

abstract class Routes{
  static const HOME = '/';
  static const LOGIN = '/login';
  static const PRINCIPAL = '/dashboard/:url_0';
  static const PRINCIPAL2 = '/dashboard/:url_0/:url_1';
  static const REGISTRO = '/registro_negocio';
  static const REESTABLECER = '/reestablecer';
  static const SEDE = '/dashboard/administrar_negocio/sede';
}