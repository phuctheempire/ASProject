<template>
  <div>
  <div class="relative">
    <nuxt-link to="/" class="absolute top-4 right-4 bg-blue-500 text-white px-4 py-2 rounded-md shadow-md">
      Retour à l'accueil
    </nuxt-link></div>  
    <p>Bienvenue sur la page dédiée au cheer !</p>
    <div class="info">
      <h2>Informations</h2>
      <p><strong>Responsables :</strong> Capucine et Inès</p>
      <p><strong>Jours et Horaires :</strong></p>
      <ul>
        <li>Jeudi : 16h00 - 18h00 (stunt)</li>

        <li>Jeudi : 16h00 - 18h00 (stunt)</li>
      </ul>
    </div>
    <div class="location">
      <h2>Lieu</h2>
      <p> Gymnase Jean Brivot, Avenue Roland Garros, 18000 Bourges</p>
      <div id="map"></div>
    </div>
  </div>
</template>

<script>
import L from 'leaflet'
import 'leaflet/dist/leaflet.css'

export default {
  name: 'CheerPage',
  mounted() {
    this.initMap()
  },
  methods: {
    initMap() {
      const map = L.map('map').setView([47.0654266, 2.3808466], 13)

      L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
      }).addTo(map)

      L.marker([47.0654266, 2.3808466]).addTo(map) 
        .bindPopup("Gymnase Jean Brivot<br>Avenue Roland Garros, 18000 Bourges")
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
