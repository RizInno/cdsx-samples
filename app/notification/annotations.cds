using NotificationService as service from '../../srv/notification';

annotate service.MaintenanceNotification with @(
    Capabilities : {DeleteRestrictions : {Deletable : false}},
    UI           : {
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
                Value : NotificationType
            },
            {
                $Type : 'UI.DataField',
                Value : NotificationText
            },
            {
                $Type : 'UI.DataField',
                Value : FunctionalLocation
            },
            {
                $Type : 'UI.DataField',
                Value : CompanyCode
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
    MaintenanceNotification @(title : '{i18n>maintenanceNotification}');
    NotificationType        @(title : '{i18n>notificationType}');
    NotificationText        @(title : '{i18n>notificationText}');
    FunctionalLocation      @(title : '{i18n>functionalLocation}');
    CompanyCode             @(
        title  : '{i18n>companyCode}',
        Common : {
            Text            : to_CompanyCode.CompanyCodeName,
            TextArrangement : #TextOnly
        }
    );
    ReportedByUser          @(title : '{i18n>reportedByUser}');
    ReporterFullName        @(title : '{i18n>reporterFullName}');
    CreationDateTime        @(title : '{i18n>creationDate}');
    LastChangeDateTime      @(title : '{i18n>lastChangeDate}');
    to_CompanyCode          @(
        title  : '{i18n>companyCode}',
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
                        $Type             : 'Common.ValueListParameterInOut',
                        LocalDataProperty : to_CompanyCode.CompanyCodeName,
                        ValueListProperty : 'CompanyCodeName'
                    }
                ]
            }
        }
    );
};
