CLASS ycl_abap_unit_depen_backdoor DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA m_doc  TYPE oiuow_dtch-doc_no.
    DATA m_year TYPE oiuow_dtch-doc_year.

    METHODS:
      constructor IMPORTING iv_doc TYPE oiuow_dtch-doc_no
                            iv_year TYPE oiuow_dtch-doc_year,
      is_valid_doc RETURNING VALUE(rv_valid) TYPE boolean.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA mo_dao TYPE REF TO YIF_ABAP_UNIT_DEPENDENCY_DAO.
ENDCLASS.

CLASS ycl_abap_unit_depen_backdoor IMPLEMENTATION.
  METHOD constructor.
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
