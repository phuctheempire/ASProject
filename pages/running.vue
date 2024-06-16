<template>
  <div>
  <div class="relative">
    <nuxt-link to="/" class="absolute top-4 right-4 bg-blue-500 text-white px-4 py-2 rounded-md shadow-md">
      Retour à l'accueil
    </nuxt-link></div>  
    <p>Bienvenue sur la page dédiée au running !</p>
    <div class="info">
      <h2>Informations</h2>
      <p><strong>Responsables :</strong> Juliette et Emile </p>
      <p><strong>Jours et Horaires :</strong></p>
      <ul>
        <li>Dimanche : 10h00 </li>
      </ul>
    </div>
    <div class="location">
      <h2>Lieu</h2>
      <p>INSA</p>
      <div id="map"></div>
    </div>
  </div>
</template>

<script>
import L from 'leaflet'
import 'leaflet/dist/leaflet.css'

export default {
  name: 'RunningPage',
  mounted() {
    this.initMap()
  },
  methods: {
    initMap() {
      const map = L.map('map').setView([47.0818877, 2.412969], 13)

      L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
      }).addTo(map)

      L.marker([47.0818877, 2.412969]).addTo(map) 
        .bindPopup('INSA<br>88 Boulevard Lahitolle, 18000 Bourges')
        .openPopup()
    }
  }
}
</script>

<style scoped>
.info, .location {
  margin-bottom: 20px;
}

#map {
  height: 200px;  
  width: 50%;    
  margin-top: 20px;
  margin-left: auto;  
  margin-right: auto
}

h1, h2 {
  color: #333;
}

p, ul {
  font-size: 1.1em;
}

ul {
  list-style-type: disc;
  margin-left: 20px;
}

nav {
  text-align: center;
  margin-top: 30px;
}
</style>
