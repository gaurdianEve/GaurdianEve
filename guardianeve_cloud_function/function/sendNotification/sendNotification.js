const admin = require("firebase-admin");

// Initialize Firebase Admin SDK with service account credentials
admin.initializeApp({
  credential: admin.credential.cert({
    "type": "service_account",
    "project_id": "gaurdianeve-bf78e",
    "private_key_id": "7f7025eb1be4f23f918d1b84f1f04e452dee856f",
    "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCmkLk2vrsfcCK1\ni9Ps9GOT+EBErf2IX9jRFraYDW6PgH86JOrNie5lS2qqOMHtWrUd27Cc+bNMnpRv\nsySdDwmrAXH0ie78HdY/YrcyWw2uaxQrjFqzlekzfkc0XPKEZVfW3O6sav+f282j\nSx+W8iHl6brrJBetuW6TQWhLc/Q/ubMaaSscvGaM7jefAKinZKG4n4wg/QIQTaJk\naizeygoKwZ6hVbdrsEUwnwIw5MkprkFmMQDmKydzG29n7vCFw4YKTTJOxYoWhDTq\nFxhW8pzBsHXn/DY0+6tsnzznKOfV3QkkCqHlx6Fb3HxB8swl+8QV+4vSVNKK1rF6\nbyuQWGzpAgMBAAECggEAEOWr2l9DM5tgNAdXNImuy+EiYO0/I+1oPP7XP2nWalGc\nZoE9/iOk1usNiy7mkm3yI3Eo06Xbn/VS5Nl5KIMw5YOIJEj1YOdkd4nrwHye8M+d\nTFUo0uDNd1szPT9EHXT78hi30C8rFzQYwnzhm6Ic2Ppq60V+LvIZou/e1Q+yap/h\nreKZlzUNSBlXASuA4jhT/mlnRRGCFcblEPdRJt/c7ggtCF7oR3mzSg4HkuDwLhZQ\nKoNRKrf7LcJuou9bVzzLL5QdIh0HjUvx4VuEhsvzV4rZHU1B/nDZE4RhlyaieJtS\np+bpT3W80Er3S4+ojqRc4QWdgkwtftKCOzE3jECW0QKBgQDb+ajLFiO7Wc+rodo4\nLEBUUFfbII0bxqRew7kl14xuB2KhUImbR3t6UDV/Cn7ctENQJvkPH4QJ9rkpyis7\nncxPFdbRhcgim8zz3Fm55sDI0sEKFUKeRddDtAxNRLCMq7zW4PYDQP2sgH80Gbif\nlk5JfSNBxzH5zIh2+eg21TO3GQKBgQDB1+IaJ7I0B0zOsJ10Fk591B57vqJ6/sX2\nM/hyMlK2l0bc/QLlz0Xuhx/hNpRl0V/S4KPCFdpsT+aYhiftHuh3E5oZLNQohkXA\nfHFM9r5vfxaYOpRiuePiK1nwUlrzzSDMKRO3XU5d6xtz/DKkQ4Q9EIyupJLuHTAr\nAWNpLF0uUQKBgQDbSzqAq2OXxGMJYWMgmMzQwP+0zfCefhsi9c+/7/BpSCeFVbq4\n+DwapZePPLFX6MUqRJAKCYsiO7o/9PHAjwE83jK30bzA870QZt10PJx4F9Kl8Kfn\nDQ0ay4VwCkhPFG4/cSkP+Vxq+fbVw8aQIdGN5ZieXKxvsP1iTqS29TiHEQKBgQC/\nrBtLp4LjRXCiVCttFX2JmEyIKcl5+yB+QYdiS/ZTzCPq8leCK8FHid9xD0oPn8ez\nuiLTEE7JmPw4RzeFlXFiBUTzrcsfQx4HpkVWSAmoMC+EWTBOqub1xc4J/zUmK+hJ\nWDjBsIaEAa1Es9TTblt9Ejc5nUwYHU56x8WnwpFk8QKBgCezckdRL4nCpLlOCsOA\ngRFEDANsY1GbEA/7elewnn9xbQDB/YNdTEljE5KR36Wc61peOrYynV91e93KTFJV\nACJvJlHV8jGzWEC/9LoWf82QozcXKvFy70tm41Dp0Hb/eLslBsSBaTGTqDRX6ie6\n4kcNrERW42du1cwwlPA7NhUa\n-----END PRIVATE KEY-----\n",
    "client_email": "firebase-adminsdk-i9ja2@gaurdianeve-bf78e.iam.gserviceaccount.com",
    "client_id": "109829109670597844555",
    "auth_uri": "https://accounts.google.com/o/oauth2/auth",
    "token_uri": "https://oauth2.googleapis.com/token",
    "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
    "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-i9ja2%40gaurdianeve-bf78e.iam.gserviceaccount.com",
    "universe_domain": "googleapis.com"
  }),
});

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
    return admin.messaging().send(message).then(
      (response) => {
        console.log("Successfully sent message: ", response);
        callback(null, {
          statusCode: 200,
          body: "Notification sent successfully",
        });
      }
    );
  
    
  } catch (error) {
    console.error("Error sending notification:", error);
    callback(null, {
      statusCode: 500,
      body: "Error sending notification",
    });
  }
};

module.exports = { handler };
