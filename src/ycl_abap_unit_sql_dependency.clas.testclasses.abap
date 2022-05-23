*"* use this source file for your ABAP unit test classes
class ltcl_abap_unit_sql_dependency definition final for testing
  duration short
  risk level harmless.

  private section.
    CLASS-METHODS:
      class_setup,
      class_teardown.
    METHODS:
      setup,
      only_XO30_owners FOR TESTING.
    CLASS-DATA : mo_enviroment TYPE REF TO if_osql_test_environment.
    DATA mo_cut TYPE REF TO ycl_abap_unit_sql_dependency.
endclass.


class ltcl_abap_unit_sql_dependency implementation.

  method class_setup.
    mo_enviroment = cl_osql_test_environment=>create( i_dependency_list = VALUE #( ( 'BUT000' ) ) ).
  endmethod.

  method class_teardown.
    mo_enviroment->destroy( ).
  endmethod.

  method setup.
    mo_enviroment->clear_doubles( ).
  endmethod.

  method only_xo30_owners.
    "Given
    DATA lt_mock_owners TYPE TABLE OF BUT000.
    lt_mock_owners = VALUE #( ( partner = '0000000001' bu_group = 'XO10' )
                              ( partner = '1111111111' bu_group = 'XO30' )
                              ( partner = '9090909009' bu_group = 'XO30' ) ).

    mo_enviroment->insert_test_data( lt_mock_owners ).
    mo_cut = NEW #( ).

    "When
    DATA(lv_count) = lines( mo_cut->get_owners( ) ).

    "Then
    cl_abap_unit_assert=>assert_equals( EXPORTING exp = '2'
                                                  act = lv_count
                                                  msg = 'Only X030 Owners should be fetched' ).
  endmethod.
endclass.
