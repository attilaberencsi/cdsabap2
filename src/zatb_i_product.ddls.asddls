@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Product'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'Product'
@AbapCatalog.viewEnhancementCategory: [#NONE]
@ObjectModel.usageType:{
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}
define root view entity ZATB_I_Product
  as select from zatb_product
  composition [0..*] of ZATB_I_ProductText as _Text
{

      @ObjectModel.text.association: '_Text'
  key product             as Product,
      product_type        as ProductType,
      authorization_group as AuthorizationGroup,
      @Semantics.amount.currencyCode : 'Currency'
      price               as Price,
      currency            as Currency,
      creation_date_time  as CreationDateTime,
      _Text
}
