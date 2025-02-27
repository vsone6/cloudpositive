resource "google_monitoring_notification_channel" "email" {
  display_name = "Tier 1 Support Email"
  type         = "email"
  
  labels = {
    email_address = var.user_gmail
  }
}

resource "google_billing_budget" "budget" {
  billing_account = "01021A-0FB61A-3F16ED"  
  display_name    = "Monthly Budget Alert"

  amount {
    specified_amount {
      currency_code = "INR"
      units         = "100"  
    }
  }

  threshold_rules {
    threshold_percent = 0.5  
  }

  threshold_rules {
    threshold_percent = 0.9  
  }

  all_updates_rule {
    disable_default_iam_recipients = false
    monitoring_notification_channels = [
      google_monitoring_notification_channel.email.id
    ]
  }
}