package idomatic

type QueueName string

const (
	QueueNameDefault   QueueName = "default"
	QueueNameEmail     QueueName = "email"
	QueueNameSMS       QueueName = "sms"
	QueueNameWebhook   QueueName = "webhook"
	QueueNameScheduler QueueName = "scheduler"
)

func (q QueueName) String() string {
	return string(q)
}
