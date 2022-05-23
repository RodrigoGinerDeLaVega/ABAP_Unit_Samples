CLASS ycl_abap_unit_dependency_dao DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: yif_abap_unit_dependency_dao.
ENDCLASS.



CLASS ycl_abap_unit_dependency_dao IMPLEMENTATION.
  METHOD yif_abap_unit_dependency_dao~get_owner_request_header.
    DATA: ls_doc_header TYPE oiuow_dtch,
          lt_doc_items  TYPE TABLE OF oiuow_dtcs,
          lt_doc_detail TYPE TABLE OF oiuow_dtd.

    CALL FUNCTION 'OIUOW_READ_OWNER_REQUEST'
      EXPORTING
        doc_no               = iv_doc
        doc_year             = iv_year
        with_data            = 'X'
      IMPORTING
        e_dtch               = ls_doc_header
      TABLES
        e_dtd                = lt_doc_detail
        e_dtcs               = lt_doc_items
      EXCEPTIONS
        doc_no_not_entered   = 1
        doc_year_not_entered = 2
        invalid_document     = 3
        OTHERS               = 4.

    rs_header = ls_doc_header.
  ENDMETHOD.
ENDCLASS.
