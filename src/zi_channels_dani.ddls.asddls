@AbapCatalog.sqlViewName: 'ZV_CHANNELS_DANI'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data definition for Channels'
@Metadata.ignorePropagatedAnnotations: true


    @UI: {
  headerInfo: {
  typeName: 'Channels',
  typeNamePlural: 'Channels',
  title: { type: #STANDARD, value: 'channel' }
  }
}


define view ZI_CHANNELS_DANI as select from ztchannels_dani as Channels
association [0..*] to ZI_CHANNELS_CONF as _Conf on _Conf.channel = $projection.channel 
{

    @UI.facet: [
        {
          id:       'Channels',
          purpose:  #STANDARD,
          type:     #LINEITEM_REFERENCE,
          targetElement: '_Conf',
          position: 10 }
      ]   
       
          
          @UI: {
          lineItem: [ { position: 10, importance: #HIGH, label: 'Channel' } ],
          identification:[ { position: 10, label: 'Channel' } ]
          }       
                    
          
key channel_id as channel,    
       

@UI: {
          lineItem: [ { position: 20, importance: #HIGH, label: 'Language' } ],
          identification:[ { position: 20, label: 'Language' } ]
          }
 
key spras as language,
 

 @UI: {
          lineItem: [ { position: 30, importance: #HIGH, label: 'Description' } ],
          identification:[ { position: 30, label: 'Description' } ]
          } 

description as description,

_Conf

    
}
