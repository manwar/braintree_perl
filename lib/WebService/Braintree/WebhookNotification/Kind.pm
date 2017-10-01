package WebService::Braintree::WebhookNotification::Kind;

use 5.010_001;
use strictures 1;

use constant PartnerMerchantConnected => "partner_merchant_connected";
use constant PartnerMerchantDisconnected => "partner_merchant_disconnected";
use constant PartnerMerchantDeclined => "partner_merchant_declined";
use constant SubscriptionCanceled => "subscription_canceled";
use constant SubscriptionChargedSuccessfully => "subscription_charged_successfully";
use constant SubscriptionChargedUnsuccessfully => "subscription_charged_unsuccessfully";
use constant SubscriptionExpired => "subscription_expired";
use constant SubscriptionTrialEnded => "subscription_trial_ended";
use constant SubscriptionWentActive => "subscription_went_active";
use constant SubscriptionWentPastDue => "subscription_went_past_due";
use constant SubMerchantAccountApproved => "sub_merchant_account_approved";
use constant SubMerchantAccountDeclined => "sub_merchant_account_declined";
use constant TransactionDisbursed => "transaction_disbursed";
use constant DisbursementException => "disbursement_exception";
use constant Disbursement => "disbursement";
use constant DisputeOpened => "dispute_opened";
use constant DisputeLost => "dispute_lost";
use constant DisputeWon => "dispute_won";

use constant All => (
    PartnerMerchantConnected,
    PartnerMerchantDisconnected,
    PartnerMerchantDeclined,
    SubscriptionCanceled,
    SubscriptionChargedSuccessfully,
    SubscriptionChargedUnsuccessfully,
    SubscriptionExpired,
    SubscriptionTrialEnded,
    SubscriptionWentActive,
    SubscriptionWentPastDue,
    SubMerchantAccountApproved,
    SubMerchantAccountDeclined,
    TransactionDisbursed,
    DisbursementException,
    Disbursement,
    DisputeOpened,
    DisputeLost,
    DisputeWon,
);

1;
__END__
