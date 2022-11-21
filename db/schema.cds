context remote {

    @rizing.api : 'API_MAINTNOTIFICATION'
    entity MaintenanceNotification {
            @Core : {Computed}
        key MaintenanceNotification : String(12);
            NotificationType        : String(2);
            NotificationText        : String(40);
            FunctionalLocation      : String(30);
            CompanyCode             : String(4);
            ReportedByUser          : String(12);
            ReporterFullName        : String(80);
            CreationDateTime        : Timestamp;
            LastChangeDateTime      : Timestamp;
            to_CompanyCode          : Association to one A_CompanyCode
                                          on to_CompanyCode.CompanyCode = $self.CompanyCode;
            to_FunctionalLocation   : Association to one FunctionalLocation
                                          on to_FunctionalLocation.FunctionalLocationLabelName = $self.FunctionalLocation;
            to_Item                 : Composition of many MaintenanceNotificationItem
                                          on to_Item.MaintenanceNotification = $self.MaintenanceNotification;
    }

    @rizing.api : 'API_MAINTNOTIFICATION'
    entity MaintenanceNotificationItem {
        key MaintenanceNotification        : String(12);
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
    }

    @rizing.api : 'API_EQUIPMENT'
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

    @rizing.api : 'API_FUNCTIONALLOCATION'
    entity FunctionalLocation {
        key FunctionalLocation          : String(30);
            FunctionalLocationName      : String(40);
            FunctionalLocationLabelName : String(40);
            CreatedByUser               : String(12);
            CreationDate                : Timestamp;
    }

    @rizing.api : 'API_COMPANYCODE_SRV'
    entity A_CompanyCode {
        key CompanyCode     : String(4);
            CompanyCodeName : String(25);
    }

}
