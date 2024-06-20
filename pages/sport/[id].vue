<template>
    <div class="page-container">
        <div class="button-container">
            <button @click="selectCity('bourges')" class="sport-button">Bourges</button>
            <button @click="selectCity('blois')" class="sport-button">Blois</button>
        </div>
        <div v-if="selectedCity !== 'bourges' && selectedCity !== 'blois'"  class="content-rectangle">
            <div class="content-section">
                <div class="editable-field"> 
                    <p><strong>Bienvenue dans {{ route.params.id }} !</strong></p>
                    <p>Choisiez-vous le campus !</p>
                </div>
            </div>
        </div>
        <div v-if="selectedCity === 'bourges'" class="content-rectangle">
            <div class="content-section">
                <div class="editable-field">
                    <p><strong>Responsables:</strong></p>
                    <div v-for="(item) in dataresponsable_bourges" :key="item.id" class="responsable-card">
                        <img src="/img/respovolley.jpeg" alt="Photo du responsable" class="responsable-photo">
                        <h3>{{ item.name }}</h3>
                        <p>{{ item.email }}</p>
                    </div>
                </div>

                <div class="editable-field">
                    <p><strong>Jours et Horaire:</strong></p>
                    <div v-for="(item) in dataplan_bourges" :key="item.id" class="horraire-entry">
                        <h3>{{ item.date }}</h3>
                        <p>{{ item.time }}</p>
                        <h3>{{ item.lieu }}</h3>
                    </div>
                </div>


                <div class="editable-field">
                    <p><strong>Actualites :</strong></p>
                    <div v-for="(item) in dataarticle_bourges" :key="item.id" class="responsable-card">
                        <h3>{{ item.title }}</h3>
                        <p>{{ item.description }}</p>
                    </div>
                </div>

                <div class="editable-field">
                    <p><strong>Evenements :</strong></p>
                    <div v-for="(item) in dataevenement_bourges" :key="item.id" class="responsable-card">
                        <h3>{{ item.title }}</h3>
                        <p>{{ item.plan }}</p>
                    </div>
                </div>
            </div>
        </div>



        <div v-if="selectedCity === 'blois'" class="content-rectangle">
            <div class="content-section">
                <div class="editable-field">
                    <p><strong>Responsables:</strong></p>
                    <div v-for="(item) in dataresponsable_blois" :key="item.id" class="responsable-card">
                        <img src="/img/respovolley.jpeg" alt="Photo du responsable" class="responsable-photo">
                        <h3>{{ item.name }}</h3>
                        <p>{{ item.email }}</p>
                    </div>
                </div>

                <div class="editable-field">
                    <p><strong>Jours et Horaire:</strong></p>
                    <div v-for="(item) in dataplan_blois" :key="item.id" class="horraire-entry">
                        <h3>{{ item.date }}</h3>
                        <p>{{ item.time }}</p>
                        <h3>{{ item.lieu }}</h3>
                    </div>
                </div>


                <div class="editable-field">
                    <p><strong>Actualites :</strong></p>
                    <div v-for="(item) in dataarticle_blois" :key="item.id" class="responsable-card">
                        <h3>{{ item.title }}</h3>
                        <p>{{ item.description }}</p>
                    </div>
                </div>

                <div class="editable-field">
                    <p><strong>Evenements :</strong></p>
                    <div v-for="(item) in dataevenement_blois" :key="item.id" class="responsable-card">
                        <h3>{{ item.title }}</h3>
                        <p>{{ item.plan }}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>



<script setup>

import { useRoute } from 'vue-router';
import { ref } from 'vue';

const route = useRoute();
const selectedCity = ref(null);
const selectCity = (city) => {
    selectedCity.value = city;
};

const sport = await useFetch('/api/content/sport')
const person = await useFetch('/api/content/person')
const plan = await useFetch('/api/content/plan')
const article = await useFetch('/api/content/article')
const evenement = await useFetch('/api/content/evenement')

const valsport = sport.data._value
const valperson = person.data._value
const valplan = plan.data._value
const valarticle = article.data._value
const valevenement = evenement.data._value

const datasport = valsport.filter(abc => abc.name === route.params.id);
// const dataplan = valplan.filter(abc => abc.name === route.params.id);

const datasport_bourges = valsport.filter(abc => abc.name === route.params.id && abc.city === 'Bourges');
const datasport_blois = valsport.filter(abc => abc.name === route.params.id && abc.city === 'Blois');

const dataresponsable_bourges = valperson.filter(abc => abc.sportid === datasport_bourges[0].id)
const dataresponsable_blois = valperson.filter(abc => abc.sportid === datasport_blois[0].id)

const dataplan_bourges = valplan.filter(abc => abc.sportid === datasport_bourges[0].id)
const dataplan_blois = valplan.filter(abc => abc.sportid === datasport_blois[0].id)

const dataarticle_bourges = valarticle.filter(abc => abc.categoryid === datasport_bourges[0].id)
const dataarticle_blois = valarticle.filter(abc => abc.categoryid === datasport_blois[0].id)

const dataevenement_bourges = valevenement.filter(abc => abc.categoryid === datasport_bourges[0].id)
const dataevenement_blois = valevenement.filter(abc => abc.categoryid === datasport_blois[0].id)

// console.log(datasport)

</script>


<style scoped>
.page-container {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin: 20px;
}

.button-container {
    display: flex;
    justify-content: center;
    margin-bottom: 20px;
}

.sport-button {
    background-color: #6A0DAD;
    /* Dark violet background */
    color: white;
    /* White text */
    border: none;
    border-radius: 5px;
    padding: 15px 30px;
    /* Increase padding for larger buttons */
    margin: 0 10px;
    /* Space between buttons */
    cursor: pointer;
    transition: background-color 0.3s;
    font-size: 1.2em;
    /* Increase font size for readability */
    width: 150px;
    /* Fixed width to ensure buttons are the same size */
    text-align: center;
    /* Center the text inside the button */
}

.sport-button:hover {
    background-color: #9575CD;
    /* Lighter violet on hover */
}

.content-rectangle {
    background: linear-gradient(135deg, #E1BEE7 0%, #EDE7F6 50%, #D1C4E9 100%);
    /* Gradient background */
    color: #4A0072;
    /* Dark violet text color */
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    /* Soft shadow for depth */
    max-width: 800px;
    /* Maximum width of the rectangle */
    width: 100%;
    /* Full width for responsiveness */
    margin-bottom: 20px;
    /* Space below the rectangle */
}

.content-section {
    font-size: 1.2em;
}

.content-section p {
    margin-bottom: 10px;
}

.content-section ul {
    list-style-type: disc;
    padding-left: 20px;
    margin-bottom: 10px;
}

.editable-field {
    margin-bottom: 20px;
}

.editable-input,
.editable-textarea {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    margin-top: 5px;
}

.editable-input:focus,
.editable-textarea:focus {
    border-color: #6A0DAD;
    /* Dark violet border on focus */
    outline: none;
}

.editable-textarea {
    min-height: 60px;
    resize: vertical;
}

.horraire-entry {
    display: flex;
    gap: 10px;
    margin-top: 10px;
}

.horraire-entry .editable-input {
    flex: 1;
}

.responsable-container {
    display: flex;
    justify-content: space-around;
    /* Space out the responsibles horizontally */
    gap: 20px;
    /* Space between responsibles */
    margin-top: 20px;
}

.responsable {
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
}

.responsable-photo {
    border-radius: 50%;
    /* Makes the image circular */
    width: 100px;
    /* Set the desired width of the photo */
    height: 100px;
    /* Set the desired height of the photo */
    object-fit: cover;
    /* Ensures the image covers the entire circle */
}

.responsable-card {
    background: linear-gradient(135deg, #E1BEE7 0%, #EDE7F6 50%, #D1C4E9 100%);
    /* Gradient background */
    color: #4A0072;
    /* Dark violet text color */
    padding: 15px;
    /* Padding for the card content */
    border-radius: 10px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    /* Soft shadow for depth */
    margin-top: 10px;
    /* Space above the card */
    width: 100%;
}

.responsable-card h3 {
    margin: 0;
}

.responsable-card p {
    margin: 5px 0 0;
}
</style>