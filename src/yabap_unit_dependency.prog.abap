*&---------------------------------------------------------------------*
*& Report yabap_unit_dependency
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT yabap_unit_dependency.

PARAMETERS: p_doc   TYPE oiuow_dtch-doc_no,
            p_year  TYPE oiuow_dtch-doc_year.

PARAMETERS: r_const RADIOBUTTON GROUP r1 DEFAULT 'X',
            r_param RADIOBUTTON GROUP r1,
            r_back  RADIOBUTTON GROUP r1.

DATA: go_sample_const TYPE REF TO ycl_abap_unit_depen_construc.
DATA: go_sample_param TYPE REF TO ycl_abap_unit_depen_param.
DATA: go_sample_back  TYPE REF TO ycl_abap_unit_depen_backdoor.

START-OF-SELECTION.

"Injection is done in test class but the class need to be ready for the injection
CASE 'X'.
  "Constructor Injection
  WHEN r_const.
    go_sample_const = NEW #( iv_doc   = p_doc
                             iv_year  = p_year ).

    IF go_sample_const->is_valid_doc( ).
      cl_demo_output=>display( 'Valid' ).
    ELSE.
      cl_demo_output=>display( 'Invalid' ).
    ENDIF.

  "Parameter Injection
  WHEN r_param.
    go_sample_param = NEW #( iv_doc   = p_doc
                             iv_year  = p_year ).

    IF go_sample_param->is_valid_doc( ).
      cl_demo_output=>display( 'Valid' ).
    ELSE.
      cl_demo_output=>display( 'Invalid' ).
    ENDIF.

  "Backdoor Injection
  WHEN r_back.
    go_sample_back = NEW #( iv_doc   = p_doc
                            iv_year  = p_year ).

    IF go_sample_back->is_valid_doc( ).
      cl_demo_output=>display( 'Valid' ).
    ELSE.
      cl_demo_output=>display( 'Invalid' ).
    ENDIF.
ENDCASE.
