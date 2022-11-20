using NotificationService as service from '../../srv/notification';

annotate service.MaintenanceNotification with @(UI.LineItem : [
    {
        $Type : 'UI.DataField',
        Label : 'MaintenanceNotification',
        Value : MaintenanceNotification,
    },
    {
        $Type : 'UI.DataField',
        Label : 'NotificationType',
        Value : NotificationType,
    },
    {
        $Type : 'UI.DataField',
        Label : 'NotificationText',
        Value : NotificationText,
    },
    {
        $Type : 'UI.DataField',
        Label : 'FunctionalLocation',
        Value : FunctionalLocation,
    },
    {
        $Type : 'UI.DataField',
        Label : 'CompanyCode',
        Value : CompanyCode,
    },
]);

annotate service.MaintenanceNotification with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data  : [
            {
                $Type : 'UI.DataField',
                Label : 'MaintenanceNotification',
                Value : MaintenanceNotification,
            },
            {
                $Type : 'UI.DataField',
                Label : 'NotificationType',
                Value : NotificationType,
            },
            {
                $Type : 'UI.DataField',
                Label : 'NotificationText',
                Value : NotificationText,
            },
            {
                $Type : 'UI.DataField',
                Label : 'FunctionalLocation',
                Value : FunctionalLocation,
            },
            {
                $Type : 'UI.DataField',
                Label : 'CompanyCode',
                Value : CompanyCode,
            },
            {
                $Type : 'UI.DataField',
                Label : 'ReportedByUser',
                Value : ReportedByUser,
            },
            {
                $Type : 'UI.DataField',
                Label : 'ReporterFullName',
                Value : ReporterFullName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'CreationDateTime',
                Value : CreationDateTime,
            },
            {
                $Type : 'UI.DataField',
                Label : 'LastChangeDateTime',
                Value : LastChangeDateTime,
            },
        ],
    },
    UI.Facets                      : [{
        $Type  : 'UI.ReferenceFacet',
        ID     : 'GeneratedFacet1',
        Label  : 'General Information',
        Target : '@UI.FieldGroup#GeneratedGroup1',
    }, ]
);
