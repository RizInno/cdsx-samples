using {remote} from '../db/schema';

service NotificationService {

    @odata.draft.enabled
    entity MaintenanceNotification     as projection on remote.MaintenanceNotification;

    entity MaintenanceNotificationItem as projection on remote.MaintenanceNotificationItem;

    @readonly
    entity FunctionalLocation          as projection on remote.FunctionalLocation;

    @readonly
    entity A_CompanyCode               as projection on remote.A_CompanyCode;

}
