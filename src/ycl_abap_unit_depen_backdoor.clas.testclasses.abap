*"* use this source file for your ABAP unit test classes
CLASS ltcl_abap_unit_depen_backdoor DEFINITION DEFERRED.
CLASS ycl_abap_unit_depen_backdoor DEFINITION
  LOCAL FRIENDS ltcl_abap_unit_depen_backdoor.

CLASS ltcl_abap_unit_depen_backdoor DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      doc_type_01 FOR TESTING,
      doc_type_02 FOR TESTING,
      doc_type_04 FOR TESTING.

    DATA mo_cut TYPE REF TO ycl_abap_unit_depen_backdoor.
ENDCLASS.


CLASS ltcl_abap_unit_depen_backdoor IMPLEMENTATION.

  METHOD doc_type_01.
    "Given
    DATA(lo_test_double) = NEW ltd_doc_type_01( ).

    mo_cut = NEW #( iv_doc  = '9999'
                    iv_year = '9999' ).

    mo_cut->mo_dao = lo_test_double.

    "When
    DATA(lv_valid) = mo_cut->is_valid_doc( ).

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

    mo_cut->mo_dao = lo_test_double.
    "When
    DATA(lv_valid) = mo_cut->is_valid_doc( ).

    "Then
    cl_abap_unit_assert=>assert_equals( EXPORTING exp = abap_true
                                                  act = lv_valid
                                                  msg = '02 should be valid' ).
  ENDMETHOD.

  METHOD doc_type_04.
    DATA lv_valid TYPE BOOLEAN VALUE abap_true.
    "Given
    DATA(lo_test_double) = NEW ltd_doc_type_04( ).

    mo_cut = NEW #( iv_doc  = '9999'
                    iv_year = '9999' ).

    mo_cut->mo_dao = lo_test_double.

    "When
    lv_valid = mo_cut->is_valid_doc( ).

    "Then
    cl_abap_unit_assert=>assert_equals( EXPORTING exp = abap_false
                                                  act = lv_valid
                                                  msg = '04 should be invalid' ).

  ENDMETHOD.
ENDCLASS.
