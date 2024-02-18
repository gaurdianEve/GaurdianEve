import firebase_admin
from firebase_admin import messaging

# Initialize the Firebase Admin SDK
cred = firebase_admin.credentials.Certificate('gaurdianeve-bf78e-46ff6ce0beb9.json')
firebase_admin.initialize_app(cred)

def send_notification(token, title, body):
  """Sends a notification message to the specified device token.

  Args:
    token: The recipient's device token.
    title: The title of the notification.
    body: The body of the notification.
  """

  message = messaging.Message(
      data={
          "title": title,
          "body": body
      },
      token=token)

  try:
      response = messaging.send(message)
      print('Message sent successfully:', response)
  except Exception as e:
      print('Error sending message:', e)

# Example usage
token = "your_recipient_device_token"
title = "My Notification Title"
body = "This is the message body"
send_notification(token, title, body)
