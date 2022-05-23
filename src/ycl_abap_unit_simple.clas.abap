CLASS ycl_abap_unit_simple DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: is_valid_number IMPORTING iv_value TYPE I
                             RETURNING VALUE(rv_valid) TYPE BOOLEAN.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS ycl_abap_unit_simple IMPLEMENTATION.
  METHOD is_valid_number.
    "Check if value is between 1-100

    rv_valid = abap_false.

    IF iv_value >= 1 AND iv_value < 100.
      rv_valid = abap_true.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
