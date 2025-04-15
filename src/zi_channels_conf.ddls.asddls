@AbapCatalog.sqlViewName: 'ZV_CHANNELS_CONF'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data definition for Channels Config'
@Metadata.ignorePropagatedAnnotations: true


    @UI: {
  headerInfo: {
  typeName: 'ChannelsConf',
  typeNamePlural: 'ChannelsConf',
  title: { type: #STANDARD, value: 'channel' }
  }
}


define view ZI_CHANNELS_CONF as select from ztchannels_conf as Config
{

@UI.facet: [
        {
          id:       'ChannelsConf',
          purpose:  #STANDARD,
          type:     #IDENTIFICATION_REFERENCE,
          label:    'ChannelsConf',
          position: 10 }
      ]
      
       @UI: {
          lineItem: [ { position: 10, importance: #HIGH, label: 'Channel' } ],
          identification:[ { position: 10, label: 'Channel' } ]
          } 
    
    key channel_id as channel,
    
     @UI: {
          lineItem: [ { position: 30, importance: #HIGH, label: 'Docclass' } ],
          identification:[ { position: 30, label: 'Docclass' } ]
          }     
    docclass as docclas,
    
     @UI: {
          lineItem: [ { position: 40, importance: #HIGH, label: 'Edocclass' } ],
          identification:[ { position: 40, label: 'Edocclass' } ]
          }     
    edocclass as edocclass,
    
     @UI: {
          lineItem: [ { position: 50, importance: #HIGH, label: 'Massclass' } ],
          identification:[ { position: 50, label: 'Massclass' } ]
          }     
    masclass as massclass
    
}
