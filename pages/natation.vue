<template>
  <div>
  <div class="relative">
    <nuxt-link to="/" class="absolute top-4 right-4 bg-blue-500 text-white px-4 py-2 rounded-md shadow-md">
      Retour à l'accueil
    </nuxt-link></div>  
    <p>Bienvenue sur la page dédiée à la natation !</p>
    <div class="info">
      <p><strong>Responsable :</strong> Mr Vaukan </p>
      <p><strong>Jours et Horaires :</strong></p>
      <ul>
        <li>Jeudi : 13h30 - 14h30</li>
      </ul>
    </div>
    <div class="location">
      <h2>Lieu</h2>
      <p>Centre Nautique Raymond Boisdé, Place Pierre de Coubertin, 18000 Bourges</p>
      <div id="map"></div>
    </div>
  </div>
</template>

<script>
import L from 'leaflet'
import 'leaflet/dist/leaflet.css'

export default {
  name: 'NatationPage',
  mounted() {
    this.initMap()
  },
  methods: {
    initMap() {
      const map = L.map('map').setView([47.0920306, 2.3953502], 13)

      L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
      }).addTo(map)

      L.marker([47.0920306, 2.3953502]).addTo(map) 
        .bindPopup("Centre Nautique Raymond Boisdé<br>Place Pierre de Coubertin, 18000 Bourges")
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

h1 {
  font-size : 1.3em;
}

p {
  font-size: 1.5em;
}

ul {
  list-style-type: disc;
  margin-left: 20px;
  font-size: 1.1em;
}

nav {
  text-align: center;
  margin-top: 30px;
}
</style>
