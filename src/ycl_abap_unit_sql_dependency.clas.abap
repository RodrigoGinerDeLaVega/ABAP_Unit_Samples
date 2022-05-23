CLASS ycl_abap_unit_sql_dependency DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES: BEGIN OF type_owners,
             own_no TYPE oiu_own_no,
           END OF type_owners.
    TYPES: tt_owners TYPE HASHED TABLE OF type_owners WITH UNIQUE KEY own_no.

    METHODS: get_owners RETURNING VALUE(rt_owners) TYPE tt_owners.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS ycl_abap_unit_sql_dependency IMPLEMENTATION.
  METHOD get_owners.
    SELECT FROM but000
      FIELDS partner AS own_no
      WHERE bu_group = 'XO20'
      INTO TABLE @rt_owners.
  ENDMETHOD.
ENDCLASS.
