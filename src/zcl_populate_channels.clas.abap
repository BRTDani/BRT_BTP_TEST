CLASS zcl_populate_channels DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_populate_channels IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

   DATA:it_channels TYPE TABLE OF ztchannels_dani.

*    read current timestamp
    GET TIME STAMP FIELD DATA(zv_tsl).
*   fill internal table (itab)
    it_channels = VALUE #(
        ( spras = 'E' channel_id  = 'B2B' description = 'B2BROUTER' )
        ( spras = 'E' channel_id  = 'DCW' description = 'DOCUWARE' )
        ( spras = 'E' channel_id  = 'EMBAT' description = 'EMBAT' )
     ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ztchannels_dani.
*   insert the new table entries
    INSERT ztchannels_dani FROM TABLE @it_channels.

*   check the result
    SELECT * FROM ztchannels_dani INTO TABLE @it_channels.
    out->write( sy-dbcnt ).
    out->write( 'data inserted successfully!' ).

  ENDMETHOD.


ENDCLASS.
