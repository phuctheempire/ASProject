<script setup>
 
</script>


<template>
 <div>
 <nav>
 <!-- <ul class="sport-list">
 <li><nuxt-link to="/badminton">Badminton</nuxt-link></li>
 <li><nuxt-link to="/basket">Basket</nuxt-link></li>
 <li><nuxt-link to="/cheer">Cheerleading</nuxt-link></li>
 <li><nuxt-link to="/foot">Football</nuxt-link></li>
 <li><nuxt-link to="/handball">Handball</nuxt-link></li>
 <li><nuxt-link to="/natation">Natation</nuxt-link></li>
 <li><nuxt-link to="/rugby">Rugby</nuxt-link></li>
 <li><nuxt-link to="/tennis">Tennis</nuxt-link></li>
 <li><nuxt-link to="/ultimate">Ultimate</nuxt-link></li>
 <li><nuxt-link to="/volley">Volley</nuxt-link></li>
 <li><nuxt-link to="/aviron">Aviron</nuxt-link></li>
 <li><nuxt-link to="/running">Running</nuxt-link></li>
 <li><nuxt-link to="/responsables">Responsables</nuxt-link></li>
 </ul> -->
 </nav>
 <h1 class="welcome-message">Bienvenue sur le site de l'Association Sportive !</h1>
 <div class="welcome-image">
 <!-- <img src="/public/img/sport.png" alt="Sports Association Welcome Image"> -->
 </div>
 <section class="news">
 <h2>Actualités</h2>
 <ul>
 <li>Nouvelle saison de football commence le 1er septembre</li>
 <li>Stage de basket cet été</li>
 <li>Équipe de tennis gagne le tournoi régional</li>
 </ul>
 </section>

 <section class="events">
 <h2>Événements à venir</h2>
 <ul>
 <li>Tournoi de football le 15 juillet</li>
 <li>Match de basket amical le 20 juillet</li>
 <li>Compétition d'aviron le 25 juillet</li>
 </ul>
 </section>

 <section class="results">
 <h2>Résultats sportifs des compétitions</h2>
 <ul>
 <li>Football : Victoire 3-1 contre l'équipe locale</li>
 <li>Basket : Défaite 75-80 en finale</li>
 <li>Tennis : Victoire au tournoi régional</li>
 </ul>
 </section>
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