const admin = require("firebase-admin");

// Initialize Firebase Admin SDK
admin.initializeApp();

const handler = async (event, context, callback) => {
  const { notification, token } = JSON.parse(event.body);

  if (!token) {
    return callback(null, {
      statusCode: 400,
      body: "Device token is required",
    });
  }

  const message = {
    token: token,
    notification: {
      title: notification.title,
      body: notification.body,
    },
  };

  try {
    await admin.messaging().send(message);
    callback(null, {
      statusCode: 200,
      body: "Notification sent successfully",
    });
  } catch (error) {
    console.error("Error sending notification:", error);
    callback(null, {
      statusCode: 500,
      body: "Error sending notification",
    });
  }
};

module.exports = { handler };
