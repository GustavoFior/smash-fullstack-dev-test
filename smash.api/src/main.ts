import { FirestoreService } from "./common/firestore/service/firebase.service";
// import { AppModule } from "./app.module";

// // Start writing functions
// // https://firebase.google.com/docs/functions/typescript
//
// export const helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", { structuredData: true });
//   response.send("Hello from Firebase!");
// });

async function appStart() {
  const appStart = new FirestoreService()
  appStart.setInitialData()
}
appStart();

