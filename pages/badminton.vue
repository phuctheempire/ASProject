<template>
  <div>
    <div class="relative">
      <nuxt-link to="/" class="absolute top-4 right-4 bg-blue-500 text-white px-4 py-2 rounded-md shadow-md">
        Retour à l'accueil
      </nuxt-link>
    </div>  
    
    <!-- Section pour Bourges -->
    <div>
      <h1>Page de Badminton - Bourges</h1>
      <p>Bienvenue sur la page dédiée au badminton à Bourges !</p>
      <div class="info">
        <h2>Informations</h2>
        <p><strong>Responsables :</strong> Manon et Romane</p>
        <p><strong>Jours et Horaires :</strong></p>
        <ul>
          <li>Jeudi : 13h45 - 15h30</li>
        </ul>
      </div>
      <div class="location">
        <h2>Lieu</h2>
        <p>Gymnase Yves du manoir, 74 Rue de Turly, 18000 Bourges</p>
        <div id="map-bourges"></div>
      </div>
    </div>
    
    <!-- Section pour Blois -->
    <div>
      <h1>Page de Badminton - Blois</h1>
      <p>Bienvenue sur la page dédiée au badminton à Blois !</p>
      <div class="info">
        <h2>Informations</h2>
        <p><strong>Responsable :</strong> Fanny</p>
        <p><strong>Jours et Horaires :</strong></p>
        <ul>
          <li>Mardi : 17h00 - 18h30</li>
        </ul>
      </div>
      <div class="location">
        <h2>Lieu</h2>
        <p>Gymnase Pierre de Coubertin, Rue des Quatre Vents, 41000 Blois</p>
        <div id="map-blois"></div>
      </div>
    </div>
  </div>
</template>

<script>
import L from 'leaflet'
import 'leaflet/dist/leaflet.css'

export default {
  name: 'BadmintonPage',
  mounted() {
    this.initMapBourges();
    this.initMapBlois();
  },
  methods: {
    initMapBourges() {
      const mapBourges = L.map('map-bourges').setView([47.0998228, 2.4178353], 13);

      L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
      }).addTo(mapBourges);

      L.marker([47.0998228, 2.4178353]).addTo(mapBourges)
        .bindPopup("Gymnase Yves du manoir<br>74 Rue de Turly, 18000 Bourges")
        .openPopup();
    },
    initMapBlois() {
      const mapBlois = L.map('map-blois').setView([47.5860922, 1.335947], 13);

      L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
      }).addTo(mapBlois);

      L.marker([47.5860922, 1.335947]).addTo(mapBlois)
        .bindPopup("Gymnase Pierre de Coubertin<br>Rue des Quatre Vents, 41000 Blois")
        .openPopup();
    }
  }
}
</script>

<style scoped>
.info, .location {
  margin-bottom: 20px;
}

#map-bourges, #map-blois {
  height: 200px;
  width: 50%;
  margin-top: 20px;
  margin-left: auto;
  margin-right: auto;
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
