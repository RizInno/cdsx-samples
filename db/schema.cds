context remote {

    @cdsx.api: 'API_BUSINESS_PARTNER'
    entity A_BusinessPartner {
            @cdsx.object.key
        key BusinessPartner         : String(10);
            Customer                : String(10);
            Supplier                : String(10);

            @mandatory
            BusinessPartnerCategory : String(1);
            BusinessPartnerFullName : String(81);
            BusinessPartnerUUID     : UUID;
            FirstName               : String(40);
            MiddleName              : String(40);

            @mandatory
            LastName                : String(40);
            BusinessPartnerType     : String(4);
            ETag                    : String(26);
            CreatedByUser           : String(12);
            CreationDate            : Date;
            CreationTime            : Time;
            LastChangedByUser       : String(12);
            LastChangeDate          : Date;
            LastChangeTime          : Time;
    }

    @cdsx.api: 'API_MAINTNOTIFICATION'
    entity MaintenanceNotification {
            @cdsx.object.key
        key MaintenanceNotification : String(12);
            NotificationType        : String(2);
            NotificationText        : String(40);
            FunctionalLocation      : String(30);
            CompanyCode             : String(4);
            ReportedByUser          : String(12);
            ReporterFullName        : String(80);
            CreationDateTime        : Timestamp;
            LastChangeDateTime      : Timestamp;
            to_NotificationType     : Association to one md.NotificationTypes
                                          on to_NotificationType.ID = $self.NotificationType;
            to_CompanyCode          : Association to one A_CompanyCode
                                          on to_CompanyCode.CompanyCode = $self.CompanyCode;
            to_FunctionalLocation   : Association to one FunctionalLocation
                                          on to_FunctionalLocation.FunctionalLocationLabelName = $self.FunctionalLocation;
            to_Partner              : Composition of many MaintenanceNotificationPartner
                                          on to_Partner.MaintenanceNotification = $self.MaintenanceNotification;
            to_Item                 : Composition of many MaintenanceNotificationItem
                                          on to_Item.MaintenanceNotification = $self.MaintenanceNotification;
    }

    @cdsx.api: 'API_MAINTNOTIFICATION'
    entity MaintenanceNotificationItem {
            @cdsx.object.key
        key MaintenanceNotification        : String(12);

            @cdsx.item.key
        key MaintenanceNotificationItem    : String(4);
            MaintNotifItemText             : String(40);
            MaintNotifDamageCodeGroup      : String(8);
            MaintNotifDamageCodeGroupName  : String(40);
            MaintNotificationDamageCode    : String(4);
            MaintNotifDamageCodeName       : String(40);
            MaintNotifObjPrtCodeGroup      : String(8);
            MaintNotifObjPrtCodeGroupName  : String(40);
            MaintNotifObjPrtCode           : String(4);
            MaintNotifObjPrtCodeName       : String(40);
            MaintNotifItemCreationDateTime : Timestamp;
            MaintNotifItemChangedDateTime  : Timestamp;
            to_Notif                       : Association to one MaintenanceNotification;
            to_ItemCause                   : Composition of many MaintNotificationItemCause
                                                 on  to_ItemCause.MaintenanceNotification     = $self.MaintenanceNotification
                                                 and to_ItemCause.MaintenanceNotificationItem = $self.MaintenanceNotificationItem;
            to_ItemActivity                : Composition of many MaintNotificationItemActivity
                                                 on  to_ItemActivity.MaintenanceNotification     = $self.MaintenanceNotification
                                                 and to_ItemActivity.MaintenanceNotificationItem = $self.MaintenanceNotificationItem;
    }

    @cdsx.api: 'API_MAINTNOTIFICATION'
    entity MaintNotificationItemActivity {
            @cdsx.object.key
        key MaintenanceNotification        : String(12);

            @cdsx.item.key
        key MaintenanceNotificationItem    : String(4);

            @cdsx.item.key
        key MaintNotificationActivity      : String(4);
            MaintNotifActivitySortNumber   : String(4);
            MaintNotifActyTxt              : String(40);
            MaintNotifActivityCodeGroup    : String(8);
            NotifActivityCodeGroupText     : String(40);
            MaintNotificationActivityCode  : String(4);
            NotifActivityCodeText          : String(40);
            MaintNotifItmActyStrtDateTime  : Timestamp;
            MaintNotifItemActyEndDateTime  : Timestamp;
            MaintNotifItemActyCrtnDateTime : Timestamp;
            MaintNotifItemActyChgdDateTime : Timestamp;
            to_Item                        : Association to one MaintenanceNotificationItem;
            to_Notif                       : Association to one MaintenanceNotification;
    }

    @cdsx.api: 'API_MAINTNOTIFICATION'
    entity MaintNotificationItemCause {
            @cdsx.object.key
        key MaintenanceNotification        : String(12);

            @cdsx.item.key
        key MaintenanceNotificationItem    : String(4);

            @cdsx.item.key
        key MaintenanceNotificationCause   : String(4);
            MaintNotifCauseText            : String(40);
            MaintNotifCauseCodeGroup       : String(8);
            MaintNotifCauseCodeGroupName   : String(40);
            MaintNotificationCauseCode     : String(4);
            MaintNotificationCauseCodeName : String(40);
            MaintNotificationRootCause     : String(1);
            MaintNotificationRootCauseText : String(60);
            MaintNotifItmCauseCrtnDateTime : Timestamp;
            MaintNotifItmCauseChgdDateTime : Timestamp;
            to_Item                        : Association to one MaintenanceNotificationItem;
            to_Notif                       : Association to one MaintenanceNotification;
    }

    @cdsx.api: 'API_MAINTNOTIFICATION'
    entity MaintenanceNotificationPartner {
            @cdsx.object.key
        key MaintenanceNotification       : String(12);

            @cdsx.item.key
        key NotificationPartnerObjectNmbr : String(6);
        key PartnerFunction               : String(2);
            Partner                       : String(12);
            to_PartnerFunction            : Association to one md.PartnerFunctions
                                                on to_PartnerFunction.ID = $self.PartnerFunction;
            to_Notif                      : Association to one MaintenanceNotification;
    }

    @cdsx.api: 'API_EQUIPMENT'
    entity Equipment {
        key Equipment          : String(18);
            ValidityEndDate    : Date;
            EquipmentName      : String(40);
            EquipmentCategory  : String(1);
            CreatedByUser      : String(12);
            CreationDate       : Timestamp;
            LastChangedByUser  : String(12);
            LastChangeDateTime : Timestamp;
    }

    @cdsx.api: 'API_FUNCTIONALLOCATION'
    entity FunctionalLocation {
        key FunctionalLocation          : String(30);
            FunctionalLocationName      : String(40);
            FunctionalLocationLabelName : String(40);
            CreatedByUser               : String(12);
            CreationDate                : Timestamp;
    }

    @cdsx.api: 'API_COMPANYCODE_SRV'
    entity A_CompanyCode {
        key CompanyCode     : String(4);
            CompanyCodeName : String(25);
    }

}

context md {

    entity NotificationTypes {
        key ID               : String(2);
            NotificationType : String(20);
    }

    entity PartnerFunctions {
        key ID              : String(2);
            PartnerFunction : String(20);
    }

}
