<template>
  <div class="relative">
      <nuxt-link to="/login" class="absolute top-4 right-4 bg-purple-500 text-white px-4 py-2 rounded-md shadow-md">
    Se connecter
  </nuxt-link>
    <div class="container mx-auto p-4">
      <img src="/img/logoAS.png" alt="Logo de l'association" class="absolute top-0 left-0 h-16 w-auto z-10 mt-4 ml-4">
      <h1 class="welcome-message">Bienvenue sur le site de l'Association Sportive !</h1>
      <nav>
        <select v-model="selectedSport" @change="navigateToSport(selectedSport)" class="sport-select">
          <option disabled value="">Sélectionnez un sport</option>
          <option v-for="sport in sports" :key="sport.id" :value="sport.link">
            {{ sport.name }}
          </option>
        </select>
      </nav>
    
      <div>
        <h2>Actualités</h2>
        <div class="news-container">
          <div v-for="article in news" :key="article.title" class="news-article">
            <h2>{{ article.title }}</h2>
            <p class="news-meta">
              Publié le {{ formatDate(article.createdAt) }} par {{ article.author }}
            </p>
            <p>{{ article.content }}</p>
          </div>
        </div>
      </div>

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
  name: 'HomePage',
  data() {
    return {
      sports: [], // Les sports récupérés de la base de données
      selectedSport: '', // Sport sélectionné dans le menu déroulant
      news: [
        { title: "Titre de l'actualité 1", content: "Contenu de l'actualité 1...", createdAt: "2023-06-01", author: "Auteur 1" },
        { title: "Titre de l'actualité 2", content: "Contenu de l'actualité 2...", createdAt: "2023-06-10", author: "Auteur 2" }
      ]
    };
  },
  mounted() {
    this.fetchSports();
  },
  methods: {
    fetchSports() {
      // On doit utiliser ici soit axios soit fetch pour récupérer les données de l'API que Phuc est entrain de faire
      this.sports = [
        { id: 1, name: "Football", link: "/foot" },
        { id: 2, name: "Basket", link: "/basket" },
        // J'ai mis ça juste pour tester, normalement on doit faire ça dynamiquement en liaison avec la Bdd
      ];
    },
    navigateToSport(link) {
      this.$router.push(link);
    },
    formatDate(dateStr) {
      const options = { year: 'numeric', month: 'long', day: 'numeric' };
      return new Date(dateStr).toLocaleDateString(undefined, options);
    }
  }
}
</script>


<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap');
.welcome-message {
  font-size: 2.4em;
  font-weight: bold;
  font-family:'Poppins',sans-serif;
  text-align: center;
  margin-top: 40px;
  color: #333;
}

nav {
  text-align: center;
  margin-top: 30px;
}

.sport-select {
  font-size: 1.1em;
  padding: 10px;
  margin: 20px auto;
  display: block;
  width: 200px; 
}

section {
  margin-top: 40px;
}

.news-container {
  display: flex;
  flex-direction: column;
  gap: 20px;
}

.news-article {
  border: 1px solid #ccc;
  padding: 20px;
  border-radius: 10px;
  font-size:12px;
  background-color: #f9f9f9;
}

.news-meta {
  color: #666;
  font-size: 0.9em;
  margin-bottom: 10px;
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
