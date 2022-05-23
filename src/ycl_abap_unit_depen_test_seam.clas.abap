CLASS ycl_abap_unit_depen_test_seam DEFINITION
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
ENDCLASS.

CLASS ycl_abap_unit_depen_test_seam IMPLEMENTATION.
  METHOD constructor.
    m_doc   = iv_doc.
    m_year  = iv_year.
  ENDMETHOD.

  METHOD is_valid_doc.
    rv_valid = abap_false.

    TEST-SEAM doc_type.
      DATA: ls_doc_header TYPE oiuow_dtch,
            lt_doc_items  TYPE TABLE OF oiuow_dtcs,
            lt_doc_detail TYPE TABLE OF oiuow_dtd.

      CALL FUNCTION 'OIUOW_READ_OWNER_REQUEST'
        EXPORTING
          doc_no               = m_doc
          doc_year             = m_year
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

      ls_doc_header = ls_doc_header.
    END-TEST-SEAM.

    IF ls_doc_header-doc_type = '01' OR "Transfer with Funds
       ls_doc_header-doc_type = '02'.  "Transfer without Funds.
      rv_valid = abap_true.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
