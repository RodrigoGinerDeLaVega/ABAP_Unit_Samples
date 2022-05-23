*"* use this source file for your ABAP unit test classes
CLASS ltcl_abap_unit_depen_param DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      doc_type_01 FOR TESTING,
      doc_type_02 FOR TESTING,
      doc_type_04 FOR TESTING.

    DATA mo_cut TYPE REF TO ycl_abap_unit_depen_param.
ENDCLASS.


CLASS ltcl_abap_unit_depen_param IMPLEMENTATION.

  METHOD doc_type_01.
    "Given
    DATA(lo_test_double) = NEW ltd_doc_type_01( ).

    mo_cut = NEW #( iv_doc  = '9999'
                    iv_year = '9999' ).
    "When
    DATA(lv_valid) = mo_cut->is_valid_doc( io_dao  = lo_test_double ).

    "Then
    cl_abap_unit_assert=>assert_equals( EXPORTING exp = abap_true
                                                  act = lv_valid
                                                  msg = '01 should be valid' ).
  ENDMETHOD.

  METHOD doc_type_02.
    "Given
    DATA(lo_test_double) = NEW ltd_doc_type_02( ).

    mo_cut = NEW #( iv_doc  = '9999'
                    iv_year = '9999' ).
    "When
    DATA(lv_valid) = mo_cut->is_valid_doc( io_dao  = lo_test_double ).

    "Then
    cl_abap_unit_assert=>assert_equals( EXPORTING exp = abap_true
                                                  act = lv_valid
                                                  msg = '02 should be valid' ).
  ENDMETHOD.

  METHOD doc_type_04.
    "Given
    DATA(lo_test_double) = NEW ltd_doc_type_04( ).

    mo_cut = NEW #( iv_doc  = '9999'
                    iv_year = '9999' ).
    "When
    DATA(lv_valid) = mo_cut->is_valid_doc( io_dao  = lo_test_double ).

    "Then
    cl_abap_unit_assert=>assert_equals( EXPORTING exp = abap_false
                                                  act = lv_valid
                                                  msg = '04 should be invalid' ).

  ENDMETHOD.
ENDCLASS.
