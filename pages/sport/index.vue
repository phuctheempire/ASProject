<template>
  <div class="container">
  <div class="relative">
  <nuxt-link to="/" class="absolute top-4 right-4 btn-back">
  Retour à l'accueil
  </nuxt-link>
  </div>
  <div>
  <!-- <h1><ContentRenderer :value="data"></ContentRenderer></h1> -->
  <!-- Bo phan markdown ( Noi dung o duoi --- ) -->
  </div>
 
  <div class="image-container">
  <img src="/img/respovolley.jpeg" alt="Photo du responsable" class="responsable-photo">
  <div class="overlay">
  <div class="text">nametest</div>
  </div>
  </div>
 
  <div class="info">
  <h2>Informations</h2>
  <div>
  <strong id="responsables">Responsables :</strong>
  <!-- <div v-for="(item,index) in data.responsables" :key="index"> -->
  <div class="responsable-card">
  <h3>nametest</h3>
  <p>test@gmail.com</p>
  </div>
  <!-- Cach parcours list -->
  </div>
  <p><strong>Jours et Horaires :</strong></p>
  <!-- <ul>
  <li v-for="(item,index) in data.jours_horaires" :key="index"> -->
  <p>Jeudi</p>
  <p>11h00 - 12h00</p>
  <!-- </li> -->
  <!-- </ul> -->
  <h2>Lieu</h2>
  <p>test.lieu</p>
  </div>
  <!--<div class="location">-->
  <!-- <div id="map"></div> -->
  <!--</div>-->
  <!-- </div> -->
  </div>
  </template>
  
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
  background-color: #6200ea; /* Violet */
  color: white;
  padding: 10px 20px;
  border-radius: 5px;
  text-decoration: none;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  transition: background-color 0.3s ease;
  }
  
  .btn-back:hover {
  background-color: #3700b3;
  }
  
  .info, .location {
  margin-bottom: 20px;
  }
  
  h1, h2 {
  color: #6200ea; /* Violet */
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
  
  p, ul {
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
  
  strong#responsables {
  font-size: 2em;
  font-weight: bold;
  }
  
  .responsable-card {
  display: inline-block;
  margin: 20px;
  text-align: center;
  }
  
  .image-container {
  text-align : center;
  position: relative;
  width: 150px;
  height: 150px;
  margin-bottom : 20px;
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