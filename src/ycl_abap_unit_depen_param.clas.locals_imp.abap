*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

CLASS ltd_doc_type_01 DEFINITION.
  PUBLIC SECTION.
    INTERFACES: yif_abap_unit_dependency_dao.
ENDCLASS.

CLASS ltd_doc_type_01 IMPLEMENTATION.
  METHOD yif_abap_unit_dependency_dao~get_owner_request_header.
    rs_header-doc_type = '01'.
  ENDMETHOD.
ENDCLASS.

CLASS ltd_doc_type_02 DEFINITION.
  PUBLIC SECTION.
    INTERFACES: yif_abap_unit_dependency_dao.
ENDCLASS.

CLASS ltd_doc_type_02 IMPLEMENTATION.
  METHOD yif_abap_unit_dependency_dao~get_owner_request_header.
    rs_header-doc_type = '02'.
  ENDMETHOD.
ENDCLASS.

CLASS ltd_doc_type_04 DEFINITION.
  PUBLIC SECTION.
    INTERFACES: yif_abap_unit_dependency_dao.
ENDCLASS.

CLASS ltd_doc_type_04 IMPLEMENTATION.
  METHOD yif_abap_unit_dependency_dao~get_owner_request_header.
    rs_header-doc_type = '04'.
  ENDMETHOD.
ENDCLASS.
