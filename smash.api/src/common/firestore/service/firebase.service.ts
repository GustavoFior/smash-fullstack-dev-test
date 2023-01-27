import { Firestore } from '@google-cloud/firestore';
import * as admin from 'firebase-admin';
import { getFileData, IWorldCities } from '../../utils';

const credential = require('./config/smash-firebase-admin-key.json');

export class FirestoreService {
    private firestore: Firestore;

    constructor(
    ) {
        admin.initializeApp({
            credential: admin.credential.cert(credential),
        });

        this.firestore = admin.firestore();

        // Rodar com Firebase Emulator
        this.firestore.settings({
            host: 'localhost:5002',
            ssl: false,
        });
    }

    private _groupByCountry(data: IWorldCities[]) {
        return data.reduce((listCountries: any, item) => {
            if(!listCountries[item.country]) {
                listCountries[item.country] = [];
            }
            listCountries[item.country].push(item)

            return listCountries;
        }, {});
    }

    public async setInitialData() {

        try {
            const fileData = await getFileData();
            var listCountries = this._groupByCountry(fileData);

            for(var country in listCountries) {
                var listCities: IWorldCities[] = listCountries[country]
                const docCountry = this.firestore.collection("countries").doc(country);

                docCountry.set({
                    id: country
                });

                listCities.forEach((worldCity: IWorldCities) => {
                    const docCity = docCountry.collection("cities").doc(worldCity.city);
                    docCity.set(
                        {
                            cityId: worldCity.cityId ?? '',
                            name: worldCity.city ?? '',
                            state: worldCity.state ?? '',
                        }
                    );
                });
            }

            console.log(`Importação finalizada com sucesso! (${fileData.length}) registros importados.`);
        } catch(error) {
            console.log(`Error ao importar os dados do arquivo CSV: ${error}`);
        }
    }
}

