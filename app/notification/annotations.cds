using NotificationService as service from '../../srv/notification';

annotate service.MaintenanceNotification with @(
    Capabilities : {DeleteRestrictions : {Deletable : false}},
    UI           : {
        SelectionFields                : [
            NotificationType,
            CompanyCode,
            FunctionalLocation,
            ReportedByUser
        ],
        HeaderInfo                     : {
            TypeName       : '{i18n>maintenanceNotification}',
            TypeNamePlural : '{i18n>maintenanceNotifications}',
            Title          : {Value : NotificationText},
            Description    : {Value : MaintenanceNotification}
        },
        LineItem                       : [
            {
                $Type : 'UI.DataField',
                Value : MaintenanceNotification
            },
            {
                $Type : 'UI.DataField',
                Value : NotificationText
            },
            {
                $Type : 'UI.DataField',
                Value : NotificationType
            },
            {
                $Type : 'UI.DataField',
                Value : FunctionalLocation
            },
            {
                $Type : 'UI.DataField',
                Value : CompanyCode
            },
            {
                $Type : 'UI.DataField',
                Value : ReportedByUser
            },
            {
                $Type : 'UI.DataField',
                Value : CreationDateTime
            },
            {
                $Type : 'UI.DataField',
                Value : LastChangeDateTime
            }
        ],
        Facets                         : [
            {
                $Type  : 'UI.ReferenceFacet',
                ID     : 'GeneralInformation',
                Label  : '{i18n>generalInformation}',
                Target : '@UI.FieldGroup#GeneralInformation',
            },
            {
                $Type  : 'UI.ReferenceFacet',
                Target : 'to_Item/@UI.LineItem',
                Label  : '{i18n>items}'
            },
            {
                $Type  : 'UI.ReferenceFacet',
                Target : 'to_Partner/@UI.LineItem',
                Label  : '{i18n>partners}'
            }
        ],
        FieldGroup #GeneralInformation : {
            $Type : 'UI.FieldGroupType',
            Data  : [
                {
                    $Type         : 'UI.DataField',
                    Value         : NotificationText,
                    ![@UI.Hidden] : IsActiveEntity
                },
                {
                    $Type : 'UI.DataField',
                    Value : NotificationType
                },
                {
                    $Type : 'UI.DataField',
                    Value : FunctionalLocation
                },
                {
                    $Type : 'UI.DataField',
                    Value : CompanyCode
                },
                {
                    $Type : 'UI.DataField',
                    Value : ReportedByUser
                },
                {
                    $Type : 'UI.DataField',
                    Value : ReporterFullName
                },
                {
                    $Type : 'UI.DataField',
                    Value : CreationDateTime
                },
                {
                    $Type : 'UI.DataField',
                    Value : LastChangeDateTime
                }
            ]
        }
    }
) {
    MaintenanceNotification @(title : '{i18n>id}');
    NotificationType        @(
        title  : '{i18n>notificationType}',
        Common : {
            Text            : to_NotificationType.NotificationType,
            TextArrangement : #TextOnly,
            ValueList       : {
                Label           : '{i18n>notificationType}',
                SearchSupported : true,
                CollectionPath  : 'NotificationTypes',
                Parameters      : [
                    {
                        $Type             : 'Common.ValueListParameterInOut',
                        LocalDataProperty : NotificationType,
                        ValueListProperty : 'ID'
                    },
                    {
                        $Type             : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty : 'NotificationType'
                    }
                ]
            }
        }
    );
    NotificationText        @(title : '{i18n>maintenanceNotification}');
    FunctionalLocation      @(
        title  : '{i18n>functionalLocation}',
        Common : {
            Text            : to_FunctionalLocation.FunctionalLocationName,
            TextArrangement : #TextOnly,
            ValueList       : {
                Label           : '{i18n>functionalLocation}',
                SearchSupported : true,
                CollectionPath  : 'FunctionalLocation',
                Parameters      : [
                    {
                        $Type             : 'Common.ValueListParameterInOut',
                        LocalDataProperty : FunctionalLocation,
                        ValueListProperty : 'FunctionalLocationLabelName'
                    },
                    {
                        $Type             : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty : 'FunctionalLocationName'
                    }
                ]
            }
        }
    );
    CompanyCode             @(
        title  : '{i18n>company}',
        Common : {
            Text            : to_CompanyCode.CompanyCodeName,
            TextArrangement : #TextOnly,
            ValueList       : {
                Label           : '{i18n>companyCode}',
                SearchSupported : true,
                CollectionPath  : 'A_CompanyCode',
                Parameters      : [
                    {
                        $Type             : 'Common.ValueListParameterInOut',
                        LocalDataProperty : CompanyCode,
                        ValueListProperty : 'CompanyCode'
                    },
                    {
                        $Type             : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty : 'CompanyCodeName'
                    }
                ]
            }
        }
    );
    ReportedByUser          @(title : '{i18n>reportedByUser}');
    ReporterFullName        @(title : '{i18n>reporterFullName}');
    CreationDateTime        @(title : '{i18n>creationDate}');
    LastChangeDateTime      @(title : '{i18n>lastChangeDate}');
};

annotate service.MaintenanceNotificationPartner with @(UI : {
    HeaderInfo : {
        TypeName       : '{i18n>partner}',
        TypeNamePlural : '{i18n>partners}'
    },
    LineItem   : [
        {
            $Type : 'UI.DataField',
            Value : PartnerFunction
        },
        {
            $Type : 'UI.DataField',
            Value : Partner
        }
    ]
}) {
    MaintenanceNotification       @(UI : {Hidden});
    NotificationPartnerObjectNmbr @(UI : {Hidden});
    PartnerFunction               @(
        title  : '{i18n>partnerFunction}',
        Common : {
            Text            : to_PartnerFunction.PartnerFunction,
            TextArrangement : #TextOnly
        }
    );
    Partner                       @(title : '{i18n>partner}')
};


annotate service.MaintenanceNotificationItem with @(UI : {
    HeaderInfo : {
        TypeName       : '{i18n>item}',
        TypeNamePlural : '{i18n>items}'
    },
    LineItem   : [
        {
            $Type : 'UI.DataField',
            Value : MaintenanceNotificationItem
        },
        {
            $Type : 'UI.DataField',
            Value : MaintNotifItemText
        },
        {
            $Type : 'UI.DataField',
            Value : MaintNotifDamageCodeGroup
        },
        {
            $Type : 'UI.DataField',
            Value : MaintNotificationDamageCode
        },
        {
            $Type : 'UI.DataField',
            Value : MaintNotifObjPrtCodeGroup
        },
        {
            $Type : 'UI.DataField',
            Value : MaintNotifObjPrtCode
        },
        {
            $Type : 'UI.DataField',
            Value : MaintNotifItemCreationDateTime
        },
        {
            $Type : 'UI.DataField',
            Value : MaintNotifItemChangedDateTime
        }
    ]
}) {
    MaintenanceNotification        @(UI : {Hidden});
    MaintenanceNotificationItem    @(title : '{i18n>item}');
    MaintNotifItemText             @(title : '{i18n>description}');
    MaintNotifDamageCodeGroupName  @(UI : {Hidden});
    MaintNotifDamageCodeGroup      @(
        title  : '{i18n>damageGroup}',
        Common : {
            Text            : MaintNotifDamageCodeGroupName,
            TextArrangement : #TextOnly
        }
    );
    MaintNotifDamageCodeName       @(UI : {Hidden});
    MaintNotificationDamageCode    @(
        title  : '{i18n>damage}',
        Common : {
            Text            : MaintNotifDamageCodeName,
            TextArrangement : #TextOnly
        }
    );
    MaintNotifObjPrtCodeGroupName  @(UI : {Hidden});
    MaintNotifObjPrtCodeGroup      @(
        title  : '{i18n>partGroup}',
        Common : {
            Text            : MaintNotifObjPrtCodeGroupName,
            TextArrangement : #TextOnly
        }
    );
    MaintNotifObjPrtCodeName       @(UI : {Hidden});
    MaintNotifObjPrtCode           @(
        title  : '{i18n>part}',
        Common : {
            Text            : MaintNotifObjPrtCodeName,
            TextArrangement : #TextOnly
        }
    );
    MaintNotifItemCreationDateTime @(title : '{i18n>creationDate}');
    MaintNotifItemChangedDateTime  @(title : '{i18n>lastChangeDate}');
    to_Notif                       @(UI : {Hidden});
};


annotate service.A_CompanyCode with {
    CompanyCode     @(title : '{i18n>companyCode}');
    CompanyCodeName @(title : '{i18n>company}');
};

annotate service.FunctionalLocation with {
    FunctionalLocationLabelName @(title : '{i18n>functionalLocation}');
    FunctionalLocationName      @(title : '{i18n>functionalLocationName}');
};
