using NotificationService as service from '../../srv/notification';

annotate service.MaintenanceNotification with @(
    Capabilities : {DeleteRestrictions : {Deletable : false}},
    UI           : {
        SelectionFields                : [
            CompanyCode,
            FunctionalLocation
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
        Facets                         : [{
            $Type  : 'UI.ReferenceFacet',
            ID     : 'GeneralInformation',
            Label  : '{i18n>generalInformation}',
            Target : '@UI.FieldGroup#GeneralInformation',
        }],
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
    NotificationType        @(title : '{i18n>notificationType}');
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

annotate service.A_CompanyCode with {
    CompanyCode     @(title : '{i18n>companyCode}');
    CompanyCodeName @(title : '{i18n>company}');
};

annotate service.FunctionalLocation with {
    FunctionalLocationLabelName @(title : '{i18n>functionalLocation}');
    FunctionalLocationName      @(title : '{i18n>functionalLocationName}');
};
