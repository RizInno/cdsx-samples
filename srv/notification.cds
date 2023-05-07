using {
    md,
    remote
} from '../db/schema';

service NotificationService {

    @odata.draft.enabled
    entity MaintenanceNotification        as projection on remote.MaintenanceNotification;

    entity MaintenanceNotificationItem    as projection on remote.MaintenanceNotificationItem;
    entity MaintNotificationItemActivity  as projection on remote.MaintNotificationItemActivity;
    entity MaintNotificationItemCause     as projection on remote.MaintNotificationItemCause;
    entity MaintenanceNotificationPartner as projection on remote.MaintenanceNotificationPartner;

    @readonly
    entity FunctionalLocation             as projection on remote.FunctionalLocation;

    @readonly
    entity A_CompanyCode                  as projection on remote.A_CompanyCode;

    @readonly
    entity NotificationTypes              as projection on md.NotificationTypes;

    @readonly
    entity PartnerFunctions               as projection on md.PartnerFunctions;

}
