*"* use this source file for your ABAP unit test classes
class ltcl_abap_unit_simple definition final for testing
  duration short
  risk level harmless.

  private section.
    data: m_cut TYPE REF TO ycl_abap_unit_simple.
    methods:
      is_valid_0 for testing,
      is_valid_1 for testing,
      is_valid_50 for testing,
      is_valid_100 for testing,
      is_valid_200 for testing.
endclass.


class ltcl_abap_unit_simple implementation.

  method is_valid_0.
    "Given
      DATA(lv_number) = 0.
    "When
      m_cut = NEW #( ).
      DATA(lv_is_valid) = m_cut->is_valid_number( lv_number ).
    "Then
    cl_abap_unit_assert=>assert_equals( act  = lv_is_valid
                                        exp  = abap_false
                                        msg  = 'Number 0 should not be valid').
  endmethod.

  method is_valid_1.
    "Given/When
    DATA(lv_is_valid) = NEW ycl_abap_unit_simple( )->is_valid_number( 1 ).
    "Then
    cl_abap_unit_assert=>assert_equals( act  = lv_is_valid
                                        exp  = abap_true
                                        msg  = 'Number 1 should be valid').
  endmethod.

  method is_valid_50.
    "Given/When
    DATA(lv_is_valid) = NEW ycl_abap_unit_simple( )->is_valid_number( 50 ).
    "Then
    cl_abap_unit_assert=>assert_equals( act  = lv_is_valid
                                        exp  = abap_true
                                        msg  = 'Number 50 should be valid').

  endmethod.

  method is_valid_100.
    "Given/When
    DATA(lv_is_valid) = NEW ycl_abap_unit_simple( )->is_valid_number( 100 ).
    "Then
    cl_abap_unit_assert=>assert_equals( act  = lv_is_valid
                                        exp  = abap_true
                                        msg  = 'Number 100 should be valid').

  endmethod.

  method is_valid_200.
    "Given/When
    DATA(lv_is_valid) = NEW ycl_abap_unit_simple( )->is_valid_number( 200 ).
    "Then
    cl_abap_unit_assert=>assert_equals( act  = lv_is_valid
                                        exp  = abap_false
                                        msg  = 'Number 200 should not be valid').

  endmethod.
endclass.
