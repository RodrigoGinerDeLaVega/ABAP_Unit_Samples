interface YIF_ABAP_UNIT_DEPENDENCY_DAO
  public .
    METHODS: get_owner_request_header IMPORTING iv_doc  TYPE oiuow_doc_no
                                                iv_year TYPE oiu_doc_year
                                      RETURNING VALUE(rs_header) TYPE oiuow_dtch.
endinterface.
