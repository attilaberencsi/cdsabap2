"! <p class="shorttext synchronized" lang="en">Test Data Generator - Operates in Reset Mode</p>
CLASS zatb_cl_cdsabap_testdata_gen DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zatb_cl_cdsabap_testdata_gen IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DELETE FROM zatb_product.

    GET TIME STAMP FIELD DATA(now).

    INSERT zatb_product FROM @(
      VALUE #(
        product = 'P1'
        product_type = 'T1'
        price = 1
        currency =  'EUR'
        creation_date_time = now

      )
    ).

    DELETE FROM zatb_salesorderi.
    INSERT zatb_salesorderi FROM @(
      VALUE #(
        salesorder = 'S1'
        salesorderitem = '000010'
        product = 'P1'
        orderquantity = 10
        orderquantityunit = 'KG'
        netamount = 10
        transactioncurrency = 'EUR'
        creationdatetime = now
        createdbyuser = cl_abap_context_info=>get_user_technical_name( )
      )
    ).
  ENDMETHOD.
ENDCLASS.
