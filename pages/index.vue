<script setup>

const actualites = await useFetch('/api/content/article')
const evenements = await useFetch('/api/content/evenement')

const allActualites = actualites.data._value
const allEvenements = evenements.data._value


</script>


<template>
 <div>
 <h1 class="welcome-message">Bienvenue sur le site de l'Association Sportive !</h1>
 <div class="welcome-image">
 <!-- <img src="/public/img/sport.png" alt="Sports Association Welcome Image"> -->
 </div>
 <section class="news">
 <h2>Actualités</h2>
 <ul>
  <li v-for=" actu in allActualites">
    <div>
      <strong><h3>{{ actu.title }}</h3></strong>
      <p>{{ actu.description }}</p>
    </div>
  </li>
 </ul>
 </section>

 <section class="events">
 <h2>Événements à venir</h2>
  <div>
    <ul>
  <li v-for=" event in allEvenements">
    <div>
      <strong><h3>{{ event.title }}</h3></strong>
      <p>{{ event.plan }}</p>
    </div>
  </li>
 </ul>
  </div>
 </section>

 <!-- <section class="results">
 <h2>Résultats sportifs des compétitions</h2>
 <ul>
 <li>Football : Victoire 3-1 contre l'équipe locale</li>
 <li>Basket : Défaite 75-80 en finale</li>
 <li>Tennis : Victoire au tournoi régional</li>
 </ul>
 </section> -->
 </div>
</template>

<script>
export default {
 name: 'HomePage'
}
</script>

<style scoped>
.welcome-message {
 font-size: 2.5em;
 text-align: center;
 margin-top: 20px;
 color: #6A0DAD; /* Richer shade of violet for the headline */
}

nav {
 text-align: center;
 margin-top: 30px;
}

.welcome-image {
 display: flex; /* Enables flexbox layout which is great for centering */
 justify-content: center; /* Horizontally centers the content (the image) within the container */
 align-items: center; /* Vertically centers the content (if needed and applicable) */
 margin: 20px 0; /* Adds some space above and below the image */
 max-width: 100%; /* Ensures the container doesn't exceed the viewport width */
}

.welcome-image img {
 max-width: 100%; /* Ensures the image scales with the container */
 width: 60%; /* Set the desired width of the image */
 height: auto; /* Maintains the aspect ratio of the image */
 display: block;
}
.sport-list {
 list-style-type: none;
 padding: 0;
}

.sport-list li {
 display: inline-block;
 margin: 10px 15px;
}

.sport-list li a {
 text-decoration: none;
 color: #9C27B0; /* Softer medium violet */
 font-size: 1.5em;
 transition: color 0.3s;
}

.sport-list li a:hover {
 color: #7B1FA2; /* Slightly darker violet for hover effect */
}

section {
 margin-top: 40px;
 margin-bottom: 20px; /* Adds space between sections */
 background: linear-gradient(135deg, #E1BEE7 0%, #EDE7F6 50%, #D1C4E9 100%); /* Gradient from light violet to a soft grey and back to light violet */
 color: #4A0072; /* Dark violet text color for contrast */
 padding: 15px; /* Reduced padding for a smaller box */
 border-radius: 10px;
 box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Soft shadow for depth */
 max-width: 75%; /* Limit the width of each section */
 margin-left: auto; /* Center the section */
 margin-right: auto; /* Center the section */
}

h2 {
 font-size: 2em; /* Smaller font size for headers */
 font-weight: bold;
 text-transform: uppercase;
 margin-bottom: 10px;
}

ul {
 list-style-type: none; /* Remove bullets */
 padding-left: 0;
 font-size: 1.2em;
}

li {
 margin-bottom: 10px;
 background-color: rgba(255, 255, 255, 0.2); /* Slightly more opaque white for list items */
 padding: 10px;
 border-radius: 5px;
}
</style>