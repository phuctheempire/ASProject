<script setup>

import { useRoute } from 'vue-router';
import { ref } from 'vue';

const route = useRoute();
const selectedCity = ref(null);
const selectedSport = ref(null);

const sport = await useFetch('/api/sport/sport', {
    query: {
        name: route.params.id
    }
})

const selectCity = (city) => {
    selectedCity.value = city;
    selectedSport.value = sport.data._value.filter(abc => abc.city === city)[0];
    
}


</script>

<template>
    <div class="page-container">
        <div class="button-container">
            <button @click="selectCity('Bourges')" class="sport-button">Bourges</button>
            <button @click="selectCity('Blois')" class="sport-button">Blois</button>
        </div>
        <div v-if="selectedCity !== 'Bourges' && selectedCity !== 'Blois'"  class="content-rectangle">
            <div class="content-section">
                <div class="editable-field"> 
                    <p><strong>Bienvenue dans {{ route.params.id }} !</strong></p>
                    <p>Choisiez-vous le campus !</p>
                </div>
            </div>
        </div>
        
        <div v-else class="content-rectangle">
            <div class="content-section">
                <div class="editable-field">
                    <p><strong>Responsables:</strong></p>
                    <div v-for="(item) in selectedSport.user" :key="item.id" class="responsable-card">
                        <img v-bind:src="item.image" alt="Photo du responsable" class="responsable-photo">
                        <h3>{{ item.name }}</h3>
                        <p style="font-size: 15px; font-style: italic;">{{ item.email }}</p>
                    </div>
                </div>

                <div class="editable-field">
                    <p><strong>Jours et Horaire:</strong></p>
                    <div v-for="(item) in selectedSport.plan" :key="item.id" class="horraire-entry">
                        <h3>{{ item.date }}:</h3>
                        <p>{{ item.time }} - </p>
                        <h3>{{ item.lieu }}</h3>
                    </div>
                </div>

                <div class="editable-field">
                    <p><strong>Actualites :</strong></p>
                    <div v-for="(item) in selectedSport.article" :key="item.id" class="responsable-card">
                        <h3 class="article-title">{{ item.title }}</h3>
                        <p class="article-description">{{ item.description }}</p>
                    </div>
                </div>

                <div class="editable-field">
                    <p><strong>Evenements :</strong></p>
                    <div v-for="(item) in selectedSport.evenement" :key="item.id" class="responsable-card">
                        <h3 class="event-title">{{ item.title }}</h3>
                        <p class="event-description">{{ item.plan }}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

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
    color: white;
    border: none;
    border-radius: 5px;
    padding: 15px 30px;
    margin: 0 10px;
    cursor: pointer;
    transition: background-color 0.3s;
    font-size: 1.2em;
    width: 150px;
    text-align: center;
}

.sport-button:hover {
    background-color: #9575CD;
}

.content-rectangle {
    background: linear-gradient(135deg, #E1BEE7 0%, #EDE7F6 50%, #D1C4E9 100%);
    color: #4A0072;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    max-width: 800px;
    width: 100%;
    margin-bottom: 20px;
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
    font-size: 1.5em;
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
    gap: 20px;
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
    width: 100px;
    height: 100px;
    object-fit: cover;
}

.responsable-card {
    background: linear-gradient(135deg, #E1BEE7 0%, #EDE7F6 50%, #D1C4E9 100%);
    color: #4A0072;
    padding: 15px;
    border-radius: 10px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    margin-top: 10px;
    width: 100%;
}

.responsable-card h3 {
    margin: 0;
}

.responsable-card p {
    margin: 5px 0 0;
}

.article-title,
.event-title {
    font-size: 0.8em;
    font-weight: bold;
    color: #4A0072;
    margin-bottom: 5px;
}

.article-description,
.event-description {
    font-size: 0.7em;
    color: #4A0072;
    margin-top: 0;
}
</style>
