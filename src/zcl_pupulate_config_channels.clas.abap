CLASS zcl_pupulate_config_channels DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_pupulate_config_channels IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

 DATA:it_chan_conf TYPE TABLE OF ztchannels_conf.

*    read current timestamp
    GET TIME STAMP FIELD DATA(zv_tsl).
*   fill internal table (itab)
    it_chan_conf = VALUE #(
        ( channel_id  = 'B2B' docclass = '' edocclass = '' masclass = '' )
        ( channel_id  = 'DCW' docclass = '' edocclass = '' masclass = '' )
        ( channel_id  = 'EMBAT' docclass = '' edocclass = '' masclass = '' )
     ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ztchannels_conf.
*   insert the new table entries
    INSERT ztchannels_conf FROM TABLE @it_chan_conf.

*   check the result
    SELECT * FROM ztchannels_conf INTO TABLE @it_chan_conf.
    out->write( sy-dbcnt ).
    out->write( 'data inserted successfully!' ).

  ENDMETHOD.

ENDCLASS.
