<template>
  <div>
  <div class="relative">
    <nuxt-link to="/" class="absolute top-4 right-4 bg-blue-500 text-white px-4 py-2 rounded-md shadow-md">
      Retour à l'accueil
    </nuxt-link></div>  
    <p>Bienvenue sur la page dédiée au basket !</p>
    <div class="info">
      <h2>Informations</h2>
      <p><strong>Responsable :</strong>  Hugo </p>
      <p><strong>Jours et Horaires :</strong></p>
      <ul>
        <li>Mardi : 21h00 - 22h00</li>
        <li>Mercredi : 20h00 - 22h00</li>
      </ul>
    </div>
    <div class="location">
      <h2>Lieu</h2>
      <p> Gymnase Jean Moulin, Rue Jean Moulin, 18000 Bourges</p>
      <div id="map"></div>
    </div>
  </div>
</template>

<script>
import L from 'leaflet'
import 'leaflet/dist/leaflet.css'

export default {
  name: 'BasketPage',
  mounted() {
    this.initMap()
  },
  methods: {
    initMap() {
      const map = L.map('map').setView([47.1039626, 2.4049524], 13)

      L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
      }).addTo(map)

      L.marker([47.1039626, 2.4049524]).addTo(map) 
        .bindPopup("Gymnase Jean Moulin<br>Rue Jean Moulin, 18000 Bourges")
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
