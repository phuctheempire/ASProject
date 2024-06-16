<template>
  <div class="relative">
    <nuxt-link to="/" class="absolute top-4 right-4 bg-purple-500 text-white px-4 py-2 rounded-md shadow-md">
      Se connecter
    </nuxt-link>
    <div class="container mx-auto p-4">
      <img src="/img/logoAS.png" alt="Logo de l'association" class="absolute top-0 left-0 h-16 w-auto z-10 mt-4 ml-4">
      <h1 class="welcome-message">Bienvenue sur le site de l'Association Sportive !</h1>
      <nav>
        <ul class="sport-list">
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
        </ul>
      </nav>

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
  margin-top: 40px;
  color: #333;
}

nav {
  text-align: center;
  margin-top: 30px;
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
  color: #4B0082;
  font-size: 1.5em;
  transition: color 0.3s;
}

.sport-list li a:hover {
  color: #0056b3;
}

section {
  margin-top: 40px;
}

h2 {
  color: #555;
  font-size: 2em;
  border-bottom: 2px solid #ddd;
  padding-bottom: 10px;
}

ul {
  list-style-type: disc;
  margin-left: 20px;
  font-size: 1.2em;
}

li {
  margin-bottom: 10px;
}

img {
  height: 8rem; 
  width: auto; 
}
</style>
