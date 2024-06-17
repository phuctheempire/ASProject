<template>
  <div>
    <div class="relative">
      <nuxt-link to="/" class="absolute top-4 right-4 bg-blue-500 text-white px-4 py-2 rounded-md shadow-md">
        Retour à l'accueil
      </nuxt-link>
    </div>
    <div>
      <h1><ContentRenderer :value="data"></ContentRenderer></h1> 
      <!-- Bo phan markdown ( Noi dung o duoi --- ) -->
    </div>
    
    <div class="info">
      <h2>Informations</h2>
      <div>
        <strong>Responsables :</strong>
        <div v-for="(item,index) in data.responsables" :key="index">
          <strong><h3>{{ item.responsable.name }}</h3></strong>
          <p>{{ item.responsable.email }}</p>
          <!-- Cach parcours list -->
        </div>
      </div>
      <p><strong>Jours et Horaires :</strong></p>
      <ul>
        <li v-for="(item,index) in data.jours_horaires" :key="index">
          <p>{{ item.jh.jour }}</p>
          <p>{{ item.jh.horaires }}</p>
        </li>
      </ul>
    </div>
    <div class="location">
      <h2>Lieu</h2>
      <p> {{data.lieu}}</p>
      <div id="map"></div>
    </div>
  </div>
</template>


<script setup>
let { data } = await useAsyncData('natation', () => queryContent('/natation').findOne())
console.log(data)
console.log('hello')
</script>

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
