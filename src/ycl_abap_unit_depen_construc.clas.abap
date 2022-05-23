CLASS ycl_abap_unit_depen_construc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA m_doc  TYPE oiuow_dtch-doc_no.
    DATA m_year TYPE oiuow_dtch-doc_year.
    DATA mo_dao TYPE REF TO YIF_ABAP_UNIT_DEPENDENCY_DAO.

    METHODS:
      constructor IMPORTING iv_doc TYPE oiuow_dtch-doc_no
                            iv_year TYPE oiuow_dtch-doc_year
                            io_dao TYPE REF TO YIF_ABAP_UNIT_DEPENDENCY_DAO OPTIONAL,

      is_valid_doc RETURNING VALUE(rv_valid) TYPE boolean.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS ycl_abap_unit_depen_construc IMPLEMENTATION.
  METHOD constructor.
    "Constructor Injection
    IF io_dao IS SUPPLIED.
      mo_dao = io_dao. "Test Double
    ELSE.
      mo_dao = NEW YCL_ABAP_UNIT_DEPENDENCY_DAO( ). "Production Code
    ENDIF.

    m_doc   = iv_doc.
    m_year  = iv_year.
  ENDMETHOD.

  METHOD is_valid_doc.
    DATA(header) = mo_dao->get_owner_request_header( iv_doc  = m_doc
                                                     iv_year = m_year  ).

    rv_valid = abap_false.
    IF header-doc_type = '01' OR "Transfer with Funds
       header-doc_type = '02'.  "Transfer without Funds.
      rv_valid = abap_true.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
