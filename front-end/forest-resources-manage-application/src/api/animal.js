import { apiClient } from "./index"

export const retrieveAllAnimalSpecies = () => apiClient.get("animal-storage-facilities/species")
export const retrieveAllAnimalFacilities = () => apiClient.get("animal-storage-facilities")
export const createAmimal = (animal) => apiClient.post(`animal-storage-facilities/species/${animalName}`, animal)
export const updateAnimalSpecie = (animalName, animal) => apiClient.put(`animal-storage-facilities/species/${animalName}`, animal)
export const retrieveAnimalQuantityInMoth = (beginMonth, endMonth) => apiClient.get(`animal-storage-facilities/species/facilities/month/${beginMonth}/${endMonth}`)
export const retrieveAnimalQuantityInQuarter = (beginQuarter, endQuarter) => apiClient.get(`animal-storage-facilities/species/facilities/quarter/${beginQuarter}/${endQuarter}`)
export const retrieveAnimalQuantityInYear = (beginYear, endYear) => apiClient.get(`animal-storage-facilities/species/facilities/year/${beginYear}/${endYear}`)
export const retrieveAnimalQuantityNow = () => apiClient.get('animal-storage-facilities/species/facility-quantity/now')
export const updateAnimalQuantity = (animalQuantity) => apiClient.put('animal-storage-facilities/species/facility-quantity/update',animalQuantity)