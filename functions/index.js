const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

const firestore = admin.firestore();

exports.onCreateExpression = functions.firestore
    .document("expressions/{docId}")
    .onCreate((snapshot, context) => {
        firestore.doc("data/live-data").update({
            "solved-counter" : admin.firestore.FieldValue.increment(1),
        });
    });
