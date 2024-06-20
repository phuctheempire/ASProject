<template>
    <div class="relative">
        <nuxt-link to="/" class="absolute top-4 right-4 btn-back">
            Retour à l'accueil
        </nuxt-link>
        <div class="button-container">
            <div class="button-frame">
                <button @click="selectCity('bourges')" class="button">
                    Bourges
                </button>
            </div>
            <div class="button-frame">
                <button @click="selectCity('blois')" class="button">
                    Blois
                </button>
            </div>
        </div>
    </div>


    <!-- Information bourges -->
    <div v-if="selectedCity === 'bourges'">
        <div class="image-container">
            <div class="overlay">
                <div class="text">{{ $route.params.id }}</div>
            </div>
        </div>

        <div class="info">
            <h2>Informations</h2>
            <div>
                <strong id="responsables">Responsables :</strong>
                <div v-for="(item) in dataresponsable_bourges" :key="item.id" class="responsable-card">
                    <img src="/img/respovolley.jpeg" alt="Photo du responsable" class="responsable-photo">
                    <h3>{{ item.name }}</h3>
                    <p>{{ item.email }}</p>
                </div>
                <!-- Cach parcours list -->
            </div>

            <div>
                <strong id="jours-horaires">Jours et Horaires :</strong>
                <div v-for="(item) in dataplan_bourges" :key="item.id" class="responsable-card">
                    <h3>{{ item.date }}</h3>
                    <p>{{ item.time }}</p>
                    <h3>{{ item.lieu }}</h3>
                </div>
            </div>

            <div>
                <strong id="actualite">Actualites :</strong>
                <div v-for="(item) in dataarticle_bourges" :key="item.id" class="responsable-card">
                    <h3>{{ item.title }}</h3>
                    <p>{{ item.description }}</p>
                </div>
            </div>

            <div>
                <strong id="evenement">Evenements :</strong>
                <div v-for="(item) in dataevenement_bourges" :key="item.id" class="responsable-card">
                    <h3>{{ item.title }}</h3>
                    <p>{{ item.plan }}</p>
                </div>
            </div>

        </div>
    </div>

    <!-- Information blois -->
    <div v-if="selectedCity === 'blois'">
        <div class="image-container">
            <div class="overlay">
                <div class="text">{{ $route.params.id }}</div>
            </div>
        </div>

        <div class="info">
            <h2>Informations</h2>
            <div>
                <strong id="responsables">Responsables :</strong>
                <div v-for="(item) in dataresponsable_blois" :key="item.id" class="responsable-card">
                    <img src="/img/respovolley.jpeg" alt="Photo du responsable" class="responsable-photo">
                    <h3>{{ item.name }}</h3>
                    <p>{{ item.email }}</p>
                </div>
                <!-- Cach parcours list -->
            </div>

            <div>
                <strong id="jours-horaires">Jours et Horaires :</strong>
                <div v-for="(item) in dataplan_blois" :key="item.id" class="responsable-card">
                    <h3>{{ item.date }}</h3>
                    <p>{{ item.time }}</p>
                    <h3>{{ item.lieu }}</h3>
                </div>
            </div>

            <div>
                <strong id="actualite">Actualites :</strong>
                <div v-for="(item) in dataarticle_blois" :key="item.id" class="responsable-card">
                    <h3>{{ item.title }}</h3>
                    <p>{{ item.description }}</p>
                </div>
            </div>

            <div>
                <strong id="evenement">Evenements :</strong>
                <div v-for="(item) in dataevenement_blois" :key="item.id" class="responsable-card">
                    <h3>{{ item.title }}</h3>
                    <p>{{ item.plan }}</p>
                </div>
            </div>

        </div>
    </div>
    <!-- <h3>{{ dataresponsable }}</h3>
    <h3>{{ dataplan }}</h3>
    <h3>{{ dataarticle }}</h3> -->
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

// const datasport = valsport.filter(abc => abc.name === route.params.id);
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
<!-- <script >
    import L from 'leaflet'
    import 'leaflet/dist/leaflet.css'
    
    export default {
        name: 'BadmintonPage',
        mounted() {
    this.initMap()
    },
    methods: {
        initMap() {
            const map = L.map('map').setView([47.0800416, 2.4271166], 13)
            
            L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
                }).addTo(map)
                
                L.marker([47.0800416, 2.4271166]).addTo(map)
                .bindPopup('ICI TEST')
                .openPopup()
                }
                }
                }
    
    </script> -->

<!-- <script setup>
    let { data } = await useAsyncData('badminton', () => queryContent('/badminton').findOne())
    console.log(data)
    console.log('hello')
    </script> -->

<style scoped>
body {
    background-color: #f8f9fa;
    margin: 0;
    font-family: 'Lato', sans-serif;
}

.container {
    color: #333;
    padding: 20px;
    max-width: 1200px;
    margin: auto;
    background-color: white;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
}

.relative {
    position: relative;
}

.btn-back {
    background-color: #6200ea;
    /* Violet */
    color: white;
    padding: 10px 20px;
    border-radius: 5px;
    text-decoration: none;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    transition: background-color 0.3s ease;
}

.button {
    background-color: #bc8ffd;
    color: rgb(0, 0, 0);
    padding: 10px 20px;
    border-radius: 9px;
    text-decoration: none;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    transition: background-color 0.3s ease;
}
.btn-back:hover {
    background-color: #3700b3;
}

.info,
.location {
    margin-bottom: 20px;
}

h1,
h2 {
    color: #6200ea;
    /* Violet */
}

h1 {
    font-size: 2em;
    text-align: center;
    font-weight: bold;
    margin-bottom: 20px;
}

h2 {
    font-size: 2.5em;
    font-weight: bold;
    margin-top: 20px;
}

h3 {
    font-size: 1.4em;
    margin-top: 10px;
    font-weight: bold;
}

p,
ul {
    font-size: 1.2em;
    color: #555;
}

ul {
    list-style-type: disc;
    margin-left: 20px;
}

#map {
    height: 400px;
    width: 100%;
    margin-top: 20px;
}

.nav {
    text-align: center;
    margin-top: 30px;
}

strong#responsables,
#jours-horaires,
#actualite,
#evenement {
    font-size: 2em;
    font-weight: bold;
}



.responsable-card {
    display: inline-block;
    margin: 20px;
    text-align: center;
}

.image-container {
    text-align: center;
    position: relative;
    width: 150px;
    height: 150px;
    margin-bottom: 20px;
    border-radius: 50%;
    overflow: hidden;
}

.responsable-photo {
    max-width: 100%;
    height: auto;
    border-radius: 5px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.overlay {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.6);
    color: white;
    display: flex;
    align-items: center;
    justify-content: center;
    opacity: 0;
    transition: opacity 0.3s ease;
    border-radius: 50%;
}

.image-container:hover .overlay {
    opacity: 1;
}

.text {
    font-size: 1.2em;
    text-align: center;
}
</style>

<style>
@import url('https://fonts.googleapis.com/css2?family=Lato:wght@300;400;700&display=swap');
</style>