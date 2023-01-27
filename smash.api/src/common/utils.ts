import * as fs from "fs";
import { csv2jsonAsync } from 'json-2-csv';
import * as path from "path";

export interface IWorldCities {
    cityId: string;
    city: string;
    country: string;
    state: string;
}

export async function getFileData(): Promise<IWorldCities[]> {
    const filePath = path.resolve(__dirname, './firestore/service/data/world-cities.csv');
    const content = fs.readFileSync(filePath, { encoding: 'utf-8' });

    var json = (await csv2jsonAsync(content)).map((item: any): IWorldCities => {
        return {
            cityId: item.geonameid,
            city: item.name,
            country: item.country,
            state: item.subcountry,
        }
    });
    return json;
}