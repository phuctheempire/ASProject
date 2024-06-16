<template>
  <div>
  <div class="relative">
    <nuxt-link to="/" class="absolute top-4 right-4 bg-blue-500 text-white px-4 py-2 rounded-md shadow-md">
      Retour à l'accueil
    </nuxt-link></div>  
    <p>Bienvenue sur la page dédiée à l'aviron !</p>
    <div class="info">
      <h2>Informations</h2>
      <p><strong>Responsables :</strong> Brice et Paul </p>
      <p><strong>Jours et Horaires :</strong></p>
      <ul>
        <li>Jeudi : 15h00 - 17h00</li>
      </ul>
    </div>
    <div class="location">
      <h2>Lieu</h2>
      <p>Base d'Aviron Alice Milliat, Chemin du Grand Mazières, 18000 Bourges</p>
      <div id="map"></div>
    </div>
    <nuxt-link to="/">Retour à l'accueil</nuxt-link>
  </div>
</template>

<script>
import L from 'leaflet'
import 'leaflet/dist/leaflet.css'

export default {
  name: 'AvironPage',
  mounted() {
    this.initMap()
  },
  methods: {
    initMap() {
      const map = L.map('map').setView([47.0582667, 2.3942562], 13)

      L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
      }).addTo(map)

      L.marker([47.0582667, 2.3942562]).addTo(map) 
        .bindPopup("Base Aviron Alice Milliat<br>Chemin du Grand Mazières, 18000 Bourges")
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
  height: 400px;
  width: 100%;
  margin-top: 20px;
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
