<template>
  <div class="admin-container">
    <h1>Page d'Administration</h1>
    <div v-for="(item, index) in items" :key="index" class="item-editor">
      <input v-model="item.title" placeholder="Titre">
      <textarea v-model="item.content" placeholder="Contenu"></textarea>
      <button @click="saveItem(item)">Sauvegarder</button>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      items: [
        { title: 'Nouvelle Actualité', content: 'Contenu de l\'actualité' },
        { title: 'Nouveau résultat', content: 'Détails' }
      ]
    };
  },
  methods: {
    saveItem(item) {
      alert(`Sauvegardé! Titre: ${item.title}, Contenu: ${item.content}`);
      // Ajouter ici la logique pour sauvegarder les données via une API.
    }
  }
}
</script>

<style scoped>

.admin-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  min-height: 100vh;
  margin: auto;
  padding: 40px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  width: 80%;
  max-width: 600px;
  background-color: #f9f9f9;
  border-radius: 10px;
}

.item-editor {
  width: 100%;
  margin-bottom: 20px;
}

input[type="text"],
textarea {
  width: 100%;
  padding: 15px;
  border: 2px solid #B0BEC5; 
  border-radius: 8px; 
  font-size: 15px; 
  box-shadow: inset 0 1px 3px rgba(0,0,0,0.12); 
  transition: border-color 0.3s ease-in-out; 
}

input[type="text"]:focus,
textarea:focus {
  border-color: #78909C; 
  outline: none; 
  box-shadow: inset 0 2px 4px rgba(0,0,0,0.18); 
}

button {
  width: 100%;
  padding: 12px;
  background-color: #4B0082;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size: 18px;
  transition: background-color 0.3s;
}

button:hover {
  background-color: #662E9B;
}

h1 {
  color: #555;
  font-size: 2em;
  border-bottom: 2px solid #ddd;
  padding-bottom: 15px;
  font-family:'Poppins',sans-serif;
}
</style>

